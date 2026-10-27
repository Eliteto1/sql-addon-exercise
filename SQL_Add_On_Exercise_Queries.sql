-- =====================================================================
-- Add-On Exercise: Introduction to SQL for Beginners
-- Dataset: simple_orders_dataset (100 rows)
-- Columns: order_id, customer_name, city, product, quantity, price, order_date
-- =====================================================================

-- SETUP (run once)
-- 1. Create a schema (database) and select it.
-- 2. Import simple_orders.csv with: right-click Tables > Table Data Import Wizard.
--    Name the new table: simple_orders_dataset
CREATE DATABASE IF NOT EXISTS sql_addon;
USE sql_addon;

-- Check the import worked: expect 100 rows.
SELECT COUNT(*) AS rows_loaded FROM simple_orders_dataset;


-- Task 1: Retrieve all the records from the table.
-- Plain English: show every column of every order.
SELECT * FROM simple_orders_dataset;

-- Task 2: Display only the customer_name and city columns.
-- Plain English: show only who ordered and where they are.
SELECT customer_name, city FROM simple_orders_dataset;

-- Task 3: Get all orders made in the city of 'Enugu'.
-- Plain English: keep only rows where city is exactly Enugu.
-- Note: returns 0 rows, because Enugu is not in this dataset.
SELECT * FROM simple_orders_dataset WHERE city = 'Enugu';

-- Task 4: Retrieve orders where the quantity is more than 2.
-- Plain English: keep orders with quantity 3, 4 or 5 (59 rows).
SELECT * FROM simple_orders_dataset WHERE quantity > 2;

-- Task 5: Display the top 5 highest priced orders.
-- Plain English: sort by price from highest, keep the first 5.
SELECT * FROM simple_orders_dataset ORDER BY price DESC LIMIT 5;

-- Task 6: List all customers who ordered a 'Tablet' product.
-- Plain English: customers whose product is exactly Tablet.
-- Note: returns 0 rows, because Tablet is not in this dataset.
SELECT customer_name FROM simple_orders_dataset WHERE product = 'Tablet';

-- Task 7: Categorize orders by quantity with CASE.
-- 1 = 'Single', 2-3 = 'Small', more than 3 = 'Bulk'
-- Plain English: an if/else chain that labels each order by its quantity.
SELECT customer_name, quantity,
CASE
  WHEN quantity = 1 THEN 'Single'
  WHEN quantity BETWEEN 2 AND 3 THEN 'Small'
  ELSE 'Bulk'
END AS order_size
FROM simple_orders_dataset;

-- Task 8: Sort all orders from Port Harcourt by price (highest first).
-- Plain English: keep Port Harcourt orders, then put the most expensive first (21 rows).
SELECT * FROM simple_orders_dataset WHERE city = 'Port Harcourt' ORDER BY price DESC;

-- Task 9: Show only the unique product types sold in the dataset.
-- Plain English: list each product name once (5 products).
SELECT DISTINCT product FROM simple_orders_dataset;

-- Task 10: Final Challenge: Lagos orders for 'Laptop' with price tiers.
-- below 50,000 = 'Low'; 50,000 to 150,000 = 'Medium'; above 150,000 = 'High'
-- Plain English: keep orders that are both in Lagos and for a Laptop, then label the price (4 rows).
SELECT customer_name, price,
CASE
  WHEN price < 50000 THEN 'Low'
  WHEN price BETWEEN 50000 AND 150000 THEN 'Medium'
  ELSE 'High'
END AS price_tier
FROM simple_orders_dataset
WHERE city = 'Lagos' AND product = 'Laptop';
