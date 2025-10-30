-- Overall Performance
SELECT 
    o.order_year, 
    o.order_month,
    SUM(s.sales) AS total_sales, 
    SUM(s.profit) AS total_profit, 
    SUM(s.quantity) AS total_qty
FROM sales s
    JOIN orders o ON s.order_key = o.order_key
GROUP BY o.order_year, o.order_month
ORDER BY o.order_year, o.order_month;

-- Profitability
SELECT 
    p.category, 
    p.sub_category, 
    SUM(s.profit_margin) AS profit_margin
FROM sales s
    JOIN product p ON s.product_key = p.product_key
GROUP BY p.category, p.sub_category
ORDER BY profit_margin DESC;

-- Discount Impact
SELECT 
    discount, 
    SUM(sales) AS total_sales, 
    SUM(profit) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;