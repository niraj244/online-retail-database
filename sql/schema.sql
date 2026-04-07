-- ================================================
-- Online Retail Application Database
-- File: schema.sql
-- Description: Table definitions for all 8 entities
-- Database: Oracle SQL (compatible with MySQL/PostgreSQL
--           with minor syntax adjustments)
-- ================================================


-- ORDERS TABLE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    OrderTotalAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(50),
    Quantity INT
);


-- PRODUCTS TABLE
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(50),
    ProductDescription TEXT,
    ProductUnitPrice DECIMAL(10,2),
    ProductWeight DECIMAL(10,2),
    ProductReview TEXT
);


-- CUSTOMER TABLES (one per team member)
CREATE TABLE Customers_Nathan (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    CustomerAddress VARCHAR(255),
    CustomerPhoneNumber VARCHAR(20),
    AmountSpent DECIMAL(10,2)
);

CREATE TABLE Customers_Juliana (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    CustomerAddress VARCHAR(255),
    CustomerPhoneNumber VARCHAR(20),
    AmountSpent DECIMAL(10,2)
);

CREATE TABLE Customers_Saurav (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    CustomerAddress VARCHAR(255),
    CustomerPhoneNumber VARCHAR(20),
    AmountSpent DECIMAL(10,2)
);

CREATE TABLE Customers_Khagendra (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    CustomerAddress VARCHAR(255),
    CustomerPhoneNumber VARCHAR(20),
    AmountSpent DECIMAL(10,2)
);

CREATE TABLE Customers_Niraj (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    CustomerAddress VARCHAR(255),
    CustomerPhoneNumber VARCHAR(20),
    AmountSpent DECIMAL(10,2)
);

CREATE TABLE Customers_Pralosh (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    CustomerAddress VARCHAR(255),
    CustomerPhoneNumber VARCHAR(20),
    AmountSpent DECIMAL(10,2)
);


-- ORDER DETAILS TABLE (junction table for Orders and Products)
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    SalesTax DECIMAL(10,2),
    GrossAmount DECIMAL(10,2),
    Profit DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- WAREHOUSES TABLE
CREATE TABLE Warehouses (
    WarehouseID INT PRIMARY KEY,
    WarehouseAddress VARCHAR(255),
    ContactNumber VARCHAR(20),
    ContactEmail VARCHAR(255)
);


-- SHIPPING AND DELIVERY TABLE
CREATE TABLE ShippingAndDelivery (
    ShippingID INT PRIMARY KEY,
    WarehouseID INT,
    OrderID INT,
    ShippingCompany VARCHAR(255),
    ShippingAddress TEXT
);


-- PAYMENT DETAILS TABLE
CREATE TABLE PaymentDetails (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50),
    PaymentDateandTime TIMESTAMP,
    RefundStatus VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


-- CUSTOMER QUERIES TABLE
CREATE TABLE CustomerQueries (
    CustomerQueryID INT PRIMARY KEY,
    CustomerID INT,
    QueryDescription TEXT,
    OrderID INT,
    ResponseStatus VARCHAR(50),
    QueryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);