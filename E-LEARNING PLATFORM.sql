/*********Data Analytics (DA)
   Module-End -3
Module End Assignment
“Analyzing E-Learning Platform Purchases using MySQL”***********/
/*1. Create the database and schema. Populate the Schema*/
create database if not exists e_learning_platform;
use e_learning_platform;
/* Create all three tables in MySQL with appropriate data types and
relationships*/
create table learners(
learner_id int primary key auto_increment,
full_name varchar(30),
country varchar(30)
);
create table courses(
course_id int primary key auto_increment,
course_name varchar(40),
category varchar(30),
unit_price decimal(10,2)
);
create table purchases(
purchase_id int primary key auto_increment,
learner_id int ,
course_id int,
quantity int,
purchase_date date,
foreign key (course_id)references courses(course_id),
foreign key (learner_id)references learners(learner_id)
);

/* Insert sample data covering at least:*/
INSERT INTO learners (full_name, Country) VALUES 
('Alice Johnson', 'USA'), ('Bob Smith', 'Canada'), ('Charlie Brown', 'UK'), ('David Lee', 'USA'), ('Eva Garcia', 'Spain');

INSERT INTO courses (course_name, category, unit_price) VALUES 
('MySQL Basics', 'Database', 49.99), ('Python for DA', 'Programming', 59.99), ('Data Viz 101', 'Analytics', 39.99), ('Advanced SQL', 'Database', 69.99), ('Web Dev', 'Development', 79.99);

INSERT INTO purchases (learner_id, course_id, Quantity, purchase_date) VALUES 
(1, 1, 1, '2025-01-10'), (1, 2, 1, '2025-01-12'), (2, 1, 2, '2024-01-15'), (3, 3, 1, '2024-01-20'), 
(4, 1, 1, '2025-01-22'), (4, 4, 1, '2024-01-25'), (1, 3, 1, '2024-01-28');
select*from learners;
select*from courses;
select*from purchases;
/*2. Data Exploration Using Joins
Data Presentation Guidelines for the following query
● Format currency values to 2 decimal places.
● Use aliases for column names (e.g., AS total_revenue).
● Sort results appropriately (e.g., highest total_spent first)*/
select 
l.full_name as learner_name,
c.course_name as course_purchased,
c.category as course_category,
p.quantity as units_bought,
p.purchase_date as transaction_date,
round((p.quantity*c.unit_price),2) as total_amt
FROM purchases p
inner join learners l on p.learner_id=l.learner_id
inner join courses c on c.course_id=p.course_id
order by total_amt desc;
SELECT 
    l.full_name AS learner_name,
    l.Country,
    c.course_name,
    p.purchase_date
FROM learners l
LEFT JOIN purchases p ON l.learner_id = p.learner_id
LEFT JOIN courses c ON p.course_id = c.course_id;
SELECT 
    c.course_name,
    c.category,
    l.full_name AS learner_name,
    p.purchase_date
FROM purchases p
RIGHT JOIN courses c ON p.course_id = c.course_id
RIGHT JOIN learners l ON p.learner_id = l.learner_id;
/*3. Analytical Queries
Write SQL queries to answer the following questions:
Q1. Display each learner’s total spending (quantity × unit_price) along with
their country.*/
SELECT l.full_name, l.Country, ROUND(SUM(p.Quantity * c.unit_price), 2) AS total_spent
FROM learners l
JOIN purchases p ON l.learner_id = p.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.learner_id;
/*Q2. Find the top 3 most purchased courses based on total quantity sold.*/
SELECT c.course_name, SUM(p.Quantity) AS total_sold
FROM courses c
JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.course_id
ORDER BY total_sold DESC
LIMIT 3;

/*Q3. Show each course category’s total revenue and the number of unique learners who purchased from that category.*/
SELECT c.category, ROUND(SUM(p.Quantity * c.unit_price), 2) AS total_revenue, COUNT(DISTINCT p.learner_id) AS unique_learners
FROM courses c
JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.category;

/*Q4. List all learners who have purchased courses from more than one
category.*/
SELECT l.full_name
FROM learners l
JOIN purchases p ON l.learner_id = p.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.learner_id
HAVING COUNT(DISTINCT c.category) > 1;

/*Q5. Identify courses that have not been purchased at all.*/
SELECT c.course_name
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL;









