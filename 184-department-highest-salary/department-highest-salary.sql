# Write your MySQL query statement below
-- select dept.name as Department, 
--         emp.name as Employee,
--         max(emp.salary) as Salary
-- FROM Department as dept
-- LEFT JOIN Employee as emp
-- ON emp.departmentId = dept.id
-- group by emp.departmentId
with tmp_table as (select name, departmentId, salary
from 
(select name, departmentId, salary, rank() over (partition by departmentId order by salary desc) as rn 
from Employee
) as rn_emp
where rn = 1)
select dept.name as Department, tmp_table.name as Employee, tmp_table.salary as Salary
from Department as dept
RIGHT JOIN tmp_table
ON tmp_table.departmentId = dept.id




