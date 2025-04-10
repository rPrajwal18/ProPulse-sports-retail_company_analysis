--Change over time trends 

--changes over years
SELECT YEAR(order_date) AS order_year, 
	   SUM(sales_amount) AS total_sales,
	   COUNT(DISTINCT customer_key) AS customer_count,
	   SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date);

--OR changes over the months of every year

SELECT DATETRUNC(MONTH, order_date) AS order_year_month, 
	   SUM(sales_amount) AS total_sales,
	   COUNT(DISTINCT customer_key) AS customer_count,
	   SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH, order_date)
ORDER BY DATETRUNC(MONTH, order_date);