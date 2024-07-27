# Write your MySQL query statement below
select round(sum(tiv_2016),2) as tiv_2016 from
(select *, count(*) over(partition by tiv_2015) as t_15_cnt, count(*) over (partition by lat,lon) as loc_cnt
from Insurance) as cnt_table
where loc_cnt = 1 and t_15_cnt !=1
