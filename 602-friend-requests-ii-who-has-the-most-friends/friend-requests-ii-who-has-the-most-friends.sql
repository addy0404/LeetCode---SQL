# Write your MySQL query statement below

with cte1 as ( (select requester_id as id, count(distinct accepter_id) as num_friends
from RequestAccepted
group by 1)
union all
(select accepter_id as id, count(distinct requester_id) as num_friends
from RequestAccepted
group by 1))

select id, sum(num_friends) as num
from cte1
group by 1
order by 2 desc
limit 1