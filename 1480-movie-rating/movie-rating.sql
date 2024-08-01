(select u.name as results
from MovieRating r
left join Users u
on u.user_id=r.user_id
group by u.name
order by count(distinct r.movie_id) desc, u.name asc
limit 1)

union all

(select m.title as results
from MovieRating r
left join Movies m
on m.movie_id=r.movie_id
where year(r.created_at) = '2020' and month(r.created_at) = 2
group by m.title
order by avg(r.rating) desc, m.title asc
limit 1)
