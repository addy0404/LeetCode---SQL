with day_amt as (
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on
),
smmry as (
    select visited_on, 
        sum(amount) over (order by visited_on rows between 6 preceding and current row) as amount,
        avg(amount) over (order by visited_on rows between 6 preceding and current row) as average_amount,
        row_number() over (order by visited_on) as row_no
    from day_amt
    
)
select visited_on, amount, round(average_amount,2) as average_amount from smmry
where row_no>=7
order by visited_on