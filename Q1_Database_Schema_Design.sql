-- --------------------------------------------------------------------------
-- Q1: Database Schema Design 
-- --------------------------------------------------------------------------

-- 1. Identify the entities and relationships

-- 	A customer can place multiple orders, but an order is linked to only one customer.
-- 	A Customer can choose from 4 different types of Pizzas.
-- 	A Customer must provide a name and a phone number.
-- 	Each Customer Order must keep track of the date/time.
-- 	Each order can contain multiple pizzas, and each pizza can be part of multiple orders.

-- 2. Database Schema Outline

-- Customers Table
-- ----------------------------------------------------------
-- id			| int			| primary key, auto_increment
-- name			| varchar(100)	|
-- phone_number	| varchar(15)	|

-- Items Table
-- ----------------------------------------------------------
-- id			| int			| primary key, auto_increment
-- name			| varchar(100)	|
-- unit_price	| decimal(5,2)	| not null default 0.0

-- Orders Table
-- ----------------------------------------------------------
-- id			| int			| primary key, auto_increment
-- customer_id	| int			| primary key, foreign key Customers (id)
-- order_date	| datetime		| not null

-- Orders_Items Table																
-- -------------------------------------------------------------------
-- order_id		| int			| primary key, foreign key Orders (id)	
-- item_id		| int 			| primary key, foreign key Items (id)	
-- quantity		| int			| not null default 1					
