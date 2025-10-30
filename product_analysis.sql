-- Top Products
SELECT 
    p.name, 
    SUM(s.quantity) AS total_quantity, 
    SUM(s.sales) AS total_sales
FROM product p
    JOIN sales s ON p.product_key = s.product_key
GROUP BY p.name
ORDER BY total_quantity DESC, total_sales DESC;

-- Category & Sub-category Performance
SELECT 
    p.category, 
    p.sub_category, 
    SUM(s.quantity) AS total_quantity, 
    SUM(s.sales) AS total_sales
FROM product p
    JOIN sales s ON p.product_key = s.product_key
GROUP BY p.category, p.sub_category
ORDER BY total_quantity DESC, total_sales DESC;

-- Product Trends
SELECT o.order_month,
       p.category,
       SUM(s.quantity) AS qty,
       SUM(s.sales) AS sales
FROM sales s
    JOIN product p ON s.product_key = p.product_key
    JOIN orders o ON s.order_key = o.order_key
GROUP BY order_month, p.category
ORDER BY order_month, sales DESC;