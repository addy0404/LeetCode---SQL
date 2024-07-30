# Write your MySQL query statement below
select p.product_name as product_name, s.year as year, s.price as price
from Sales as s
LEFT JOIN Product as p
On p.product_id = s.product_id