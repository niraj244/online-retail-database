-- ================================================
-- Online Retail Application Database
-- File: views.sql
-- Description: Customers_Master view that consolidates
--              all 6 individual customer tables into
--              one unified view using FULL OUTER JOINs
-- Run schema.sql and data.sql before this file
-- ================================================


-- CUSTOMERS_MASTER VIEW
-- Purpose: Combines all 6 team member customer tables
--          into a single queryable view.
-- Each team member owned one customer table.
-- This view merges them so queries can run across
-- all customers without knowing which table they're in.

CREATE VIEW Customers_Master AS
SELECT
    na.CustomerID   AS CustomerID,
    j.CustomerName  AS CustomerName,
    s.CustomerEmail AS CustomerEmail,
    k.CustomerAddress AS CustomerAddress,
    ni.CustomerPhoneNumber AS CustomerPhoneNumber,
    p.AmountSpent   AS AmountSpent
FROM Customers_Nathan na
FULL OUTER JOIN Customers_Juliana   j  ON na.CustomerID = j.CustomerID
FULL OUTER JOIN Customers_Saurav   s  ON  j.CustomerID = s.CustomerID
FULL OUTER JOIN Customers_Khagendra k  ON  s.CustomerID = k.CustomerID
FULL OUTER JOIN Customers_Niraj    ni  ON  k.CustomerID = ni.CustomerID
FULL OUTER JOIN Customers_Pralosh   p  ON ni.CustomerID = p.CustomerID
ORDER BY CustomerID;


-- FOREIGN KEY CONSTRAINTS (run after view is created)
-- Links Orders and CustomerQueries back to Customers_Master

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_CustomerID
FOREIGN KEY (CustomerID)
REFERENCES Customers_Master(CustomerID);

ALTER TABLE CustomerQueries
ADD CONSTRAINT FK_Queries_CustomerID
FOREIGN KEY (CustomerID)
REFERENCES Customers_Master(CustomerID);