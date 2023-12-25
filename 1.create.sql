INSERT INTO authors VALUES (1, 'J. K. Rowling', 'Joanne Rowling, better known by her pen name J. K. Rowling, is a British author, film producer, television producer, screenwriter, and philanthropist.');

INSERT INTO authors (name, description) VALUES ('J. R. R. Tolkien', 'John Ronald Reuel Tolkien, CBE FRSL was an English writer, poet, philologist, and university professor who is best known as the author of the classic high-fantasy works The Hobbit, The Lord of the Rings, and The Silmarillion.');


INSERT INTO authors (name, description) VALUES ('Random Author', 'This author is so random even the description is random.');

INSERT INTO books VALUES (123, 'Harry Potter and the Philosopher''s Stone', 'Harry Potter and the Philosopher''s Stone is a fantasy novel written by British author J. K. Rowling. It is the first novel in the Harry Potter series and Rowling''s debut novel, first published in 1997 by Bloomsbury.', 1);

INSERT INTO books (isbn, title, description, author_id) VALUE (234, 'The Lord of the Rings', 'The Lord of the Rings is an epic high fantasy novel written by English author and scholar J. R. R. Tolkien. The story began as a sequel to Tolkien''s 1937 fantasy novel The Hobbit, but eventually developed into a much larger work.', 2);
INSERT INTO books (isbn, title, description, author_id) VALUE (345, 'The Hobbit', 'The Hobbit, or There and Back Again is a children''s fantasy novel by English author J. R. R. Tolkien. It was published on 21 September 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction.', 2);
INSERT INTO books (isbn, title, description, author_id) VALUE (456, 'The Random Book', 'This book is so random even the description is random.', 4); -- This fails because the author_id does not exist in the authors table.

INSERT INTO reviews (isbn, rating, review) VALUES (123, 5, 'This is a great book!'), (234, 5, 'This is an awesome book!'), (234, 5, 'This is an awesome book!');
INSERT INTO reviews (isbn, rating, review) VALUES (123, 4, 'This is a good book!'), (234, 4, 'This is okay!'), (234, 1, 'Boring!');

INSERT INTO employees VALUES (1, 'Peter Parker', NULL, '123456789V');

INSERT INTO employees (name, supervisor_id, nic) VALUES ('Mary Jane', 1, '987654321V');

INSERT INTO member_cards (issued_date) VALUES ('2018-01-01');
INSERT INTO member_cards (issued_date) VALUES ('2020-01-01');
INSERT INTO member_cards (issued_date) VALUES ('2022-01-01');

INSERT INTO members VALUES (1, 'Sirisena', '1960-04-01', '123 Main Street', 'Colombo', '00100', 1);

INSERT INTO members (name, date_of_birth, street, city, postal_code, card_id) VALUES ('Guna Pala', '1990-01-01', '123 Main Street', 'Colombo', '00100', 2);

INSERT INTO members (name, date_of_birth, street, city, postal_code, card_id) VALUES ('Nandasena', '1970-04-01', '123 Main Street', 'Mirihana', '00200', 3);

INSERT INTO telephone_numbers VALUES ('0111234567', 1);
INSERT INTO telephone_numbers VALUES ('0111234568', 1);
INSERT INTO telephone_numbers VALUES ('0111234569', 2);


INSERT INTO borrowings VALUES (1, 1, 1, '2018-01-01', '2018-01-08', 1);

INSERT INTO borrowings (isbn, member_id, issued_at, due_date) VALUES (234, 1, '2018-01-01', '2018-01-08'); -- This fails because the member_id does not exist in the members table.

INSERT INTO borrowings (isbn, member_id, issued_at, due_date, employee_id) VALUES (123, 1, '2018-01-01', '2018-01-08', 2);

INSERT INTO borrowings (isbn, member_id, issued_at, due_date, employee_id) VALUES (234, 3, '2019-01-01', '2019-01-08', 2);