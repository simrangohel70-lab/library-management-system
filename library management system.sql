CREATE DATABASE library_management;

==================================
1. Authores TABLE
==================================

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO Authors VALUES
(1, 'Ravi Kumar', 'ravi@gmail.com'),
(2, 'Priya Shah', 'priya@gmail.com'),
(3, 'Amit Patel', 'amit@gmail.com'),
(4, 'Neha Joshi', 'neha@gmail.com'),
(5, 'Raj Mehta', NULL);

SELECT * FROM Authores;

================================
2. Books tables
================================

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    category VARCHAR(50),
    isbn VARCHAR(20),
    published_date DATE,
    price DECIMAL(10,2),
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Books VALUES
(1, 'The Great Adventure', 1, 'Fiction', 'ISBN001', '2018-05-10', 450, 5),
(2, 'Learning SQL', 2, 'Technology', 'ISBN002', '2020-08-15', 600, 3),
(3, 'Python Basics', 3, 'Technology', 'ISBN003', '2022-01-20', 550, 4),
(4, 'Indian History', 4, 'History', 'ISBN004', '2014-06-12', 400, 2),
(5, 'Modern Science', 5, 'Science', 'ISBN005', '2023-03-18', 700, 6),
(6, 'Database Design', 2, 'Technology', 'ISBN006', '2019-11-25', 800, 3),
(7, 'World Stories', 1, 'Fiction', 'ISBN007', '2012-07-10', 350, 4),
(8, 'Data Analytics', 3, 'Technology', 'ISBN008', '2021-09-05', 750, 2);

SELECT * FROM Books;

================================
3. Members tables
================================

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    membership_date DATE
);

INSERT INTO Members VALUES
(1, 'Aarav Patel', 'aarav@gmail.com', '9876543210', '2023-01-10'),
(2, 'Diya Shah', 'diya@gmail.com', '9876543211', '2023-05-15'),
(3, 'Rahul Mehta', 'rahul@gmail.com', '9876543212', '2024-02-20'),
(4, 'Anjali Joshi', 'anjali@gmail.com', '9876543213', '2024-06-12'),
(5, 'Karan Shah', 'karan@gmail.com', '9876543214', '2022-11-05');

SELECT * FROM Members;

===============================
4.transactions table
===============================

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    fine_amount DECIMAL(10,2),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Transactions VALUES
(1, 1, 2, '2024-01-10', '2024-01-18', 0),
(2, 2, 1, '2024-02-05', '2024-02-15', 0),
(3, 3, 3, '2024-03-12', '2024-03-25', 20),
(4, 1, 6, '2024-04-08', '2024-04-20', 10),
(5, 4, 4, '2024-05-15', '2024-05-25', 0),
(6, 5, 5, '2024-06-10', '2024-06-22', 15),
(7, 2, 8, '2024-07-05', '2024-07-15', 0),
(8, 3, 7, '2024-08-12', '2024-08-25', 25),
(9, 1, 3, '2024-09-10', '2024-09-20', 0),
(10, 4, 2, '2024-10-05', '2024-10-18', 10);

SELECT * FROM Transactions;

================================
      CRUD operations
================================

-- CREATE / INSERT
INSERT INTO Authors
VALUES (6, 'Kavita Shah', 'kavita@gmail.com');


-- READ
SELECT * FROM Books;


-- UPDATE
UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 1;


-- DELETE
DELETE FROM Books
WHERE book_id = 11;

================================
    WHERE,HAVING,LIMIT
================================

-- Books published after 2015
SELECT *
FROM Books
WHERE published_date > '2015-01-01';


-- Top 5 most expensive books
SELECT *
FROM Books
ORDER BY price DESC
LIMIT 5;


-- Members who joined before 2022
SELECT *
FROM Members
WHERE membership_date < '2022-01-01';

==============================
     AND,OR,NOT
==============================

-- Science books with price below 500
SELECT *
FROM Books
WHERE category = 'Science'
AND price < 500;


-- Books which are NOT available
SELECT *
FROM Books
WHERE available_copies = 0;

-- Members who joined after 2020
-- OR have borrowed more than 3 books
SELECT m.member_id, m.name
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
WHERE m.membership_date > '2020-01-01'
GROUP BY m.member_id, m.name
HAVING COUNT(t.transaction_id) > 3 OR MAX(m.membership_date) > '2020-01-01';

===================================
       ORDER BY,GROUP BY
===================================

-- Number of books borrowed by each member
SELECT
    m.member_id,
    m.name,
    COUNT(t.transaction_id) AS books_borrowed
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
GROUP BY m.member_id, m.name;


-- Books grouped by category
SELECT
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category
ORDER BY category;

=================================
      AGGREGATE FUNCTION
=================================

-- Total number of books
SELECT COUNT(*) AS total_books
FROM Books;


-- Average book price
SELECT AVG(price) AS average_price
FROM Books;


-- Maximum book price
SELECT MAX(price) AS maximum_price
FROM Books;


-- Minimum book price
SELECT MIN(price) AS minimum_price
FROM Books;

-- Most borrowed book
SELECT
    b.title,
    COUNT(t.transaction_id) AS borrow_count
FROM Books b
LEFT JOIN Transactions t
ON b.book_id = t.book_id
GROUP BY b.book_id, b.title
ORDER BY borrow_count DESC
LIMIT 1;


-- Total fine collected
SELECT SUM(fine_amount) AS total_fine
FROM Transactions;

========================================
  ESTABLISH PRIMARY KEY & FOREIGN KEY
        RELATIONSHIP
========================================

 -- it is already craeted in tables

=======================================================
    IMPLEMENT JOINS(INNER,RIGHT,LEFT,FULL OUTER JOIN)
========================================================

-- Books with their authors
SELECT
    b.book_id,
    b.title,
    a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

-- Members and their borrowed books
SELECT
    m.name AS member_name,
    t.transaction_id,
    t.borrow_date
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id;

-- Books and transactions
SELECT
    b.title,
    t.transaction_id,
    t.borrow_date
FROM Transactions t
RIGHT JOIN Books b
ON t.book_id = b.book_id;

SELECT
    m.name AS member_name,
    t.transaction_id,
    t.book_id
FROM Members m
FULL OUTER JOIN Transactions t
ON m.member_id = t.member_id;

=====================================
        SUBQUERIES
=====================================

-- Books borrowed by members who registered after 2022
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

-- Most borrowed book using subquery
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

-- Members who never borrowed a book
SELECT *
FROM Members
WHERE member_id NOT IN
(
    SELECT member_id
    FROM Transactions
);

====================================
 IMPLEMENT DATE & TIME FUNCTIONS
=====================================

-- Extract publication year
SELECT
    title,
    EXTRACT(YEAR FROM published_date) AS publication_year
FROM Books;


-- Calculate late return days
SELECT
    transaction_id,
    borrow_date,
    return_date,
    (return_date - borrow_date) AS days_taken
FROM Transactions
WHERE return_date IS NOT NULL;

-- Format borrow date as DD-MM-YYYY
SELECT
    transaction_id,
    TO_CHAR(borrow_date, 'DD-MM-YYYY') AS formatted_date
FROM Transactions;

==================================
      STRING FUNCTIONS
==================================

-- Convert book titles to uppercase
SELECT UPPER(title) AS upper_title
FROM Books;

-- Trim spaces from author names
SELECT TRIM(name) AS clean_name
FROM Authors;

-- Replace empty email with Not Provided
SELECT name, COALESCE(email, 'Not Provided') AS email
FROM Authors;

===================================
       WINDOW FUNCTION
=================================

-- Rank books according to number of times borrowed
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

-- Cumulative number of books borrowed by each member
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

--- MOVING AVERAGE - LAST 3 MONTHS

SELECT
    DATE_TRUNC('month', borrow_date) AS month,
    COUNT(*) AS books_borrowed,
    AVG(COUNT(*)) OVER (
        ORDER BY DATE_TRUNC('month', borrow_date)
        ROWS 2 PRECEDING
    ) AS moving_average
FROM Transactions
GROUP BY month
ORDER BY month;

==================================
      CASE EXPRESSION
==================================

-- Active / Inactive membership status

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

-- Categorize books

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
































