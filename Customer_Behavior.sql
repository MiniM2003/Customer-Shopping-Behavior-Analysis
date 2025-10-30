-- Most purchased categories
SELECT category, COUNT(*) AS total_purchases
FROM customer.customer_info
GROUP BY category
ORDER BY total_purchases DESC;

-- Highest revenue-generating categories
SELECT category, SUM(purchase_amount) AS total_revenue
FROM customer.customer_info
GROUP BY category
ORDER BY total_revenue DESC;

-- Average revenue per payment method
SELECT payment_method, AVG(purchase_amount) AS avg_revenue
FROM customer.customer_info
GROUP BY payment_method
ORDER BY avg_revenue DESC;

-- Purchases by gender
SELECT gender, COUNT(*) AS total_purchases, SUM(purchase_amount) AS total_spent
FROM customer.customer_info
GROUP BY gender;

-- Average spend by age group
SELECT age_group, AVG(purchase_amount) AS avg_spend
FROM customer.customer_info
GROUP BY age_group
ORDER BY avg_spend DESC;

-- Top locations by revenue
SELECT location, SUM(purchase_amount) AS total_revenue
FROM customer.customer_info
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 5;

-- Identify loyal customers (frequent purchasers)
SELECT  COUNT(*) AS loyal_customers
FROM customer.customer_info
WHERE previous_purchases > 10;

-- Sales by season
SELECT season, SUM(purchase_amount) AS total_revenue
FROM customer.customer_info
GROUP BY season
ORDER BY total_revenue DESC;

-- Average review rating by category
SELECT category, ROUND(AVG(review_rating), 2) AS avg_rating
FROM customer.customer_info
GROUP BY category
ORDER BY avg_rating DESC;

-- Subscription vs non-subscription customers
SELECT subscription_status, COUNT(DISTINCT customer_id) AS num_customers, AVG(purchase_amount) AS avg_purchase
FROM customer.customer_info
GROUP BY subscription_status;
