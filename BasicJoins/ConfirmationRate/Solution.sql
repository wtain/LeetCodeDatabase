/*
    Runtime
    Details
    1764ms
    Beats 26.81%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select su.user_id, coalesce(subquery.confirmation_rate, 0) as confirmation_rate
from Signups su
left join
(
    select confirmed.user_id, round(confirmed.confirmed_count / total.total_count, 2) as confirmation_rate
    from
    (
        select user_id, count(*) as confirmed_count
        from Confirmations
        where action='confirmed'
        group by user_id
    ) confirmed,
    (
        select user_id, count(*) as total_count
        from Confirmations
        group by user_id
    ) as total
    where total.user_id=confirmed.user_id
) subquery
on subquery.user_id=su.user_id;