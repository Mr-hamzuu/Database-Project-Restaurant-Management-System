# Restaurant Management System (SQL Database Project)

## Overview
The **Restaurant Management System** is a MySQL database project designed to manage restaurants, staff, customers, orders, menu items, and billing. It demonstrates relational database concepts, entity relationships, data integrity, and real-world workflows for efficient restaurant operations.

---

## Features
- Manage multiple **restaurants** and their **staff roles** (chef, manager, waiter, cashier).  
- Handle **customer details** and their orders.  
- Process **orders** and associate them with staff and items.  
- Generate accurate **bills** linked to customers and cashiers.  
- Maintain **data integrity** using primary keys, foreign keys, UNIQUE constraints, and cascading deletes.  
- Perform **complex queries** using joins, unions, and aggregates.  

---

## Database Schema
The project includes the following tables:

| Table | Description |
|-------|-------------|
| Restaurant | Stores restaurant details |
| Person | Stores personal info of all individuals (staff and customers) |
| Staff | Details of staff members and their restaurant |
| Customer | Customer information |
| Chef / Manager / Waiter / Cashier | Subclasses of staff with specific roles |
| Items | Menu items and prices |
| Orders | Records orders placed by customers |
| OrderItems | Links orders with multiple items |
| Bills | Generates bills for orders with amount and cashier info |

**Relationships:**  
- One restaurant has many staff.  
- Staff and customers link to person.  
- Orders involve customer, waiter, chef, manager.  
- OrderItems manages many-to-many relation between orders and items.  
- Bills link orders, customers, and cashiers.

---

## Sample Queries
- List items above a specific price.  
- Display customer names and their bill amounts.  
- Show orders with item names and quantities.  
- Retrieve staff working for specific restaurants.  
- Perform full joins between bills, orders, and customers.

---

## Technologies
- **Database:** MySQL  
- **Tools:** MySQL Workbench / phpMyAdmin / Command Line  
- **Language:** SQL

---

## How to Run
1. Clone the repository.  
2. Open MySQL Workbench or your preferred SQL client.  
3. Execute `CREATE DATABASE RESTAURANT_MANAGEMENT_SYSTEM;`  
4. Use the database: `USE RESTAURANT_MANAGEMENT_SYSTEM;`  
5. Run the SQL scripts to create tables and insert data.  
6. Use `SELECT` queries to view or analyze data.

---

## Learning Outcomes
- Design and implement a **normalized relational database**.  
- Apply **primary/foreign keys**, constraints, and cascading rules.  
- Model real-world **restaurant operations** in SQL.  
- Execute advanced **SQL queries** involving joins, unions, and subqueries.

---

## Author
- Muhammad Hamza Khan  
- Contact: hamzuu6971@gmail.com  
- GitHub: [Mr-hamzuu](https://github.com/Mr-hamzuu)
