# Write your MySQL query statement below


with cte as (select customer_id, count(distinct product_key) as prod_count
from Customer
group by 1)
select customer_id from cte
where prod_count = (select count(distinct product_key) from Product)

-- select customer_id from Customer
-- group by 1
-- having count(distinct product_key) = (select count(product_key) from Product)