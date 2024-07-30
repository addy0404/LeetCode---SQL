-- # Write your MySQL query statement below
with cte1 as (
    select product_id, min(year) as first_year
    from Sales
    group by 1
)
select cte1.product_id, cte1.first_year, s.quantity, s.price
from Sales as s
RIGHT JOIN cte1 on cte1.product_id = s.product_id AND cte1.first_year=s.year