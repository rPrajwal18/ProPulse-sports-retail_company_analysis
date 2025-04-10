--Products report

CREATE VIEW gold_report_products AS
WITH base_query AS 
(
--base query: retrieve core columns from table
SELECT 
f.order_date,
f.order_number,
f.customer_key,
f.sales_amount,
f.quantity,
p.product_number,
p.product_name,
p.category,
p.subcategory,
p.product_key,
p.cost
FROM gold_fact_sales AS f
LEFT JOIN gold_dim_products AS p
	ON f.product_key = p.product_key
WHERE order_date IS NOT NULL
)

, product_aggregates AS
(
--aggregating customer metrics
SELECT 
product_key,
product_name,
category,
subcategory,
cost,
COUNT(DISTINCT order_number) AS total_orders,
SUM(sales_amount) AS total_sales,
SUM(quantity) AS total_quantity,
COUNT(DISTINCT customer_key) AS total_customers,
MAX(order_date) AS last_sale_date,
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan_product,
ROUND(AVG(CAST(sales_amount AS FLOAT) / NULLIF(quantity, 0)), 1) AS avg_selling_price
FROM base_query
GROUP BY 
	product_key,
	product_name,
	category,
	subcategory,
	cost
)
SELECT *,
CASE 
	WHEN total_sales > 50000 THEN 'High Performer'
	WHEN total_sales >= 10000 THEN 'Mid Range'
	ELSE 'Low Performer'
END AS product_segment,
DATEDIFF(MONTH, last_sale_date, GETDATE()) AS recency_in_months,
--Compute average order revenue
CASE WHEN total_orders = 0 THEN 0
	 ELSE  total_sales / total_orders
END AS avg_order_revenue,
--Compute average monthly revenue
CASE WHEN lifespan_product = 0 THEN 0
	 ELSE total_sales / lifespan_product
END AS avg_monthly_revenue
FROM product_aggregates
;

--Getting the report
SELECT *
FROM gold_report_products;