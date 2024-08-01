# Write your MySQL query statement below

#count all the products
-- select count(distinct product_key) as p_count
-- from Product

with cte as (select customer_id, count(distinct product_key) as prod_count
from Customer
group by 1)
select customer_id from cte
where prod_count = (select count(distinct product_key) from Product)