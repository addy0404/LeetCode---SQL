# Write your MySQL query statement below
with order_type_table as (select case when order_date = customer_pref_delivery_date then "immediate" else "scheduled" end as order_type
from 
(select *, rank() over (partition by customer_id order by order_date) as rn
from Delivery) as rank_table
where rn = 1)
select round(sum(case when order_type="immediate" then 1 else 0 end)/count(*) * 100,2) as immediate_percentage from order_type_table