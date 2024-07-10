# Write your MySQL query statement below
select dept_name, count(student_id) as student_number 
from department 
left outer join student on student.dept_id = department.dept_id
group by dept_name
order by student_number desc, dept_name

