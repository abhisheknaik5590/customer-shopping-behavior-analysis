select * from customer
--01.  total revenue by male and female
select gender, SUM(purchase_amount) as revenue
from customer
group by gender

--02. which customer used the discount but still spent more than average purchase amount
select customer_id, purchase_amount
from customer
where discount_applied = 'Yes' and purchase_amount >=(select AVG(purchase_amount) from customer)

--03. top 5 highest average revenue
select item_purchased, ROUND(AVG(review_rating::numeric),2) as "Average Product Rating"
from customer
group by item_purchased
order by avg(review_rating) desc
limit 5;

--04. 
select shipping_type,
ROUND(AVG(purchase_amount),2)
from customer
where shipping_type in ('Standard','Express')
group by shipping_type

--05.
select subscription_status,
COUNT (customer_id) as total_customers,
ROUND(AVG(purchase_amount),2) as avg_spend,
ROUND(SUM(purchase_amount),2) as total_revenue
from customer
group by subscription_status
order by total_revenue , avg_spend desc;
--06.
select item_purchased,
ROUND(100 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS discount_rate
from customer
group by item_purchased
order by discount_rate desc
limit 5;

--07.
WITH customer_type as(
select customer_id, previous_purchases,
case
    when previous_purchases = 1 then 'New'
	WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
	else 'Loyal'
	End as customer_segment
from customer
)
select customer_segment, count(*) as " Number of Customers"
from customer_type
group by customer_segment

--8.
with item_counts as (
select category,
item_purchased,
COUNT(customer_id) as total_orders,
Row_number() over (partition by category order by count(customer_id)DESC) as item_rank
FROM customer
group by category, item_purchased
)
select item_rank, category, item_purchased, total_orders
from item_counts
where item_rank <= 3;

--09.
select subscription_status,
count(customer_id) as rep