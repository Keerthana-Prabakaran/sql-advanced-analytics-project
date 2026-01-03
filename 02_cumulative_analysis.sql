--Calculate the total sales per month
--and the running total of sales over time
WITH cte_total_sales AS (
SELECT
DATETRUNC(month,order_date) AS order_month,
SUM(sales_amount) AS total_sales,
AVG(price) AS avg_price
FROM [gold.fact_sales]
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date))

SELECT 
order_month,
total_sales,
sum(total_sales) OVER(ORDER BY order_month) AS running_total_sales,
AVG(avg_price) OVER(ORDER BY order_month) AS moving_average_price
FROM cte_total_sales