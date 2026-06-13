
-- Total sales revenue
SELECT 
    SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- Sales by product
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- Sales by region
SELECT 
    c.region,
    SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region;

-- Monthly sales trend
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
    SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month;
