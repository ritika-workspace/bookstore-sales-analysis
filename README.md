# 📘 Bookstore Sales Analysis (SQL)

## 📌 Project Overview

The **Bookstore Sales Analysis** project focuses on analyzing transactional data from an online bookstore using **SQL (MySQL)**. The objective of this project is to extract meaningful insights related to **sales performance**, **customer purchasing behavior**, and **inventory status** using a relational database.

This project is created as a **data analytics portfolio project** to demonstrate practical SQL skills used in real-world business scenarios.

---

## 🎯 Project Objectives

* Analyze book sales across different genres
* Identify high-value and repeat customers
* Calculate total revenue generated from orders
* Understand customer ordering patterns
* Evaluate inventory levels after sales

---

## 🗂️ Dataset Description

The database consists of **three core tables**:

### 📚 Books

Stores information about books available in the bookstore.

* Book_ID
* Title
* Author
* Genre
* Published_Year
* Price
* Stock

### 👥 Customers

Contains customer-related information.

* Customer_ID
* Name
* Email
* Phone
* City
* Country

### 🛒 Orders

Captures order-level transaction details.

* Order_ID
* Customer_ID
* Book_ID
* Order_Date
* Quantity
* Total_Amount

---

## 🔗 Database Relationships

* Each order is linked to a customer using `Customer_ID`
* Each order references a book using `Book_ID`
* Quantity is stored directly in the Orders table

This relational structure enables efficient analysis using **JOIN operations**.

---

## 🔍 Analysis Performed

### Sales Analysis

* Total revenue calculation
* High-value orders identification
* Most frequently ordered books
* Genre-wise sales distribution

### Customer Analysis

* Customers with multiple orders
* Customers ordering more than one book per order
* Highest spending customer
* Customer distribution by city and country

### Inventory Analysis

* Total stock available
* Books with lowest stock
* Remaining stock after fulfilling all orders

---

## 🧠 Key SQL Concepts Used

* SELECT, WHERE, ORDER BY
* GROUP BY, HAVING
* Aggregate functions (SUM, COUNT, AVG)
* JOIN operations
* Subqueries

---

## 🛠️ Tools & Technologies

* **SQL**
* **MySQL Workbench**

---

## 📁 Repository Structure

```
bookstore-sales-analysis/
│
├── README.md
├── Bookstore_Sales_Analysis_Report.pdf
│
├── sql/
│   ├── questions.sql
│   └── solutions.sql
│
└── dataset/
    └── books.csv
```

---

## 📄 Project Report

A detailed **PDF report** is included in this repository that explains:

* Dataset structure
* Analysis objectives
* Key insights
* Business value

📌 *File:* `Bookstore_Sales_Analysis_Report.pdf`

---

## 🚀 How to Use This Project

1. Import the CSV dataset into MySQL
2. Create the required tables
3. Run queries from `solutions.sql` using MySQL Workbench
4. Review the PDF report for detailed insights

---

## 📈 Future Enhancements

* Add time-based sales trend analysis
* Integrate visualization tools (Power BI / Tableau)
* Expand database with additional tables
* Perform advanced analytical queries

---

## 📌 Disclaimer

This project is created for **learning and portfolio purposes** using a sample dataset.

---

⭐ *If you find this project useful, feel free to star the repository!*

