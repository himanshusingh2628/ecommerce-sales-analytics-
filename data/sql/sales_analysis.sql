-- E-Commerce Sales Analysis
-- SQL Business Analysis

-- 1. Total Revenue
SELECT
    SUM(sales) AS total_revenue
FROM ecommerce_sales;


-- 2. Total Profit
SELECT
    SUM(profit) AS total_profit
FROM ecommerce_sales;


-- 3. Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales;


-- 4. Average Order Value
SELECT
    ROUND(
        SUM(sales) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM ecommerce_sales;


-- 5. Category-wise Sales
SELECT
    category,
    SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY category
ORDER BY total_sales DESC;


-- 6. Region-wise Sales
SELECT
    region,
    SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY region
ORDER BY total_sales DESC;


-- 7. Top 5 Products by Sales
SELECT
    product_name,
    SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;


-- 8. Profit by Category
SELECT
    category,
    SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY category
ORDER BY total_profit DESC;


-- 9. Payment Method Analysis
SELECT
    payment_method,
    COUNT(*) AS number_of_orders,
    SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_sales DESC;


-- 10. Monthly Sales Trend
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(sales) AS monthly_sales
FROM ecommerce_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    sales_year,
    sales_month;


-- 11. Highest Revenue Product
SELECT
    product_name,
    SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 1;


-- 12. Highest Profit Category
SELECT
    category,
    SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY category
ORDER BY total_profit DESC
LIMIT 1;
