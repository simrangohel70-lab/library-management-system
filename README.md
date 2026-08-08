# 📚 Library Management System

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15%2B-336791?style=for-the-badge\&logo=postgresql\&logoColor=white)](https://www.postgresql.org/)
[![pgAdmin](https://img.shields.io/badge/pgAdmin-4-336791?style=for-the-badge\&logo=postgresql\&logoColor=white)](https://www.pgadmin.org/)
[![SQL](https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge\&logo=postgresql\&logoColor=white)](https://www.postgresql.org/)
[![Database](https://img.shields.io/badge/Database-Relational-blue?style=for-the-badge)]()
[![Project](https://img.shields.io/badge/Project-Library%20Management-success?style=for-the-badge)]()

> 📖 A complete **Library Management System** built with **PostgreSQL** that demonstrates database design, CRUD operations, relational queries, joins, subqueries, aggregate functions, date & string functions, and advanced SQL window functions.

---

# 🎥 Project Demonstration

A complete video demonstration of this project is available below.

▶️ https://drive.google.com/file/d/1w9zckAenxTzLX7NK8TkH3C9usI9_GDor/view?usp=drive_link

---

## 📌 Table of Contents

* [📖 Project Overview](#-project-overview)
* [🎯 Objectives](#-objectives)
* [🛠️ Technologies Used](#️-technologies-used)
* [🗄️ Database Schema](#️-database-schema)
* [🔗 Table Relationships](#-table-relationships)
* [✨ Features](#-features)
* [⚙️ CRUD Operations](#️-crud-operations)
* [🔍 SQL Queries](#-sql-queries)
* [🔗 JOIN Operations](#-join-operations)
* [🧩 Subqueries](#-subqueries)
* [📊 Aggregate Functions](#-aggregate-functions)
* [📅 Date & String Functions](#-date--string-functions)
* [📈 Window Functions](#-window-functions)
* [🏷️ Book Categorization](#️-book-categorization)
* [🟢 Member Status](#-member-status)
* [🚀 How to Run](#-how-to-run)
* [🎥 Project Demonstration](#-project-demonstration)
* [📂 Project Structure](#-project-structure)
* [🧠 Skills Demonstrated](#-skills-demonstrated)
* [👩‍💻 Author](#-author)

---

# 📖 Project Overview

The **Library Management System** is a relational database project developed using **PostgreSQL**.

The system manages the complete flow of a library, including:

* 👨‍💼 Author information
* 📚 Book information
* 👥 Library members
* 🔄 Borrowing and returning transactions
* 💰 Fine management
* 📊 Library data analysis

The project is designed to demonstrate both **fundamental and advanced SQL concepts** using a realistic library database.

---

# 🎯 Objectives

The main objectives of this project are:

* 🗄️ Design a structured relational database
* 🔐 Implement primary and foreign key relationships
* ✏️ Perform CRUD operations
* 🔎 Retrieve and filter meaningful information
* 🔗 Work with different types of JOINs
* 📊 Perform data aggregation and analysis
* 🧩 Use subqueries for complex data retrieval
* 📅 Work with PostgreSQL date functions
* 🔤 Apply string manipulation functions
* 📈 Implement SQL window functions
* 🏷️ Categorize books using conditional logic
* 👥 Analyze member activity

---

# 🛠️ Technologies Used

| Technology    | Purpose                                    |
| ------------- | ------------------------------------------ |
| 🐘 PostgreSQL | Relational Database Management System      |
| 🖥️ pgAdmin 4 | Database administration & SQL execution    |
| 💻 SQL        | Database creation, manipulation & analysis |

---

# 🗄️ Database Schema

The database consists of **four main tables**:

```text
┌─────────────────┐
│     Authors     │
├─────────────────┤
│ author_id PK    │
│ name            │
│ email           │
└────────┬────────┘
         │
         │ 1 : N
         ▼
┌─────────────────┐
│      Books      │
├─────────────────┤
│ book_id PK      │
│ title           │
│ author_id FK    │
│ category        │
│ isbn            │
│ published_date  │
│ price           │
│ available_copies│
└────────┬────────┘
         │
         │ 1 : N
         ▼
┌─────────────────┐
│  Transactions   │
├─────────────────┤
│ transaction_id  │
│ member_id FK    │
│ book_id FK      │
│ borrow_date     │
│ return_date     │
│ fine_amount     │
└────────┬────────┘
         ▲
         │ 1 : N
         │
┌─────────────────┐
│     Members     │
├─────────────────┤
│ member_id PK    │
│ name            │
│ email           │
│ phone_number    │
│ membership_date │
└─────────────────┘
```

---

# 🔗 Table Relationships

### 👨‍💼 Authors → 📚 Books

One author can have multiple books.

```text
Authors 1 ─────────── N Books
```

### 📚 Books → 🔄 Transactions

One book can appear in multiple borrowing transactions.

```text
Books 1 ─────────── N Transactions
```

### 👥 Members → 🔄 Transactions

One member can have multiple borrowing transactions.

```text
Members 1 ─────────── N Transactions
```

---

# ✨ Features

### 📚 Book Management

* Add new books
* View books
* Update available copies
* Delete books
* Filter books by category
* Find books by publication date
* Find expensive/cheap books

### 👥 Member Management

* Add members
* View member information
* Track membership dates
* Identify active/inactive members
* Find members who never borrowed books

### 🔄 Transaction Management

* Track borrowed books
* Track return dates
* Calculate borrowing duration
* Calculate total fines
* Analyze borrowing frequency

### 📊 Data Analysis

* Most borrowed book
* Total books
* Average book price
* Maximum/minimum price
* Category-wise book count
* Borrowing rankings
* Cumulative borrowing
* Moving averages

---

# ⚙️ CRUD Operations

## ➕ Create

Add a new author:

```sql
INSERT INTO Authors
VALUES (6, 'Kavita Shah', 'kavita@gmail.com');
```

---

## 👀 Read

Display all books:

```sql
SELECT *
FROM Books;
```

---

## ✏️ Update

Increase available copies:

```sql
UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 1;
```

---

## 🗑️ Delete

Delete a book:

```sql
DELETE FROM Books
WHERE book_id = 11;
```

---

# 🔍 Basic SQL Queries

### 📅 Books Published After 2015

```sql
SELECT *
FROM Books
WHERE published_date > '2015-01-01';
```

### 💰 Top 5 Most Expensive Books

```sql
SELECT *
FROM Books
ORDER BY price DESC
LIMIT 5;
```

### 👥 Members Who Joined Before 2022

```sql
SELECT *
FROM Members
WHERE membership_date < '2022-01-01';
```

### 🔬 Science Books Below ₹500

```sql
SELECT *
FROM Books
WHERE category = 'Science'
AND price < 500;
```

### 📕 Books Currently Not Available

```sql
SELECT *
FROM Books
WHERE available_copies = 0;
```

---

# 📊 Aggregate Functions

The project uses:

`COUNT()` · `AVG()` · `SUM()` · `MAX()` · `MIN()`

### 📚 Total Number of Books

```sql
SELECT COUNT(*) AS total_books
FROM Books;
```

### 💵 Average Book Price

```sql
SELECT AVG(price) AS average_price
FROM Books;
```

### 💰 Maximum Book Price

```sql
SELECT MAX(price) AS maximum_price
FROM Books;
```

### 💰 Minimum Book Price

```sql
SELECT MIN(price) AS minimum_price
FROM Books;
```

### 💸 Total Fine Collected

```sql
SELECT SUM(fine_amount) AS total_fine
FROM Transactions;
```

### 🗂️ Books by Category

```sql
SELECT
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category
ORDER BY category;
```

---

# 🔗 JOIN Operations

The project demonstrates four major JOIN types.

### 🔵 INNER JOIN

Display books with their authors:

```sql
SELECT
    b.book_id,
    b.title,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;
```

### 🟢 LEFT JOIN

Display members and their borrowing records:

```sql
SELECT
    m.name AS member_name,
    t.transaction_id,
    t.borrow_date
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id;
```

### 🟡 RIGHT JOIN

Display books and their transactions:

```sql
SELECT
    b.title,
    t.transaction_id,
    t.borrow_date
FROM Transactions t
RIGHT JOIN Books b
ON t.book_id = b.book_id;
```

### 🟣 FULL OUTER JOIN

Display all members and transactions:

```sql
SELECT
    m.name AS member_name,
    t.transaction_id,
    t.book_id
FROM Members m
FULL OUTER JOIN Transactions t
ON m.member_id = t.member_id;
```

---

# 🧩 Subqueries

### 📚 Books Borrowed by Members Registered After 2022

```sql
SELECT *
FROM Books
WHERE book_id IN
(
    SELECT book_id
    FROM Transactions
    WHERE member_id IN
    (
        SELECT member_id
        FROM Members
        WHERE membership_date > '2022-01-01'
    )
);
```

### 🏆 Most Borrowed Book

```sql
SELECT *
FROM Books
WHERE book_id =
(
    SELECT book_id
    FROM Transactions
    GROUP BY book_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
```

### 👤 Members Who Never Borrowed a Book

```sql
SELECT *
FROM Members
WHERE member_id NOT IN
(
    SELECT member_id
    FROM Transactions
);
```

---

# 📅 Date & String Functions

## 📆 Extract Publication Year

```sql
SELECT
    title,
    EXTRACT(YEAR FROM published_date) AS publication_year
FROM Books;
```

## ⏱️ Calculate Return Duration

```sql
SELECT
    transaction_id,
    borrow_date,
    return_date,
    (return_date - borrow_date) AS days_taken
FROM Transactions
WHERE return_date IS NOT NULL;
```

## 📅 Format Borrow Date

```sql
SELECT
    transaction_id,
    TO_CHAR(borrow_date, 'DD-MM-YYYY') AS formatted_date
FROM Transactions;
```

## 🔠 Convert Titles to Uppercase

```sql
SELECT UPPER(title) AS upper_title
FROM Books;
```

## ✂️ Remove Extra Spaces

```sql
SELECT TRIM(name) AS clean_name
FROM Authors;
```

## 🚫 Handle NULL Values

```sql
SELECT
    name,
    COALESCE(email, 'Not Provided') AS email
FROM Authors;
```

---

# 📈 Window Functions

Advanced SQL analytics are implemented using window functions.

## 🏆 Book Ranking

Books are ranked according to their borrowing frequency.

```sql
SELECT
    b.title,
    COUNT(t.transaction_id) AS borrow_count,
    RANK() OVER (
        ORDER BY COUNT(t.transaction_id) DESC
    ) AS book_rank
FROM Books b
LEFT JOIN Transactions t
ON b.book_id = t.book_id
GROUP BY b.book_id, b.title;
```

---

## 📚 Cumulative Books Borrowed

```sql
SELECT
    m.name,
    t.borrow_date,
    COUNT(*) OVER (
        PARTITION BY m.member_id
        ORDER BY t.borrow_date
    ) AS cumulative_books
FROM Members m
JOIN Transactions t
ON m.member_id = t.member_id
ORDER BY m.name, t.borrow_date;
```

---

## 📊 Three-Month Moving Average

```sql
SELECT
    DATE_TRUNC('month', borrow_date) AS month,
    COUNT(*) AS books_borrowed,
    AVG(COUNT(*)) OVER (
        ORDER BY DATE_TRUNC('month', borrow_date)
        ROWS 2 PRECEDING
    ) AS moving_average
FROM Transactions
GROUP BY DATE_TRUNC('month', borrow_date)
ORDER BY month;
```

---

# 🟢 Member Status

Members are categorized as **Active** or **Inactive** based on their borrowing activity during the last six months.

```sql
SELECT
    m.member_id,
    m.name,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM Transactions t
            WHERE t.member_id = m.member_id
            AND t.borrow_date >= CURRENT_DATE - INTERVAL '6 months'
        )
        THEN 'Active'
        ELSE 'Inactive'
    END AS membership_status
FROM Members m;
```

---

# 🏷️ Book Categorization

Books are categorized based on their publication year.

```sql
SELECT
    title,
    published_date,
    CASE
        WHEN published_date > '2020-01-01'
            THEN 'New Arrival'
        WHEN published_date < '2000-01-01'
            THEN 'Classic'
        ELSE 'Regular'
    END AS book_type
FROM Books;
```

### Categories

| Condition                | Category       |
| ------------------------ | -------------- |
| 📅 Published after 2020  | 🆕 New Arrival |
| 📅 Published before 2000 | 📜 Classic     |
| 📅 All other books       | 📖 Regular     |

---

# 🧠 SQL Concepts Covered

| Concept             | Status |
| ------------------- | ------ |
| Database Creation   | ✅      |
| Table Creation      | ✅      |
| Primary Key         | ✅      |
| Foreign Key         | ✅      |
| INSERT              | ✅      |
| SELECT              | ✅      |
| UPDATE              | ✅      |
| DELETE              | ✅      |
| WHERE               | ✅      |
| AND / OR            | ✅      |
| ORDER BY            | ✅      |
| LIMIT               | ✅      |
| GROUP BY            | ✅      |
| HAVING              | ✅      |
| Aggregate Functions | ✅      |
| INNER JOIN          | ✅      |
| LEFT JOIN           | ✅      |
| RIGHT JOIN          | ✅      |
| FULL OUTER JOIN     | ✅      |
| Subqueries          | ✅      |
| EXISTS              | ✅      |
| IN / NOT IN         | ✅      |
| CASE                | ✅      |
| COALESCE            | ✅      |
| Date Functions      | ✅      |
| String Functions    | ✅      |
| RANK()              | ✅      |
| Window Functions    | ✅      |
| Moving Average      | ✅      |
| Cumulative Analysis | ✅      |

---

# 🚀 How to Run

### 1️⃣ Install PostgreSQL

Install PostgreSQL and pgAdmin 4 on your system.

### 2️⃣ Open pgAdmin 4

Launch pgAdmin and connect to your PostgreSQL server.

### 3️⃣ Create Database

```sql
CREATE DATABASE library_management;
```

### 4️⃣ Open Query Tool

Select the `library_management` database and open the Query Tool.

### 5️⃣ Execute SQL Script

Run the SQL script in the following order:

```text
1. Database Creation
        ↓
2. Table Creation
        ↓
3. Data Insertion
        ↓
4. CRUD Operations
        ↓
5. Basic Queries
        ↓
6. Aggregate Functions
        ↓
7. JOIN Queries
        ↓
8. Subqueries
        ↓
9. Date & String Functions
        ↓
10. Window Functions
        ↓
11. Advanced Analysis
```
---

# 📂 Project Structure

```text
Library-Management-System/
│
├── 📄 README.md
│
└── 📄 library_management.sql
```

---


---

# 🎓 Learning Outcomes

By completing this project, the following practical database skills are demonstrated:

> **Database Design → Data Manipulation → SQL Querying → Relational Joins → Data Analysis → Advanced SQL**

The project provides hands-on experience with PostgreSQL and demonstrates how SQL can be applied to solve real-world data management and analysis problems.

---

# 👩‍💻 Author

### **Simran Gohel**

📚 **Project:** Library Management System
🐘 **Database:** PostgreSQL
🖥️ **Tool:** pgAdmin 4
💻 **Language:** SQL

---

## ⭐ If You Like This Project

If this project helped you understand PostgreSQL and SQL concepts, consider giving the repository a ⭐ on GitHub.

