with day_amt as (
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on
),
smmry as (
    select visited_on, 
        sum(amount) over w as amount,
        avg(amount) over w as average_amount,
        row_number() over w as row_no
    from day_amt
    window w as (order by visited_on rows between 6 preceding and current row)
)
select visited_on, amount, round(average_amount, 2) as average_amount
from smmry
where row_no>=7
order by visited_on