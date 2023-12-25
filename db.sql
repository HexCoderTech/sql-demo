CREATE DATABASE IF NOT EXISTS `hexocoder_demo`;

USE `hexocoder_demo`;

CREATE TABLE IF NOT EXISTS authors (
    author_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(512) DEFAULT NULL,
    PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS books (
    isbn INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(512) DEFAULT NULL,
    author_id INT NOT NULL DEFAULT 0,
    PRIMARY KEY (isbn),
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS reviews (
    review_id INT NOT NULL AUTO_INCREMENT,
    isbn INT NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(512) DEFAULT NULL,
    PRIMARY KEY (review_id),
    FOREIGN KEY (isbn) REFERENCES books(isbn) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS member_cards (
    card_id INT NOT NULL AUTO_INCREMENT,
    issued_date DATE NOT NULL,
    expiry_date DATE DEFAULT NULL,
    PRIMARY KEY (card_id)
);

CREATE TABLE IF NOT EXISTS members (
    member_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(15) NOT NULL,
    card_id INT NOT NULL,
    PRIMARY KEY (member_id),
    FOREIGN KEY (card_id) REFERENCES member_cards(card_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY (card_id)
);

CREATE TABLE IF NOT EXISTS telephone_numbers (
    telephone_number VARCHAR(15) NOT NULL,
    member_id INT NOT NULL,
    PRIMARY KEY (telephone_number, member_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    supervisor_id INT DEFAULT NULL,
    nic VARCHAR(15) NOT NULL,
    PRIMARY KEY (employee_id),
    UNIQUE KEY (nic)
);

CREATE TABLE IF NOT EXISTS borrowings (
    borrowing_id INT NOT NULL AUTO_INCREMENT,
    member_id INT NOT NULL,
    isbn INT NOT NULL, 
    issued_at DATETIME NOT NULL,
    due_date DATE NOT NULL,
    employee_id INT DEFAULT NULL,
    returned_at DATETIME DEFAULT NULL,
    PRIMARY KEY (borrowing_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (isbn) REFERENCES books(isbn) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE INDEX idx_borrowings_member_id ON borrowings (member_id);

ALTER TABLE members ADD COLUMN IF NOT EXISTS email VARCHAR(100) DEFAULT NULL AFTER date_of_birth;