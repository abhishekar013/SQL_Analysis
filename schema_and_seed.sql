-- Create Database
CREATE DATABASE IF NOT EXISTS Ecommerce_SQL_Database;
USE Ecommerce_SQL_Database;

-- 1. Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    signup_date DATE
);

-- 2. Products Table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL
);

-- 3. Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Order Items Table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Sample Seed Data
INSERT INTO customers (customer_name, city, signup_date) VALUES 
('Alice Smith', 'New York', '2025-01-10'),
('Bob Jones', 'Chicago', '2025-02-15'),
('Charlie Brown', 'New York', '2025-03-01'),
('Diana Prince', 'San Francisco', '2025-03-20');

INSERT INTO products (product_name, category, price) VALUES 
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Desk Chair', 'Furniture', 150.00),
('Running Shoes', 'Sports', 90.00);

INSERT INTO orders (customer_id, order_date, status) VALUES 
(1, '2025-04-01', 'Completed'),
(2, '2025-04-05', 'Completed'),
(1, '2025-04-10', 'Pending'),
(3, '2025-04-12', 'Completed');

INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(1, 1, 1),
(1, 4, 2),
(2, 2, 1),
(3, 3, 2),
(4, 2, 1);
