-- Order Volume
SELECT
    order_year,
    order_month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Shipping Mode Performance
SELECT
    o.ship_mode,
    COUNT(o.order_id) AS total_orders,
    SUM(s.sales) AS total_sales,
    SUM(s.profit) AS total_profit,
    AVG(DATEDIFF(o.ship_date, o.order_date)) AS avg_delivery_day,
    MIN(DATEDIFF(o.ship_date, o.order_date)) AS min_delivery_day,
    MAX(DATEDIFF(o.ship_date, o.order_date)) AS max_delivery_day
FROM orders o
    JOIN sales s ON o.order_key = s.order_key
GROUP BY o.ship_mode
ORDER BY total_sales;

-- Lead Time Analysis
SELECT
    DATEDIFF(o.ship_date, o.order_date) AS lead_time,
    AVG(s.sales) AS avg_sales
FROM orders o
    JOIN sales s ON o.order_key = s.order_key
GROUP BY lead_time
ORDER BY lead_time