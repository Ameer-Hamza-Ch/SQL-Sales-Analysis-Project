<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Analysis SQL Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
        }
        h1, h2, h3 {
            color: #333;
        }
        .snippet-card {
            background-color: #f4f4f4;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .snippet-card pre {
            background-color: #282c34;
            color: #abb2bf;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
        .snippet-card h4 {
            margin-top: 0;
            color: #555;
        }
        .snippet-card p {
            margin-bottom: 10px;
            color: #666;
        }
    </style>
</head>
<body>

    <h1>Sales Analysis SQL Project</h1>
    <h2>Project Overview</h2>
    <p><strong>Project Title:</strong> Sales Analysis</p>
    <p><strong>Level:</strong> Beginner</p>
    <p><strong>Database:</strong> Sales_db_1</p>
    <p>This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.</p>

    <h2>Objectives</h2>
    <ul>
        <li>Set up a sales database: Create and populate a retail sales database with the provided sales data.</li>
        <li>Data Cleaning: Identify and remove any records with missing or null values.</li>
        <li>Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.</li>
        <li>Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.</li>
    </ul>

    <h2>Project Structure</h2>
    <h3>1. Database Setup</h3>
    <div class="snippet-card">
        <h4>Database Creation</h4>
        <p>The project starts by creating a database named <code>Sales_db_1</code>.</p>
        <pre><code>CREATE DATABASE Sales_db_1;</code></pre>
    </div>

    <h3>2. Data Exploration & Cleaning</h3>
    <div class="snippet-card">
        <h4>Record Count</h4>
        <p>Determine the total number of records in the dataset.</p>
        <pre><code>SELECT COUNT(ORDERNUMBER) FROM Sales_data_sample;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Order Count</h4>
        <p>Find out how many unique orders are in the dataset.</p>
        <pre><code>SELECT COUNT(DISTINCT ORDERNUMBER) FROM Sales_data_sample;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Category Count</h4>
        <p>Identify all unique product categories in the dataset.</p>
        <pre><code>SELECT PRODUCTLINE FROM Sales_data_sample GROUP BY PRODUCTLINE;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Null Value Check</h4>
        <p>Check for any null values in the dataset and delete records with missing data.</p>
        <pre><code>SELECT COUNT(ORDERNUMBER) FROM Sales_data_sample WHERE ORDERNUMBER IS NULL;</code></pre>
        <pre><code>SELECT COUNT(SALES) FROM Sales_data_sample WHERE STATE='';</code></pre>
        <pre><code>SELECT COUNT(TERRITORY) FROM Sales_data_sample WHERE TERRITORY='NA';</code></pre>
    </div>

    <h3>3. Data Analysis & Findings</h3>
    <div class="snippet-card">
        <h4>Change Date Format and Add Columns</h4>
        <p>Write an SQL query to change the format of date to YYY-MMM-DDD and add columns for Order date and Time.</p>
        <pre><code>SELECT ORDERDATE, COUNT(ORDERDATE) FROM Sales_data_sample GROUP BY ORDERDATE;</code></pre>
        <pre><code>ALTER TABLE Sales_data_sample ADD COLUMN Date_ DATE;</code></pre>
        <pre><code>ALTER TABLE Sales_data_sample ADD COLUMN Time_ TIME;</code></pre>
        <pre><code>SET sql_safe_updates = 0;</code></pre>
        <pre><code>UPDATE Sales_data_sample
SET Date_ = DATE_FORMAT(STR_TO_DATE(LPAD(SUBSTRING_INDEX(ORDERDATE, ' ', 1), 10, '0'), '%m/%d/%Y'), '%Y-%m-%d'),
    Time_ = RIGHT(ORDERDATE, 4);</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Drop Original ORDERDATE Column and Rename New Column</h4>
        <p>Write an SQL query to drop the original ORDERDATE column and rename the new Order date column to "ORDERDATE".</p>
        <pre><code>ALTER TABLE Sales_data_sample DROP COLUMN ORDERDATE;</code></pre>
        <pre><code>ALTER TABLE Sales_data_sample RENAME COLUMN Date_ TO ORDERDATE;</code></pre>
        <pre><code>SELECT * FROM Sales_data_sample;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Sales in August 2003 for Planes</h4>
        <p>Write an SQL query to find sales made in August 2003 for Planes where the ordered quantity is more than 20.</p>
        <pre><code>SELECT * FROM Sales_data_sample
WHERE PRODUCTLINE='Planes' AND DATE_FORMAT(ORDERDATE, '%Y-%m') ='2003-08' AND QUANTITYORDERED > 20;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Total Sales per Productline</h4>
        <p>Write a SQL query to calculate the total sales (total_sale) for each productline.</p>
        <pre><code>SELECT PRODUCTLINE, ROUND(SUM(SALES), 2) FROM Sales_data_sample GROUP BY PRODUCTLINE;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Sales Greater Than 1000</h4>
        <p>Write an SQL query to retrieve all the data having Sales greater than 1000.</p>
        <pre><code>SELECT * FROM Sales_data_sample WHERE SALES > 1000;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Top 5 Customers by Total Sales</h4>
        <p>Write a SQL query to find the top 5 customers based on the highest total sales.</p>
        <pre><code>SELECT CUSTOMERNAME, ROUND(SUM(SALES), 2) AS TotalSales 
FROM Sales_data_sample
GROUP BY CUSTOMERNAME
ORDER BY TotalSales DESC
LIMIT 5;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Unique Customers per Productline</h4>
        <p>Write a SQL query to find the number of unique customers who purchased items from each Productline.</p>
        <pre><code>SELECT PRODUCTLINE, COUNT(DISTINCT CUSTOMERNAME) FROM Sales_data_sample GROUP BY PRODUCTLINE;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Number of Orders per Status</h4>
        <p>Write an SQL query to display the number of orders for each status (shipped, dispatched, etc.).</p>
        <pre><code>SELECT STATUS_, COUNT(STATUS_) FROM Sales_data_sample GROUP BY STATUS_;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Products in 'Disputed' Status</h4>
        <p>Write an SQL query to find the products which are in 'Disputed' status.</p>
        <pre><code>SELECT PRODUCTLINE, COUNT(PRODUCTLINE) FROM Sales_data_sample WHERE STATUS_='Disputed' GROUP BY PRODUCTLINE ORDER BY COUNT(PRODUCTLINE);</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Number of Orders per Country</h4>
        <p>Write an SQL query to display the number of orders per country.</p>
        <pre><code>SELECT COUNTRY, COUNT(COUNTRY) FROM Sales_data_sample GROUP BY COUNTRY;</code></pre>
    </div>

    <div class="snippet-card">
        <h4>Trending Products in USA</h4>
        <p>Write an SQL query to retrieve trending products in the USA.</p>
        <pre><code>SELECT PRODUCTLINE, COUNT(PRODUCTLINE) FROM Sales_data_sample WHERE COUNTRY='USA' GROUP BY PRODUCTLINE ORDER BY COUNT(PRODUCTLINE) DESC;</code></pre>
    </div>

    <h2>Findings</h2>
    <ul>
        <li><strong>Customer Demographics:</strong> The dataset includes customers from various cultures & countries, with sales distributed across different productlines like Motorcycles, Planes, etc.</li>
        <li><strong>High-Value Transactions:</strong> Several transactions had a total sale amount greater than 1000, indicating premium purchases.</li>
        <li><strong>Sales Trends:</strong> Monthly analysis shows variations in sales, helping identify peak seasons & sales per country.</li>
        <li><strong>Customer Insights:</strong> The analysis identifies the top-spending customers and the most popular productlines.</li>
    </ul>

    <h2>Reports</h2>
    <ul>
        <li><strong>Sales Summary:</strong> A detailed report summarizing total sales, customer demographics, and productline performance.</li>
        <li><strong>Trend Analysis:</strong> Insights into sales trends across different months and countries.</li>
        <li><strong>Customer Insights:</strong> Reports on top customers and unique customer counts per category.</li>
    </ul>

    <h2>Conclusion</h2>
    <p>This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.</p>

    <h2>How to Use</h2>
    <ol>
        <li><strong>Clone the Repository:</strong> Clone this project repository from GitHub.</li>
        <li><strong>Set Up the Database:</strong> Run the SQL scripts provided in the Database_setup.sql file to create and populate the database.</li>
        <li><strong>Run the Queries:</strong> Use the SQL queries provided in the SQL_queries.sql file to perform your analysis.</li>
        <li><strong>Explore and Modify:</strong> Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.</li>
    </ol>

    <p><strong>Author:</strong> Ameer Hamza Ch</p>
    <p>This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!</p>

</body>
</html>