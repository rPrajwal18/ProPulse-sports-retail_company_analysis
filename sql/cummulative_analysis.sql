--Cummilative analysis 

-- calculate total sales per month and running total of sales over time
SELECT order_date,
	   total_sales,
	   SUM(total_sales) OVER(ORDER BY order_date) AS running_total_sales,
	   avg_price,
	   AVG(avg_price) OVER(ORDER BY order_date) AS moving_avg_price
FROM
(
SELECT DATETRUNC(YEAR, order_date) AS order_date,
	   SUM(sales_amount) AS total_sales,
	   AVG(price) AS avg_price
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(YEAR, order_date)
) AS t
; 
