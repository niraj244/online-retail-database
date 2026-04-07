-- ================================================
-- Online Retail Application Database
-- File: queries.sql
-- Description: 10 analytical business queries
-- Run schema.sql and data.sql before this file
-- Run views.sql before this file (requires Customers_Master)
-- ================================================


-- QUERY 1
-- Business Question: What is the total amount spent by all customers?
SELECT SUM(AmountSpent) AS "TOTAL AMOUNT SPENT"
FROM Customers_Master;
-- Result: 5620.97


-- QUERY 2
-- Business Question: Which products are sold with a price more than $25?
SELECT ProductName AS "PRODUCTS WITH PRICE > 25", COUNT(*) AS "AMOUNT SOLD"
FROM Products
WHERE ProductUnitPrice > 25
GROUP BY ProductName;
-- Result: MagSafe Phone Case (1)


-- QUERY 3
-- Business Question: What is the average order total amount for all orders?
SELECT AVG(OrderTotalAmount) AS "AVERAGE ORDER TOTAL AMOUNT"
FROM Orders;
-- Result: 44


-- QUERY 4
-- Business Question: Which customer spent the highest amount of money and how much?
SELECT CustomerName AS "HIGHEST SPENDING CUSTOMER", AmountSpent AS "AMOUNT SPENT"
FROM Customers_Master
ORDER BY AmountSpent DESC
LIMIT 1;
-- Oracle syntax: replace LIMIT 1 with FETCH FIRST 1 ROW ONLY
-- Result: Chad Wick - $524


-- QUERY 5
-- Business Question: How many orders were placed in January 2023?
SELECT COUNT(*) AS "ORDERS PLACED IN JANUARY 2023"
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-01-31';
-- Result: 5


-- QUERY 6
-- Business Question: What are the names of customers who placed orders
--                   along with the total amount of their orders?
SELECT c.CustomerName, SUM(o.OrderTotalAmount) AS TotalOrderAmount
FROM Customers_Master c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
-- Result: Barsha Raut(40), Sam Bolian(20), Kamal Ghimire(80),
--         Bijen Manandhar(60), Harry Bosman(20)


-- QUERY 7
-- Business Question: Which warehouse shipped the most orders?
SELECT WarehouseID, COUNT(*) AS "ORDERS SHIPPED"
FROM ShippingAndDelivery
GROUP BY WarehouseID
ORDER BY COUNT(*) DESC
LIMIT 1;
-- Oracle syntax: replace LIMIT 1 with FETCH FIRST 1 ROW ONLY
-- Result: Warehouse 80 - 2 orders


-- QUERY 8
-- Business Question: How many customers have queried about payment issues?
SELECT COUNT(*) AS "PAYMENT RELATED QUERIES"
FROM CustomerQueries
WHERE QueryDescription LIKE '%Payment%';
-- Result: 1


-- QUERY 9
-- Business Question: What is the most common payment method used?
SELECT PaymentMethod, COUNT(*) AS "PAYMENTS USED ON"
FROM PaymentDetails
GROUP BY PaymentMethod
ORDER BY COUNT(*) DESC
LIMIT 1;
-- Oracle syntax: replace LIMIT 1 with FETCH FIRST 1 ROW ONLY
-- Result: Checking - 2


-- QUERY 10
-- Business Question: Which product category has the highest average unit price?
SELECT Category, AVG(ProductUnitPrice) AS "AVERAGE UNIT PRICE"
FROM Products
GROUP BY Category
ORDER BY AVG(ProductUnitPrice) DESC
LIMIT 1;
-- Oracle syntax: replace LIMIT 1 with FETCH FIRST 1 ROW ONLY
-- Result: Phone Case - $29.995