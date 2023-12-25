SELECT * FROM members;
SELECT name, date_of_birth FROM members WHERE member_id = 1;

SELECT name, city FROM members WHERE name LIKE "%sena%";

SELECT * FROM books WHERE author_id = 1;

SELECT isbn, title FROM books 
WHERE author_id = (
    SELECT author_id FROM authors WHERE name = 'J. K. Rowling'
    );


SELECT books.isbn, books.title, authors.name
FROM books
JOIN authors ON books.author_id = authors.author_id
WHERE authors.name = 'J. K. Rowling';

SELECT b.isbn ISBN, b.title "Book Name", a.name Author
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.name = 'J. K. Rowling';

SELECT b.isbn ISBN, b.title "Book Name", a.name Author
FROM books b
JOIN authors a ON b.author_id = a.author_id;

SELECT books.isbn, books.title, authors.name, reviews.rating, reviews.review
FROM books
JOIN authors ON books.author_id = authors.author_id
JOIN reviews ON books.isbn = reviews.isbn
WHERE authors.name = 'J. K. Rowling';

SELECT COUNT(*) FROM books;
SELECT COUNT(*) as num_books FROM books WHERE author_id = 1;
SELECT author_id, COUNT(*) as num_books FROM books GROUP BY author_id;

SELECT reviews.isbn, books.title, COUNT(reviews.review_id) AS review_count, AVG(reviews.rating) AS average_rating
FROM books
JOIN reviews ON books.isbn = reviews.isbn
GROUP BY reviews.isbn;

SELECT books.isbn, books.title, reviews.rating FROM books
LEFT JOIN reviews ON books.isbn = reviews.isbn
WHERE reviews.rating IS NULL;

SELECT books.isbn, books.title, reviews.rating FROM books
RIGHT JOIN reviews ON books.isbn = reviews.isbn;

SELECT authors.name, books.isbn 
FROM authors 
RIGHT JOIN books ON authors.author_id = books.author_id;

SELECT authors.name, books.isbn 
FROM authors 
LEFT JOIN books ON authors.author_id = books.author_id;