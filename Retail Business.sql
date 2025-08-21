SELECT c.city_name, SUM(s.total_amount) AS total_sales
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
JOIN city c ON cu.city_id = c.city_id
GROUP BY c.city_name
ORDER BY total_sales DESC;
SELECT cu.customer_name, SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
GROUP BY cu.customer_id, cu.customer_name
ORDER BY total_spent DESC
LIMIT 5;
SELECT p.product_name, SUM(s.quantity) AS total_units_sold, SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold DESC;
SELECT strftime('%Y-%m', s.sale_date) AS month, SUM(s.total_amount) AS monthly_sales
FROM sales s
GROUP BY month
ORDER BY month;
SELECT p.category, SUM(s.total_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;
SELECT c.city_name,
       SUM(s.total_amount) * 1.0 / c.population AS sales_per_capita
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
JOIN city c ON cu.city_id = c.city_id
GROUP BY c.city_name
ORDER BY sales_per_capita DESC;
