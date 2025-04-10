--Customer report

CREATE VIEW gold_report_customers AS
WITH base_query AS 
(
--base query: retrieve core columns from table
SELECT 
f.order_date,
f.order_number,
f.product_key,
f.sales_amount,
f.quantity,
c.customer_number,
c.customer_key,
CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
DATEDIFF(YEAR, c.birthdate, GETDATE()) AS customer_age
FROM gold_fact_sales AS f
LEFT JOIN gold_dim_customers AS c
	on f.customer_key = c.customer_key
)

, customer_aggregates AS
(
--aggregating customer metrics
SELECT 
customer_key,
customer_number,
customer_name,
customer_age,
COUNT(DISTINCT order_number) AS total_count,
SUM(sales_amount) AS total_sales,
SUM(quantity) AS total_quantity,
COUNT(DISTINCT product_key) AS total_products,
MAX(order_date) AS last_order_date,
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan_customer
FROM base_query
GROUP BY 
	customer_key,
	customer_number,
	customer_name,
	customer_age
)
SELECT *,
CASE 
	WHEN customer_age < 20 THEN 'Below 20'
	WHEN customer_age BETWEEN 21 AND 29 THEN '20-29'
	WHEN customer_age BETWEEN 30 AND 39 THEN '30-39'
	WHEN customer_age BETWEEN 40 AND 49 THEN '40-49'
	ELSE 'Above 50'
END AS age_groups,
CASE 
	WHEN lifespan_customer >= 12 AND total_sales > 5000 THEN 'VIP'
	WHEN lifespan_customer >= 12 AND total_sales <= 5000 THEN 'Regular'
	ELSE 'New'
END AS customer_segments,
DATEDIFF(MONTH, last_order_date, GETDATE()) AS recency,
--Compute average order value
CASE WHEN total_count = 0 THEN 0
	 ELSE  total_sales / total_count
END AS avg_order_value,
--Compute average monthly spend
CASE WHEN lifespan_customer = 0 THEN 0
	 ELSE total_sales / lifespan_customer
END AS avg_monthly_spend
FROM customer_aggregates
;

SELECT *
FROM gold_report_customers;