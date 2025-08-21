Retail Business Insights Using SQL (City, Customers, Products & Sales)
 Project Overview

This project analyzes retail sales data to uncover insights about customer spending, product performance, and city-level sales trends. The analysis is done using SQL and is designed to showcase core data analytics .
The project follows the data analysis lifecycle:

Data Collection (CSV → SQL tables)

Data Cleaning (ensuring integrity, foreign keys)

Data Analysis (SQL queries to answer business questions)

Insights & Reporting

 Dataset Description

city.csv → Contains city details (city_id, city_name, population, avg_rent, city_rank)

customers.csv → Contains customer details (customer_id, customer_name, city_id)

products.csv → Product catalog (product_id, product_name, category, price)

sales.csv → Sales transactions (sale_id, customer_id, product_id, quantity, total_amount, sale_date)

 Business Questions Answered
1. Total sales by city
SELECT c.city_name, SUM(s.total_amount) AS total_sales
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
JOIN city c ON cu.city_id = c.city_id
GROUP BY c.city_name
ORDER BY total_sales DESC;


Insight: Helps identify the top-performing cities by total revenue.

2. Top 5 customers by spending
SELECT cu.customer_name, SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
GROUP BY cu.customer_id, cu.customer_name
ORDER BY total_spent DESC
LIMIT 5;


Insight: Reveals high-value customers for loyalty and retention strategies.

3. Best-selling products
SELECT p.product_name, SUM(s.quantity) AS total_units_sold, SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold DESC;


Insight: Shows which products drive the most sales (units + revenue).

4. Monthly sales trend
SELECT strftime('%Y-%m', s.sale_date) AS month, SUM(s.total_amount) AS monthly_sales
FROM sales s
GROUP BY month
ORDER BY month;


Insight: Highlights sales growth patterns and seasonality.

5. Category-wise revenue contribution
SELECT p.category, SUM(s.total_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;


Insight: Determines which product categories generate the most revenue.

6. Sales per capita by city
SELECT c.city_name,
       SUM(s.total_amount) * 1.0 / c.population AS sales_per_capita
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
JOIN city c ON cu.city_id = c.city_id
GROUP BY c.city_name
ORDER BY sales_per_capita DESC;