/*
    Runtime
    Details
    1373ms
    Beats 24.15%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select
    round(
        sum(case
                when next_date.player_id is not null then 1
                else 0
            end) / count(*),
    2) as fraction
from
(
    select player_id, min(event_date) as first_date
    from Activity
    group by player_id
) first
left join
Activity next_date
on next_date.player_id=first.player_id
and next_date.event_date=date_add(first.first_date, INTERVAL 1 DAY);