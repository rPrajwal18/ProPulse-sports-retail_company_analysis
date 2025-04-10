--Proportional analysis 

-- total sales
WITH category_sales AS (
SELECT p.category AS category, 
	   SUM(s.sales_amount) AS total_sales
FROM gold_fact_sales AS s
LEFT JOIN gold_dim_products AS p
	ON s.product_key = p.product_key
GROUP BY p.category
)
SELECT 
category,
total_sales,
SUM(total_sales) OVER() AS overall_sales,
CONCAT(ROUND((CAST(total_sales AS FLOAT)/(SUM(total_sales) OVER()) * 100), 2), '%') AS sales_percent
FROM category_sales
ORDER BY sales_percent DESC
;

-- customer count
WITH customer_per_category AS (
SELECT p.category AS category,
	   COUNT(DISTINCT c.customer_number) AS customer_count
FROM gold_fact_sales AS s
LEFT JOIN gold_dim_products AS p
	ON s.product_key = p.product_key
LEFT JOIN gold_dim_customers AS c
	ON s.customer_key = c.customer_key
GROUP BY p.category
)
SELECT 
category,
customer_count,
SUM(customer_count) OVER() AS overall_customers,
CONCAT(ROUND(CAST((customer_count) AS FLOAT)/(SUM(customer_count) OVER()) * 100, 2), '%') AS customer_percent
FROM customer_per_category
;
