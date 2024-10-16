USE pizzaria;

SELECT c.name AS customer_name, sum(i.price * oi.quantity) AS total_expense 
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN orders_items oi ON o.id = oi.order_id
JOIN items i ON oi.item_id = i.id
GROUP BY c.id;

