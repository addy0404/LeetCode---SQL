# Write your MySQL query statement below
with tmp_table as (
    select departmentId, name, salary
    from (
    select departmentId, name, salary,dense_rank() over (partition by departmentId order by salary desc) as rn 
    from Employee) as rank_table
    where rn <=3
)
select dept.name as Department, 
        tmp_table.name as Employee,
        tmp_table.salary
    from tmp_table
    Join Department as dept
    on dept.id = tmp_table.departmentId