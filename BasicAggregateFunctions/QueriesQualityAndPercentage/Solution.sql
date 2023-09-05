/*
    Runtime
    Details
    1483ms
    Beats 44.98%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select query_name,
    round(sum(rating/position) / count(*), 2) as quality,
    round(100 * sum(poor) / count(*), 2) as poor_query_percentage
from (
    select query_name, rating, position,
        case
            when rating < 3 then 1
            else 0
        end as poor
    from Queries
) subquery
group by query_name;