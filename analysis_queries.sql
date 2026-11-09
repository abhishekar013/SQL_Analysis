USE Ecommerce_SQL_Database;

-- ==========================================
-- A. SELECT, WHERE, ORDER BY, GROUP BY
-- ==========================================
-- Find total revenue generated per product category, ordered highest to lowest
SELECT 
    p.category, 
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- ==========================================
-- B. JOINS (INNER, LEFT, RIGHT)
-- ==========================================
-- INNER JOIN: List all orders with customer names and cities
SELECT o.order_id, c.customer_name, c.city, o.order_date, o.status
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- LEFT JOIN: List all customers and their orders (including customers with no orders)
SELECT c.customer_id, c.customer_name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;


-- ==========================================
-- C. SUBQUERIES
-- ==========================================
-- Find customers who have spent more than the average total spending across all customers
SELECT c.customer_id, c.customer_name, SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spent > (
    SELECT AVG(customer_total) 
    FROM (
        SELECT SUM(oi2.quantity * p2.price) AS customer_total
        FROM customers c2
        JOIN orders o2 ON c2.customer_id = o2.customer_id
        JOIN order_items oi2 ON o2.order_id = oi2.order_id
        JOIN products p2 ON oi2.product_id = p2.product_id
        GROUP BY c2.customer_id
    ) AS avg_table
);


-- ==========================================
-- D. AGGREGATE FUNCTIONS (SUM, AVG)
-- ==========================================
-- Calculate overall total sales revenue and average order value
SELECT 
    SUM(oi.quantity * p.price) AS grand_total_revenue,
    AVG(oi.quantity * p.price) AS average_item_value
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;


-- ==========================================
-- E. CREATE VIEWS FOR ANALYSIS
-- ==========================================
-- Create a view summarizing customer purchase metrics for reporting dashboards
CREATE VIEW vw_customer_summary AS
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name;

-- Query the created view
SELECT * FROM vw_customer_summary;


-- ==========================================
-- F. OPTIMIZE QUERIES WITH INDEXES
-- ==========================================
-- Add an index on order date to optimize chronological filtering and range queries
CREATE INDEX idx_orders_date ON orders(order_date);

-- Add an index on product category to speed up category aggregations
CREATE INDEX idx_products_category ON products(category);
