/*=================================================================================
Product report
===================================================================================
Purpose:
    -This report consolidates key product metrics and behaviours.

Highlights:
    1. Gathers essential fields such as name, category, subcategory and cost.
    2. Segments products by revenue to identify High-performers, Mid-range, or Low-performers.
    3. Aggregates product-level metrics:
        - total orders
        - total sales
        - total quantity sold
        - total customers (unique)
        - lifespan (in months)
    4. Calculate valuable KPIs:
        - recency (months since last sale)
        - average order revenue (AOR)
        - average monthly revenue
    ==================================================================================*/
    CREATE VIEW report_products AS 
    WITH base_query AS (
    /*--------------------------------------------------------------------------------
    1)Base Query: Retrieves core columns from fact_sales and dim_products
    --------------------------------------------------------------------------------*/
    SELECT
    p.product_key,
    p.product_name,
    p.category,
    p.subcategory,
    p.cost,
    s.customer_key,
    s.order_number,
    s.order_date,
    s.quantity,
    s.sales_amount
    FROM [gold.fact_sales] s
    LEFT JOIN [gold.dim_products] p
        ON s.product_key = p.product_key
    WHERE order_date IS NOT NULL) --consider only valid sales dates

    ,product_aggregation AS (
    /*---------------------------------------------------------------------------------
    2) Product aggregation: Summarizes key metrics at the product level.
    ----------------------------------------------------------------------------------*/
    SELECT 
    product_key,
    category,
    subcategory,
    product_name,
    cost,
    COUNT( DISTINCT customer_key) AS total_customers,
    COUNT(DISTINCT order_number) total_orders,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan,
    MAX(order_date) AS last_sale_date,
    SUM(quantity) AS total_quantity,
    SUM(sales_amount) AS total_revenue,
    ROUND(AVG(CAST(sales_amount AS float)/NULLIF(quantity,0)),1) avg_selling_price
    FROM base_query
    GROUP BY product_key,
             category,
             subcategory,
             product_name,
             cost)
    /*---------------------------------------------------------------------------------
    Final Query: Combines all product results into one output.
    ---------------------------------------------------------------------------------*/

    SELECT 
    product_key,
    category,
    subcategory,
    product_name,
    cost,
    total_customers,
    total_orders,
    lifespan,
    last_sale_date,
    DATEDIFF(DAY, last_sale_date, GETDATE()) AS recency,
    total_quantity,
    total_revenue,
    CASE WHEN total_revenue > 50000 THEN 'High performer'
	     WHEN total_revenue >= 10000 THEN 'Mid - range'
	     ELSE 'Low performer'
         END AS product_segment,
--Compute average order revenue (AOR)
    
    CASE
	    WHEN total_orders = 0 THEN 0
	    ELSE total_revenue / total_orders
    END AS avg_order_revenue,
    --Average Monthly Revenue
    CASE 
	    WHEN lifespan = 0 THEN total_revenue
	    ELSE total_revenue / lifespan
    END AS avg_monthly_revenue
    FROM product_aggregation

    

   
             