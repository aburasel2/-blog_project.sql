-- Active: 1737884599851@@127.0.0.1@3306@blogs

CREATE TABLE authors(
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE Blogs(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    category_id INT NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE ON UPDATE CASCADE
)



INSERT INTO authors(author_name) VALUES ("John Doe");


--Read : Retrieve all authors

SELECT * FROM authors;


-- Read : Restrive a spacific author by ID

SELECT * FROM authors WHERE id=3;


-- Update authors name

UPDATE authors SET author_name = "Rasel" WHERE id = 2;


DELETE FROM authors WHERE id= 1;


INSERT INTO categories(category_name) VALUES
("Buisness");

SELECT * FROM categories;


SELECT * FROM categories WHERE id=1;

UPDATE categories SET category_name = 'Gajedegs' WHERE id = 2;

DELETE FROM categories WHERE id = 2;


INSERT INTO blogs(title, body,category_id, author_id) VALUES
("My blog", "My blog's content", 3,2)


SELECT * FROM blogs;

SELECT * FROM blogs WHERE id= 3;

UPDATE blogs SET title ="My Updated blog title" WHERE id =3;

DELETE FROM blogs WHERE id=4;


SELECT blogs.title, blogs.body, categories.category_name, authors.author_name
FROM blogs
JOIN categories ON blogs.category_id=categories.id
JOIN authors ON blogs.author_id= authors.id

UPDATE blogs SET category_id = 4 , author_id =4 WHERE id =10;

SELECT authors.author_name, blogs.title, blogs.body, categories.category_name
FROM blogs
JOIN authors ON blogs.author_id = authors.id
JOIN categories ON blogs.category_id= categories.id
WHERE authors.id = 3;


SELECT categories.category_name, blogs.title, blogs.body
FROM blogs
JOIN categories ON blogs.category_id= categories.id
WHERE categories.id=2;