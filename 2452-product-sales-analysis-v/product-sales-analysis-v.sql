# Write your MySQL query statement below
select s.user_id, sum(s.quantity * p.price) as spending
    from Sales as s
    LEFT JOIN Product as p
    ON p.product_id = s.product_id
    group by s.user_id
order by spending desc