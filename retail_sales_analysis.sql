CREATE DATABASE retail;
USE retail;

-- Database Setup

CREATE TABLE retail_sales ( 
transactions_id int,	
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(10),
age	INT,
category VARCHAR(100),
quantiy INT,
price_per_unit FLOAT,	
cogs FLOAT,	
total_sale FLOAT)

Basic Data Checks

select*from retail_sales

-- record count : determine the total number of records in the dataset
select count(*) from retail_sales;

-- customer count : find out how many unique customer
select count(DISTINCT customer_id) as unique_customer from retail_sales;

-- category count : identify all unique product category
select count(DISTINCT category) as unique_category from retail_sales;

-- null value check : check for any null value in dataset and delete records with missing data
-- null value check : check for any null value in dataset and delete records with missing data
SELECT * FROM retail_sales
WHERE
sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR gender IS NULL OR
age IS NULL OR category IS NULL OR quantiy IS NULL OR price_per_unit IS NULL OR
cogs is null;
SELECT * FROM retail_sales;
SET SQL_SAFE_UPDATES = 1;
DELETE FROM retail_sales
WHERE
sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR gender IS NULL OR
age IS NULL OR category IS NULL OR quantiy IS NULL OR price_per_unit IS NULL OR
cogs is null;

-- Q1 write a sql queries to retrieve all columns for sales made on '2022-11-05':

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q2 write a sql query to retrieve all transactions where the category is 'clothing' and 
-- the quantity sold is more than 4 in the month of nov-22:

SELECT * FROM retail_sales
WHERE category ='clothing' AND DATE_FORMAT(sale_date, '%Y-%m')='2022-11'
AND quantity >= 4;

-- Q3 write a sql query to calculate the total sales (total_sale) for each category:

SELECT category, SUM(total_sale) as net_sale, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Q4 write a sql query to find the average age of customer who purchased items from
-- the beauty category

SELECT ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category='Beauty';

-- Q5 write a sql query to find all transactions where the total_sale > 1000

SELECT * FROM retail_sales
WHERE total_sale > 1000;


-- Q6 write a sql query to find the total no. of transactions (transaction_id) made by each 
-- gender in each category

SELECT category, gender, COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Q7 write a sql query to calculate the average sale for each month. find out best selling
-- month in each year

SELECT
 EXTRACT(YEAR FROM sale_date) AS year,
 EXTRACT(MONTH FROM sale_date) AS month,
 AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY year, month;

-- Q8 write a sql query to find the top 5 customer based on the highest total sales

SELECT customer_id, SUM(total_sale) AS total_sale
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;

-- Q9 write a sql query to find the number of unique customer who purchased item from
-- each category

SELECT category, COUNT(DISTINCT customer_id) AS uniq_cust
FROM retail_sales
GROUP BY category;

-- Q10 write a sql query to create each shift and number of orders (

SELECT CASE
 WHEN HOUR(sale_time) < 12 THEN 'Morning'
 WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
 ELSE 'Evening'
END AS Shift,
COUNT(*) AS num_of_orders
FROM retail_sales
GROUP BY Shift;

