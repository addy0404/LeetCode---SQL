# Write your MySQL query statement below
select s.user_id, round(COALESCE(table_2.confirmation_rate,0),2) as confirmation_rate from Signups s
left join
(select user_id,sum(case when action="confirmed" then 1 else 0 end)/count(*) as confirmation_rate
from Confirmations
group by 1) as table_2
On s.user_id = table_2.user_id

