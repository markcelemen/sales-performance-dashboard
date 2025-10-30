-- Demographic Distribution
SELECT 
	region, 
    state, 
    city, 
    COUNT(customer_key) AS total_customers
FROM customer
GROUP BY region, state, city
ORDER BY total_customers DESC

-- Segment Performance
SELECT 
    c.segment, 
    SUM(s.sales) AS total_sales, 
    SUM(s.profit) AS total_profit, 
    SUM(s.quantity) AS total_quantity
FROM customer c
    JOIN orders o ON c.customer_key = o.customer_key
    JOIN sales s ON o.order_key = s.order_key
GROUP BY c.segment
ORDER BY total_sales DESC;

-- Geographic Insights
SELECT 
    c.region, 
    c.state, 
    c.city, 
    SUM(s.sales) AS total_sales, 
    SUM(s.profit) AS total_profit, 
    SUM(s.quantity) AS total_quantity
FROM customer c
    JOIN orders o ON c.customer_key = o.customer_key
    JOIN sales s ON o.order_key = s.order_key
GROUP BY c.region, c.state, c.city
ORDER BY total_sales DESC, total_profit DESC, total_quantity DESC;

-- Purchase Patterns
SELECT 
    c.name, 
    COUNT(o.order_key) AS order_frequency, 
    AVG(s.sales) AS average_sales, 
    p.name AS preferred_product
FROM customer c
    JOIN orders o ON c.customer_key = o.customer_key
    JOIN sales s ON o.order_key = s.order_key
    JOIN product p ON s.product_key = p.product_key
GROUP BY c.name, p.name
ORDER BY order_frequency DESC, average_sales DESC;