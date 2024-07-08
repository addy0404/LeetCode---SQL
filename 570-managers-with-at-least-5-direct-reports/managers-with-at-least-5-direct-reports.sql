# Write your MySQL query statement below
select name from Employee as e1
join
(select managerId
from Employee
group by managerId
Having COUNT(managerId)>=5) as e2
On e1.id = e2.managerId