# 🛒 Retail Sales Analysis using SQL

## 📌 Project Overview
This project demonstrates how SQL can be used to analyze retail sales data and extract meaningful business insights. The project includes database creation, data cleaning, exploratory data analysis (EDA), and SQL queries to answer real-world business questions.

---

## 🎯 Objectives
- Create and manage a retail sales database.
- Perform data cleaning and validation.
- Analyze customer purchasing behavior.
- Identify top-performing product categories.
- Generate business insights using SQL queries.

---

## 🛠️ Tools & Technologies
- MySQL Workbench
- SQL
- CSV Dataset
- Git & GitHub

---

## 📂 Dataset Information

The dataset contains retail transaction records with the following columns:

| Column Name | Description |
|-------------|-------------|
| transaction_id | Unique transaction ID |
| sale_date | Date of purchase |
| sale_time | Time of purchase |
| customer_id | Customer ID |
| gender | Customer Gender |
| age | Customer Age |
| category | Product Category |
| quantity | Quantity Purchased |
| price_per_unit | Price of each item |
| cogs | Cost of Goods Sold |
| total_sale | Total Sale Amount |

---

## 📊 Project Workflow

### 1️⃣ Database Creation
- Created Retail Database
- Created Retail Sales Table
- Imported CSV Dataset

### 2️⃣ Data Cleaning
- Checked NULL values
- Removed missing records
- Validated dataset

### 3️⃣ Data Analysis
Performed SQL queries to answer business questions.

---
# 📊 SQL Queries & Outputs

## Query 1: View All Sales Records

**SQL Query**
```sql
SELECT * FROM retail_sales;
```

**Output**

<img width="876" height="453" alt="image" src="https://github.com/user-attachments/assets/4b1492ef-b338-407b-ba6e-a2d7bceb6733" />


---

## Query 2: Check for NULL Values

**SQL Query**
```sql
SELECT *
FROM retail_sales
WHERE sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL;
```

**Output**

<img width="877" height="452" alt="image" src="https://github.com/user-attachments/assets/48a80dd3-6ffb-47c7-9d8f-0d1dd3b16a31" />


---

## Query 3: Sales on a Specific Date

**SQL Query**
```sql
SELECT *
FROM retail_sales
WHERE sale_date='2022-11-05';
```

**Output**
<img width="900" height="191" alt="image" src="https://github.com/user-attachments/assets/747bcba2-4e37-4aac-910b-490aec9e80e0" />

---

## Query 4: Clothing Sales (Quantity ≥ 4)

**SQL Query**
```sql
SELECT * FROM retail_sales
WHERE category ='clothing' AND DATE_FORMAT(sale_date, '%Y-%m')='2022-11’ 
AND quantity >= 4;

```

**Output**

<img width="900" height="212" alt="image" src="https://github.com/user-attachments/assets/9613d697-08fd-431b-afa7-fc7779842e60" />

---

## Query 5: Total Sales by Category

**SQL Query**
```sql
SELECT category, 
SUM(total_sale) as net_sale, COUNT(*) AS total_orders
FROM retail_salesGROUP BY category;

```

**Output**

<img width="868" height="275" alt="image" src="https://github.com/user-attachments/assets/d3fe7e86-2344-4c8a-96ff-7269bf10144f" />


---

## Query 6: Average Age of Beauty Customers

**SQL Query**
```sql
SELECT AVG(age) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

```

**Output**

<img width="900" height="133" alt="image" src="https://github.com/user-attachments/assets/559b7550-72df-4c64-8bc7-342607edd528" />


---

## Query 7: Transactions Above ₹1000

**SQL Query**
```sql
SELECT *
FROM retail_sales
WHERE total_sale>1000;
```

**Output**

<img width="764" height="396" alt="image" src="https://github.com/user-attachments/assets/ee43f178-61e7-4752-90f1-d845e8398c28" />

---

## Query 8: Transactions by Gender & Category

**SQL Query**
```sql
SELECT category, gender, COUNT(*) AS total_trans 
FROM retail_sales 
GROUP BY category, gender
ORDER BY category;

```

**Output**

<img width="1052" height="332" alt="image" src="https://github.com/user-attachments/assets/d5f021ff-2afe-4114-9053-539ade8efb1b" />


---

## Query 9: Average Sales per Month

**SQL Query**

```sql
SELECT 
EXTRACT(YEAR FROM sale_date) AS year, EXTRACT(MONTH FROM sale_date) AS month, AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY year, month;

```

**Output**

<img width="454" height="453" alt="image" src="https://github.com/user-attachments/assets/c96d4a6e-b522-4f67-a9ac-da27155869d2" />



---
## Query 10: Top 5 Customers by Total Sales

**SQL Query**

```sql
SELECT customer_id, SUM(total_sale) AS total_sale
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;

```

**Output**
<img width="568" height="451" alt="image" src="https://github.com/user-attachments/assets/5e762cff-d1ee-4d3c-b885-9261bc1ad72d" />


---
## Query 11: Best-Selling Category

**SQL Query**

```sql
SELECT category, COUNT(DISTINCT customer_id) AS uniq_cust
FROM retail_sales
GROUP BY category;

```

**Output**

<img width="651" height="444" alt="image" src="https://github.com/user-attachments/assets/87184792-5bcc-433e-82e0-6714bd174f2f" />

---
## Query 12: create each shift and number of orders

**SQL Query**

```sql
SELECT CASE 
WHEN HOUR(sale_time) < 12 THEN 'Morning’ 
WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon’ 
ELSE 'Evening’
END AS Shift,
COUNT(*) AS num_of_orders
FROM retail_sales
GROUP BY Shift;

```

**Output**
<img width="1324" height="330" alt="image" src="https://github.com/user-attachments/assets/10e7cc01-d554-4102-aff2-d68a04bdffcd" />

---

## 💡 Key Business Insights

- Clothing and Beauty categories generated strong sales.
- High-value customers contributed significantly to revenue.
- Monthly sales trends reveal seasonal purchasing patterns.
- Customer demographics help understand buying behavior.
- SQL enables efficient business decision-making through data analysis.

---

## 🧠 SQL Concepts Used

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- COUNT()
- SUM()
- AVG()
- DISTINCT
- CASE
- Aggregate Functions
- Data Cleaning
- Filtering
- Sorting

---


## 🚀 How to Run the Project

1. Clone this repository.
2. Open MySQL Workbench.
3. Create a new database.
4. Import the retail_sales.csv dataset.
5. Run the `Retail_Sales_Analysis.sql` script.
6. View the query results and business insights.

---

## 📷 Project Screenshots

> Add screenshots of your SQL queries and outputs in the `screenshots` folder.

---

## 📌 Future Improvements

- Connect SQL database with Power BI.
- Build an interactive dashboard.
- Automate reporting using Python.
- Add advanced SQL queries using Window Functions and CTEs.

---

## 👩‍💻 Author

**Nandini Wadile**

Aspiring Data Analyst

### Connect with Me

- 🔗 LinkedIn: https://www.linkedin.com/in/nandiniwadile
- 💻 GitHub: https://github.com/Nandiniwadile

---

## ⭐ If you found this project helpful, don't forget to Star ⭐ this repository!
