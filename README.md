# Online Retail Application Database

A relational database system designed for an e-commerce retail 
platform, built as a capstone project for CS260 (Database 
Management Systems).

## Business Problem
Retail companies managing thousands of customers, orders, and 
products need structured data systems to track transactions, 
inventory, shipping, and customer service efficiently.

## Database Design
- **8 normalized tables**: Orders, Products, Customers, Order 
  Details, Shipping & Delivery, Warehouses, Payment Details, 
  Customer Queries
- Normalized to **Third Normal Form (3NF)** to eliminate 
  redundancy
- Entity-Relationship model designed before implementation

## Technical Stack
- Oracle SQL (primary), compatible with MySQL/PostgreSQL with 
  minor syntax changes
- Concepts: PRIMARY KEY, FOREIGN KEY, JOINs, Aggregations, 
  Views, Subqueries

## Key Queries
Sample business questions answered using SQL:
1. Which customer spent the highest amount? → Chad Wick ($524)
2. Which product category has the highest average unit price? 
   → Phone Case ($29.99)
3. Which warehouse shipped the most orders? → Warehouse 80 (2 orders)
4. What is the most common payment method? → Checking
5. How many orders were placed in January 2023? → 5

## Schema Overview
[include ER diagram image here]

## Team
Built collaboratively by 6 CS students as part of WPU CS260.