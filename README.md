To upload the above HTML code to your `README` file on GitHub, you need to convert the HTML content into Markdown format, as GitHub's `README` files use Markdown for formatting. Below is the converted Markdown version of your HTML content:

---

# Sales Analysis SQL Project

## Project Overview

- **Project Title:** Sales Analysis  
- **Level:** Beginner  
- **Database:** `Sales_db_1`  

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

---

## Objectives

1. **Set up a retail sales database:** Create and populate a retail sales database with the provided sales data.  
2. **Data Cleaning:** Identify and remove any records with missing or null values.  
3. **Exploratory Data Analysis (EDA):** Perform basic exploratory data analysis to understand the dataset.  
4. **Business Analysis:** Use SQL to answer specific business questions and derive insights from the sales data.  

---

## Project Structure

### 1. Database Setup

#### Database Creation
The project starts by creating a database named `p1_retail_db`.

```sql
CREATE DATABASE Sales_db_1;
```

---

### 2. Data Exploration & Cleaning

#### Record Count
Determine the total number of records in the dataset.

```sql
SELECT COUNT(ORDERNUMBER) FROM Sales_data_sample;
```

#### Order Count
Find out how many unique orders are in the dataset.

```sql
SELECT COUNT(DISTINCT ORDERNUMBER) FROM Sales_data_sample;
```

#### Category Count
Identify all unique product categories in the dataset.

```sql
SELECT PRODUCTLINE FROM Sales_data_sample GROUP BY PRODUCTLINE;
```

#### Null Value Check
Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(ORDERNUMBER) FROM Sales_data_sample WHERE ORDERNUMBER IS NULL;

SELECT COUNT(SALES) FROM Sales_data_sample WHERE STATE='';

SELECT COUNT(TERRITORY) FROM Sales_data_sample WHERE TERRITORY='NA';
```

---

### 3. Data Analysis & Findings

#### Change Date Format and Add Columns
Write an SQL query to change the format of date to `YYYY-MMM-DDD` and add columns for Order date and Time.

```sql
SELECT ORDERDATE, COUNT(ORDERDATE) FROM Sales_data_sample GROUP BY ORDERDATE;

ALTER TABLE Sales_data_sample ADD COLUMN Date_ DATE;

ALTER TABLE Sales_data_sample ADD COLUMN Time_ TIME;

SET sql_safe_updates = 0;

UPDATE Sales_data_sample
SET Date_ = DATE_FORMAT(STR_TO_DATE(LPAD(SUBSTRING_INDEX(ORDERDATE, ' ', 1), 10, '0'), '%m/%d/%Y'), '%Y-%m-%d'),
    Time_ = RIGHT(ORDERDATE, 4);
```

#### Drop Original ORDERDATE Column and Rename New Column
Write an SQL query to drop the original `ORDERDATE` column and rename the new Order date column to `ORDERDATE`.

```sql
ALTER TABLE Sales_data_sample DROP COLUMN ORDERDATE;

ALTER TABLE Sales_data_sample RENAME COLUMN Date_ TO ORDERDATE;

SELECT * FROM Sales_data_sample;
```

#### Sales in August 2003 for Planes
Write an SQL query to find sales made in August 2003 for Planes where the ordered quantity is more than 20.

```sql
SELECT * FROM Sales_data_sample
WHERE PRODUCTLINE='Planes' AND DATE_FORMAT(ORDERDATE, '%Y-%m') ='2003-08' AND QUANTITYORDERED > 20;
```

#### Total Sales per Productline
Write a SQL query to calculate the total sales (`total_sale`) for each productline.

```sql
SELECT PRODUCTLINE, ROUND(SUM(SALES), 2) FROM Sales_data_sample GROUP BY PRODUCTLINE;
```

#### Sales Greater Than 1000
Write an SQL query to retrieve all the data having Sales greater than 1000.

```sql
SELECT * FROM Sales_data_sample WHERE SALES > 1000;
```

#### Top 5 Customers by Total Sales
Write a SQL query to find the top 5 customers based on the highest total sales.

```sql
SELECT CUSTOMERNAME, ROUND(SUM(SALES), 2) AS TotalSales 
FROM Sales_data_sample
GROUP BY CUSTOMERNAME
ORDER BY TotalSales DESC
LIMIT 5;
```

#### Unique Customers per Productline
Write a SQL query to find the number of unique customers who purchased items from each Productline.

```sql
SELECT PRODUCTLINE, COUNT(DISTINCT CUSTOMERNAME) FROM Sales_data_sample GROUP BY PRODUCTLINE;
```

#### Number of Orders per Status
Write an SQL query to display the number of orders for each status (shipped, dispatched, etc.).

```sql
SELECT STATUS_, COUNT(STATUS_) FROM Sales_data_sample GROUP BY STATUS_;
```

#### Products in 'Disputed' Status
Write an SQL query to find the products which are in 'Disputed' status.

```sql
SELECT PRODUCTLINE, COUNT(PRODUCTLINE) FROM Sales_data_sample WHERE STATUS_='Disputed' GROUP BY PRODUCTLINE ORDER BY COUNT(PRODUCTLINE);
```

#### Number of Orders per Country
Write an SQL query to display the number of orders per country.

```sql
SELECT COUNTRY, COUNT(COUNTRY) FROM Sales_data_sample GROUP BY COUNTRY;
```

#### Trending Products in USA
Write an SQL query to retrieve trending products in the USA.

```sql
SELECT PRODUCTLINE, COUNT(PRODUCTLINE) FROM Sales_data_sample WHERE COUNTRY='USA' GROUP BY PRODUCTLINE ORDER BY COUNT(PRODUCTLINE) DESC;
```

---

## Findings

- **Customer Demographics:** The dataset includes customers from various cultures & countries, with sales distributed across different productlines like Motorcycles, Planes, etc.  
- **High-Value Transactions:** Several transactions had a total sale amount greater than 1000, indicating premium purchases.  
- **Sales Trends:** Monthly analysis shows variations in sales, helping identify peak seasons & sales per country.  
- **Customer Insights:** The analysis identifies the top-spending customers and the most popular productlines.  

---

## Reports

1. **Sales Summary:** A detailed report summarizing total sales, customer demographics, and productline performance.  
2. **Trend Analysis:** Insights into sales trends across different months and countries.  
3. **Customer Insights:** Reports on top customers and unique customer counts per category.  

---

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

---

## How to Use

1. **Clone the Repository:** Clone this project repository from GitHub.  
2. **Set Up the Database:** Run the SQL scripts provided in the `Database_setup.sql` file to create and populate the database.  
3. **Run the Queries:** Use the SQL queries provided in the `SQL_queries.sql` file to perform your analysis.  
4. **Explore and Modify:** Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.  

---

**Author:** Ameer Hamza Ch  

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

---

### Steps to Upload to GitHub

1. Copy the above Markdown content.
2. Go to your GitHub repository.
3. Create or edit the `README.md` file.
4. Paste the Markdown content into the file.
5. Commit the changes.

Your `README.md` file will now display the formatted content on GitHub!