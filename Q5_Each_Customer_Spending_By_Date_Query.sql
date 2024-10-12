SELECT 
    c.name AS customer_name, 
    DATE(o.order_date) AS order_date,
    SUM(oi.quantity * i.price) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN orders_items oi ON o.id = oi.order_id
JOIN items i ON oi.item_id = i.id
GROUP BY c.name, DATE(o.order_date);