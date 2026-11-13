# SQL_Analysis
# Task 3: SQL for Data Analysis 

## Objective
Extract, transform, and analyze relational data from an e-commerce database (`Ecommerce_SQL_Database`) using MySQL.  
 
## Files Included
1. **`schema_and_seed.sql`**: Database setup script defining tables (`customers`, `products`, `orders`, `order_items`) and dummy insert data.
2. **`analysis_queries.sql`**: Comprehensive query script covering filtering, grouping, joins, subqueries, aggregates, view creation, and index optimization.

## Key SQL Concepts Applied
* **Filtering & Aggregation**: `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `SUM()`, `AVG()`
* **Relational Joins**: `INNER JOIN`, `LEFT JOIN`
* **Advanced Queries**: Correlated/Derived Subqueries and `HAVING` clauses
* **Database Views**: Created reusable analytical views (`vw_customer_summary`)
* **Performance Tuning**: Created indexes (`idx_orders_date`, `idx_products_category`) to optimize execution speed.
