# Write your MySQL query statement below

with cte1 as ( 
    (select requester_id as id from RequestAccepted)
    union all
    (select accepter_id as id from RequestAccepted) 
)

select id, count(id) as num
from cte1
group by 1
order by 2 desc
limit 1

