CREATE DATABASE LIBRARY;
USE LIBRARY;
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(255)
);
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
);
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255)
);
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    category_id INT,
    publisher_id INT,
    isbn VARCHAR(50) UNIQUE,
    price DECIMAL(10,2),
    copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

INSERT INTO Authors VALUES
(1,"Rabindranath Tagore"),
(2,"Chetan Bhagat"),
(3,"Amitav Ghosh"),
(4,"R.K. Narayan"),
(5,"Ruskin Bond");


INSERT INTO Categories VALUES
(1, 'Poetry/Devotional'),
(2, 'Contemporary Fiction/Romance'),
(3, 'Historical Fiction/Sea Trilogy'),
(4, 'Fiction/Humor'),
(5, 'Children''s/Nature/Adventure');

INSERT INTO Publishers VALUES
(1, 'Visva-Bharati Publishing'),
(2, 'Rupa Publications'),
(3, 'Penguin Random House India'),
(4, 'Indian Thought Publications'),
(5, 'Penguin India');

INSERT INTO Books VALUES
(1, 'Gitanjali', 1, 1, 1, '9788171677096', 250.00, 10),
(2, 'Half Girlfriend', 2, 2, 2, '9788129135728', 199.00, 15),
(3, 'Sea of Poppies', 3, 3, 3, '9780143064471', 350.00, 8),
(4, 'Malgudi Days', 4, 4, 4, '9788185986176', 220.00, 12),
(5, 'The Blue Umbrella', 5, 5, 5, '9788129123480', 180.00, 20),
(6, 'The Home and the World', 1, 1, 1, '9788171677126', 300.00, 6),
(7, 'Five Point Someone', 2, 2, 2, '9788129135490', 180.00, 14),
(8, '2 States', 2, 2, 2, '9788129135520', 190.00, 18),
(9, 'River of Smoke', 3, 3, 3, '9780143064488', 360.00, 7),
(10, 'Shadow Lines', 3, 3, 3, '9780143064464', 340.00, 9),
(11, 'Swami and Friends', 4, 4, 4, '9788185986183', 210.00, 11),
(12, 'The Guide', 4, 4, 4, '9788185986190', 230.00, 10),
(13, 'Rusty the Boy from the Hills', 5, 5, 5, '9788129123503', 170.00, 16),
(14, 'A Flight of Pigeons', 5, 5, 5, '9788129123510', 200.00, 13),
(15, 'Chokher Bali', 1, 1, 1, '9788171677157', 280.00, 7),
(16, 'Revolution 2020', 2, 2, 2, '9788129135506', 210.00, 12),
(17, 'Gun Island', 3, 3, 3, '9780143429072', 370.00, 6),
(18, 'The Vendor of Sweets', 4, 4, 4, '9788185986206', 240.00, 9),
(19, 'Time Stops at Shamli', 5, 5, 5, '9788129123527', 160.00, 14),
(20, 'The Room on the Roof', 5, 5, 5, '9788129123534', 190.00, 18);

/*
b → Books table
a → Authors table
p → Publishers table
c → Categories table
Example:SELECT
    b.title,              -- book title from Books table
    a.name AS author_name,-- author name from Authors table
    p.publisher_name,     -- publisher name from Publishers table
    c.category_name       -- category name from Categories table
FROM Books b              -- b is alias for Books
JOIN Authors a ON b.author_id = a.author_id   -- join Books with Authors
JOIN Publishers p ON b.publisher_id = p.publisher_id -- join Books with Publishers
JOIN Categories c ON b.category_id = c.category_id;  -- join Books with Categories
*/

SELECT 
    b.title,
    a.name AS author_name,
    p.publisher_name AS publisher_name,
    c.category_name AS category_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Publishers p ON b.publisher_id = p.publisher_id
JOIN Categories c ON b.category_id = c.category_id;

SELECT * FROM Authors;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Books;

SELECT b.title, c.category_name
FROM Books b
JOIN Categories c ON b.category_id = c.category_id;

SELECT 
    b.title,
    a.name AS author,
    c.category_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Categories c ON b.category_id = c.category_id;

SELECT b.title
FROM Books b
JOIN Categories c ON b.category_id = c.category_id
WHERE c.category_name = 'Fiction/Humor';

SELECT b.title, p.publisher_name
FROM Books b
JOIN Publishers p ON b.publisher_id = p.publisher_id
WHERE p.publisher_name = 'Penguin India';

SELECT COUNT(*) AS total_books
FROM Books;

SELECT 
    c.category_name,
    COUNT(b.book_id) AS total_books
FROM Categories c
JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_name;

SELECT title, price
FROM Books
ORDER BY price DESC
LIMIT 1;

SELECT title, price
FROM Books
ORDER BY price ASC
LIMIT 1;

SELECT title, copies
FROM Books
WHERE copies > 3;

SELECT DISTINCT a.name
FROM Authors a
JOIN Books b ON a.author_id = b.author_id;

SELECT 
    a.name AS author_name,
    COUNT(b.book_id) AS total_books
FROM Authors a
JOIN Books b ON a.author_id = b.author_id
GROUP BY a.name;

SELECT title, price
FROM Books
ORDER BY price DESC;

SELECT title
FROM Books
WHERE title LIKE 'Malgudi Days';

