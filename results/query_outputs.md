# Query Outputs

All queries were executed on Oracle Live SQL.  
Run order: `schema.sql` → `data.sql` → `views.sql` → `queries.sql`

---

## Query 1 — Total Amount Spent by All Customers

**Business Question:** What is the total amount spent by all customers?
```sql
SELECT SUM(AmountSpent) AS "TOTAL AMOUNT SPENT"
FROM Customers_Master;
```

| TOTAL AMOUNT SPENT |
|--------------------|
| 5620.97            |

---

## Query 2 — Products Priced Above $25

**Business Question:** Which products are sold with a price more than $25?
```sql
SELECT ProductName AS "PRODUCTS WITH PRICE > 25", COUNT(*) AS "AMOUNT SOLD"
FROM Products
WHERE ProductUnitPrice > 25
GROUP BY ProductName;
```

| PRODUCTS WITH PRICE > 25 | AMOUNT SOLD |
|--------------------------|-------------|
| MagSafe Phone Case       | 1           |

---

## Query 3 — Average Order Total Amount

**Business Question:** What is the average order total amount for all orders?
```sql
SELECT AVG(OrderTotalAmount) AS "AVERAGE ORDER TOTAL AMOUNT"
FROM Orders;
```

| AVERAGE ORDER TOTAL AMOUNT |
|----------------------------|
| 44                         |

---

## Query 4 — Highest Spending Customer

**Business Question:** Which customer spent the highest amount of money and how much?
```sql
SELECT CustomerName AS "HIGHEST SPENDING CUSTOMER", AmountSpent AS "AMOUNT SPENT"
FROM Customers_Master
ORDER BY AmountSpent DESC
FETCH FIRST 1 ROW ONLY;
```

| HIGHEST SPENDING CUSTOMER | AMOUNT SPENT |
|---------------------------|--------------|
| Chad Wick                 | 524          |

---

## Query 5 — Orders Placed in January 2023

**Business Question:** How many orders were placed in January 2023?
```sql
SELECT COUNT(*) AS "ORDERS PLACED IN JANUARY 2023"
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-01-31';
```

| ORDERS PLACED IN JANUARY 2023 |
|-------------------------------|
| 5                             |

---

## Query 6 — Customers Who Placed Orders and Their Total Spend

**Business Question:** What are the names of customers who placed orders along with the total amount of their orders?
```sql
SELECT c.CustomerName, SUM(o.OrderTotalAmount) AS TotalOrderAmount
FROM Customers_Master c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
```

| CUSTOMERNAME    | TOTALORDERAMOUNT |
|-----------------|------------------|
| Barsha Raut     | 40               |
| Sam Bolian      | 20               |
| Kamal Ghimire   | 80               |
| Bijen Manandhar | 60               |
| Harry Bosman    | 20               |

---

## Query 7 — Warehouse That Shipped the Most Orders

**Business Question:** Which warehouse shipped the most orders?
```sql
SELECT WarehouseID, COUNT(*) AS "ORDERS SHIPPED"
FROM ShippingAndDelivery
GROUP BY WarehouseID
ORDER BY COUNT(*) DESC
FETCH FIRST 1 ROW ONLY;
```

| WAREHOUSEID | ORDERS SHIPPED |
|-------------|----------------|
| 80          | 2              |

---

## Query 8 — Payment-Related Customer Queries

**Business Question:** How many customers have queried about payment issues?
```sql
SELECT COUNT(*) AS "PAYMENT RELATED QUERIES"
FROM CustomerQueries
WHERE QueryDescription LIKE '%Payment%';
```

| PAYMENT RELATED QUERIES |
|-------------------------|
| 1                       |

---

## Query 9 — Most Common Payment Method

**Business Question:** What is the most common payment method used?
```sql
SELECT PaymentMethod, COUNT(*) AS "PAYMENTS USED ON"
FROM PaymentDetails
GROUP BY PaymentMethod
ORDER BY COUNT(*) DESC
FETCH FIRST 1 ROW ONLY;
```

| PAYMENTMETHOD | PAYMENTS USED ON |
|---------------|------------------|
| Checking      | 2                |

---

## Query 10 — Product Category with Highest Average Unit Price

**Business Question:** Which product category has the highest average unit price?
```sql
SELECT Category, AVG(ProductUnitPrice) AS "AVERAGE UNIT PRICE"
FROM Products
GROUP BY Category
ORDER BY AVG(ProductUnitPrice) DESC
FETCH FIRST 1 ROW ONLY;
```

| CATEGORY   | AVERAGE UNIT PRICE |
|------------|--------------------|
| Phone Case | 29.995             |