# Write your MySQL query statement below
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

-- select dept.name as Department, emp.name as Employee, emp.salary as Salary
-- from Employee as emp
-- LEFT JOIN Department as dept
-- ON dept.id = emp.departmentId
-- where (dept.id,emp.salary) 
-- IN (select departmentId, MAX(salary)
-- from Employee
-- group by 1)




