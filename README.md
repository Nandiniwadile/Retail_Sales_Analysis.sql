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

![Query 1 Output](screenshots/query1_output.png)

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

![Query 2 Output](screenshots/query2_output.png)

---

## Query 3: Sales on a Specific Date

**SQL Query**
```sql
SELECT *
FROM retail_sales
WHERE sale_date='2022-11-05';
```

**Output**

![Query 3 Output](screenshots/query3_output.png)

---

## Query 4: Clothing Sales (Quantity ≥ 4)

**SQL Query**
```sql
SELECT *
FROM retail_sales
WHERE category='Clothing'
AND quantity>=4
AND YEAR(sale_date)=2022
AND MONTH(sale_date)=11;
```

**Output**

![Query 4 Output](screenshots/query4_output.png)

---

## Query 5: Total Sales by Category

**SQL Query**
```sql
SELECT
category,
SUM(total_sale) AS total_sales,
COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
```

**Output**

![Query 5 Output](screenshots/query5_output.png)

---

## Query 6: Average Age of Beauty Customers

**SQL Query**
```sql
SELECT
ROUND(AVG(age),2) AS average_age
FROM retail_sales
WHERE category='Beauty';
```

**Output**

![Query 6 Output](screenshots/query6_output.png)

---

## Query 7: Transactions Above ₹1000

**SQL Query**
```sql
SELECT *
FROM retail_sales
WHERE total_sale>1000;
```

**Output**

![Query 7 Output](screenshots/query7_output.png)

---

## Query 8: Top 5 Customers by Total Sales

**SQL Query**
```sql
SELECT
customer_id,
SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

**Output**

![Query 8 Output](screenshots/query8_output.png)

---

## Query 9: Best Selling Category

**SQL Query**
```sql
SELECT
category,
SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY category
ORDER BY total_quantity DESC;
```

**Output**

![Query 9 Output](screenshots/query9_output.png)

---

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
