-- Create Database
CREATE DATABASE OnlineBookstore;

-- Switch to the database
use OnlineBookstore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


## Basic Questions

-- 1. Show all books that are classified as Fiction.
select * 
from books
where genre = 'Fiction';

-- 2. Display books that were released after the year 1950.
select * 
from books
where published_year = '1950';

-- 3. Show customer details for people who live in Canada.
select *
from customers
where country = 'Canada';

-- 4. Display all orders made during November 2023.
select *
from orders
where order_date between '2023-11-01' and  '2023-11-30';

-- 5. Find the total number of books currently available in stock.
select sum(Stock) as Avaliable_books
from books;

-- 6. Show the book that has the highest price.
SELECT *
FROM Books
WHERE Price = (SELECT MAX(Price) FROM Books);

-- 7. List customers who bought more than one copy of the same book.
SELECT *
FROM orders
WHERE Quantity > 1;

-- 8. Show orders where the total bill amount is greater than $20.
select * from orders
where Total_amount > '20';

-- 9. Display all different book categories available in the store.
select distinct genre
from books;

-- 10. Show the book that has the least stock available.
select *
from books
order by stock
limit 1;

-- 11. Find the total sales amount from all orders.
select sum(Total_Amount) as total_sales_amount
from orders;


## Advanced Questions

-- 1. Find how many books were sold for each book category.
select b.genre , sum(o.quantity) as books_quantity_sold
from books b
join orders o 
on b.Book_ID = o.Book_ID
group by b.genre;

-- 2. Calculate the average price of books in the Fantasy category.
select genre , avg(price) average_price
from books
where genre = 'Fantasy';

-- 3. Show customers who have placed more than one order.
select o.customer_id , c.name , count(o.order_id) as order_placed 
from orders o
join customers c 
on o.customer_id = c.customer_id
group by customer_id , c.name
having order_placed  > 1;

-- 4. Find the book that was ordered the most times.
select o.book_id , b.title , count(o.order_id) as order_count
from orders o
join books b
on o.book_id = b.book_id
group by o.book_id , b.title
order by order_count desc
limit 1;

-- 5. Display the top three most expensive books in the Fantasy category.
select *
from books 
where genre = 'Fantasy'
order by price desc
limit 3;

-- 6. Find the total number of books sold by each author.
select b.author , sum(o.quantity) as total_quantity
from books b
join orders o
on b.book_id = o.book_id
group by author;

-- 7. Show the cities of customers who spent more than $30.
select c.city , o.total_amount
from customers c
join orders o
on c.customer_id = o.customer_id
where total_amount > '30' 
group by c.city,o.total_amount;

-- 8. Find the customer who spent the most money overall.
select c.customer_id , c.name , sum(o.total_amount) as customer_spent_money
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.name ,c.customer_id
order by customer_spent_money desc
limit 1;

-- 9. Show how much stock is left after all orders are completed.
select b.book_id , b.title ,b.stock , coalesce(sum(o.quantity),0) as order_quantity,
       b.stock - coalesce(sum(o.quantity),0) as remaining_stock
from books b
left join orders o
on b.book_id = o.book_id
group by b.book_id
order by b.book_id;







