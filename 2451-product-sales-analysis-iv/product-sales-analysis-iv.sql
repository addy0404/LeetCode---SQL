# Write your MySQL query statement below
with cte1 as (
    select user_id, product_id, sum(quantity) as total_quantity
    from Sales
    group by 1,2
),
cte2 as 
    (select s.user_id, s.product_id,  rank() over (partition by s.user_id order by (s.total_quantity * p.price) desc) as rn
from cte1 as s
LEFT JOIN Product as p
on p.product_id = s.product_id
)
select user_id, product_id from cte2
where rn =1