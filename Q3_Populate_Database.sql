USE pizzaria;

INSERT INTO `pizzaria`.`customers` (`id`, `name`, `phone_number`) VALUES
(1, 'Trevor Page', '226-555-4982'), 
(2, 'John Doe', '555-555-9498');

INSERT INTO `pizzaria`.`items` (`id`, `name`, `price`) VALUES
(1, "Pepperoni & Cheese", 7.99),
(2, "Vegetarian", 9.99),
(3, "Meat Lovers", 14.99),
(4, "Hawaiian", 12.99);

INSERT INTO `pizzaria`.`orders` (`id`, `customer_id`, `order_date`) VALUES
(1, 1, '2023-09-10 09:47:00'),
(2, 2, '2023-09-10 13:20:00'),
(3, 1, '2023-09-10 09:47:00'),
(4, 2, '2023-10-10 10:37:00');

INSERT INTO `pizzaria`.`orders_items` (`orders_id`, `items_id`, `quantity`) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(2, 3, 2),
(3, 3, 1),
(3, 4, 1),
(4, 2, 3),
(4, 4, 1);



