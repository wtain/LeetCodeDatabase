-- 2814
-- ms
-- Beats
-- 18.90%
select category,
count(*)-1 as accounts_count
from
(
    (
        select
        case
            when income < 20000 then 'Low Salary'
            when income > 50000 then 'High Salary'
            else 'Average Salary'
        end as category
        from accounts
    )
    union all
    (
        select 'Low Salary' as category
        union
        select 'Average Salary' as category
        union
        select 'High Salary' as category
    )
) subquery
group by category;