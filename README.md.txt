# Advanced Sales Analytics using SQL

## Project Overview

This project demonstrates advanced analytical techniques using SQL to extract meaningful business insights from a sales data warehouse.  
The analysis goes beyond basic exploratory analysis and focuses on time-based trends, cumulative metrics, performance benchmarking, segmentation, and report-ready outputs.

The project is structured to reflect real-world analytical workflows followed by Data Analysts and Analytics Engineers.

---

## Business Objectives

The key objectives of this project are:

- Analyze sales performance over time (yearly and monthly)
- Track cumulative sales growth and moving averages
- Evaluate product performance using benchmarks and year-over-year analysis
- Identify category contributions using part-to-whole analysis
- Segment customers based on spending behavior and lifespan
- Build reusable customer and product reports for business stakeholders

---

## Project Structure

Advanced_Analytics_Project
│
├── 01_changes_over_time.sql
├── 02_cumulative_analysis.sql
├── 03_performance_analysis.sql
├── 04_part_to_whole_analysis.sql
├── 05_data_segmentation.sql
├── 06_customer_report.sql
├── 07_product_report.sql


---

## File Descriptions

### 01_changes_over_time.sql
Analyzes sales performance over time by year and month to identify trends and seasonality.

### 02_cumulative_analysis.sql
Calculates running totals and moving averages to understand long-term growth patterns.

### 03_performance_analysis.sql
Evaluates yearly product performance using:
- Average sales benchmarks
- Year-over-Year (YoY) comparison
- Increase / Decrease indicators using window functions

### 04_part_to_whole_analysis.sql
Identifies how much each product category contributes to overall sales using percentage-of-total logic.

### 05_data_segmentation.sql
Segments customers into:
- VIP
- Regular
- New  

Based on customer lifespan (in months) and total spending behavior.

### 06_customer_report.sql
Creates a comprehensive customer-level analytical report as a SQL view.

### 07_product_report.sql
Creates a detailed product-level analytical report as a SQL view.

---

## Analytical Techniques Used

- Common Table Expressions (CTEs)
- Window Functions (`SUM() OVER`, `AVG() OVER`, `LAG`)
- Time-based analysis (`YEAR`, `DATETRUNC`, `DATEDIFF`)
- Cumulative and moving average analysis
- Year-over-Year (YoY) comparison
- Part-to-whole contribution analysis
- Customer and product segmentation using CASE statements
- KPI calculations
- Creation of reusable SQL views

---

## Key Business Questions Answered

- How do sales and customer counts change over time?
- What is the cumulative growth trend of revenue?
- Which products perform above or below average?
- How does product performance change year-over-year?
- Which categories contribute the most to total sales?
- How can customers be segmented based on value and longevity?
- Who are the most valuable customers?
- Which products drive the most revenue and engagement?

---

## Customer Report

The customer report consolidates key customer metrics and behaviors, including:

- Total orders
- Total sales
- Total quantity purchased
- Total products purchased
- Customer lifespan (months)
- Recency (months since last order)
- Average order value
- Average monthly spend
- Customer segment (VIP / Regular / New)

This report is created as a SQL view for reusability and reporting.

---

## Product Report

The product report provides a complete view of product performance, including:

- Product name, category, subcategory, and cost
- Total orders
- Total sales
- Total quantity sold
- Unique customer count
- Product lifespan (months)
- Recency (months since last sale)
- Average order revenue
- Average monthly revenue
- Product performance segmentation

This report is also created as a SQL view for easy downstream analysis.

---

## Tools & Technologies

- SQL Server (T-SQL)
- SQL Server Management Studio (SSMS)
- Relational Data Warehouse (Fact and Dimension tables)
- GitHub for version control and portfolio presentation

---

## ▶️ How to Run the Project

1. Load the dataset into SQL Server
2. Ensure fact and dimension tables are available
3. Execute SQL files in sequence (01 to 07)
4. Query the created views for analysis and reporting

---

##  Future Enhancements

- Add indexing and performance optimization
- Convert logic into stored procedures
- Connect SQL views to Power BI or Tableau
- Extend analysis to cohort and retention modeling
- Automate data refresh pipelines

---

## ⭐ Final Note

This project demonstrates strong SQL fundamentals, advanced analytical thinking, and business-oriented problem solving.  
It reflects industry-style analytical workflows rather than simple query writing.

