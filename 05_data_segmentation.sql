/*Segment products into cost ranges and
count how many products fall into each segment */
WITH product_segment AS (
SELECT
product_key,
product_name,
cost,
CASE WHEN cost < 100 THEN 'Below 100'
	 WHEN cost BETWEEN 100 AND 500 THEN '100-500'
	 WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
	 ELSE 'Above 1000'
	 END AS cost_range
FROM [gold.dim_products] )

SELECT
cost_range,
COUNT(*) AS total_products
FROM product_segment
GROUP BY cost_range;

/* Group customers into three segments based on their spending behaviour:
-VIP: Customers with atleast 12 months of history and spending more than 5000.
-Regular: Customers with atleast 12 months of history but spending 5000 or less.
-New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group */
WITH customer_spending AS (
SELECT
c.customer_key,
SUM(s.sales_amount) AS total_spending,
MIN(s.order_date) AS first_order,
MAX(s.order_date) AS last_order,
DATEDIFF(MONTH, MIN(s.order_date), MAX(s.order_date) ) AS lifespan
FROM [gold.fact_sales] s
LEFT JOIN [gold.dim_customers] c
ON s.customer_key = c.customer_key
WHERE order_date IS NOT NULL
GROUP BY c.customer_key
)
,cte_customer_segment AS (
SELECT 
customer_key,
total_spending,
lifespan,
CASE WHEN lifespan >=12 AND total_spending > 5000 THEN 'VIP'
	 WHEN lifespan >=12 AND total_spending <= 5000 THEN 'Regular'
	 WHEN lifespan <12 THEN 'New'
	 END AS customer_segment
FROM customer_spending)

SELECT 
customer_segment,
COUNT(*) AS total_customers
FROM cte_customer_segment
GROUP BY customer_segment
