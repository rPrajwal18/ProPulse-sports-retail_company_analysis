--data segmentation

--simple scenario
WITH product_segment AS 
(
SELECT 
product_key,
product_name,
cost,
CASE 
	WHEN cost < 100 THEN 'Below 100'
	WHEN cost BETWEEN 100 AND 500 THEN '100-500'
	WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
	ELSE 'Above 1000'
END AS cost_range
FROM gold_dim_products
)
SELECT 
cost_range,
COUNT(product_key) AS total_products
FROM product_segment
GROUP BY cost_range
ORDER BY total_products DESC
;

--data segmentation  -advance scenario
WITH customer_spending AS 
(
SELECT 
c.customer_key AS customer_key,
SUM(s.sales_amount) AS total_spending,
MIN(s.order_date) AS first_order,
MAX(s.order_date) AS last_order,
DATEDIFF(MONTH, MIN(s.order_date), MAX(s.order_date)) AS lifespan_customer
FROM gold_fact_sales AS s
LEFT JOIN gold_dim_customers AS c
	 ON s.customer_key = c.customer_key
GROUP BY c.customer_key
)

SELECT 
customer_segments,
COUNT(customer_key) AS total_customer
FROM (
SELECT 
customer_key,
total_spending,
lifespan_customer,
CASE 
	WHEN lifespan_customer >= 12 AND total_spending > 5000 THEN 'VIP'
	WHEN lifespan_customer >= 12 AND total_spending <= 5000 THEN 'Regular'
	ELSE 'New'
END AS customer_segments
FROM customer_spending
) AS t
GROUP BY customer_segments
ORDER BY total_customer DESC
;