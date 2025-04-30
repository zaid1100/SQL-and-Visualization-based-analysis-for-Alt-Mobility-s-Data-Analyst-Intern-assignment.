select * from customer_orders;

-- check null values
select * from customer_orders
where customer_id is null;

-- total Unique customers-- 
select count(distinct customer_id) as total_unique_customers  from customer_orders ;

-- total orders-- 
select count(order_id) as total_orders from customer_orders;

-- count of shipping_address  Top 3

select shipping_address,count(shipping_address) as total_address from customer_orders
group by shipping_address
order by total_address desc
limit 3;

 -- ount of order_status-- 
select order_status,count(order_status) as total_status from customer_orders
group by order_status;

-- Sum of order_amount
select floor(sum(order_amount)) as total_order_amount  from customer_orders;

-- Sum of order_amount based on shipping_address top 5
select shipping_address,floor(sum(order_amount)) as total_order_amount from customer_orders
group by shipping_address
order by total_order_amount desc
limit 5;

-- sum of order_amount based on order_status
select order_status,floor(sum(order_amount)) as total_order_amount from customer_orders
group by order_status;
-- those who ordered more than once
SELECT 
  customer_id, 
  COUNT(order_id) AS total_orders
FROM customer_orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1
ORDER BY total_orders DESC;
 


-- 2second table Payments
select * from payments;

-- sum of total payment amount 
select floor(sum(payment_amount)) as total_amount from payments;

-- Sum of payment_amount based on Payment_method-- 
select payment_method,floor(sum(payment_amount)) as total_amount from payments
group by payment_method;

-- total payment amount based on payment status
select payment_status,floor(sum(payment_amount)) from payments
group by payment_status;

 -- total amount paid or failed
SELECT 
  payment_status, 
  FLOOR(SUM(payment_amount)) AS total_amount
FROM payments
GROUP BY payment_status;
-- Joins both Tables
SELECT 
  co.order_id,
  co.customer_id,
  co.order_status,
  co.order_amount,
  p.payment_status,
  p.payment_amount,
  co.shipping_address
FROM customer_orders co
LEFT JOIN payments p ON co.order_id = p.order_id;

 -- Repeat Customer Count
 select customer_id,count(*) as repeat_customer from customer_orders 
 group by customer_id
 having count(*)>1
 order by repeat_customer desc;
 
 -- Orders with Failed Payments
 select payment_status,count(order_ID) as total_count from payments
 where payment_status = 'Failed'
 group by payment_status
 

