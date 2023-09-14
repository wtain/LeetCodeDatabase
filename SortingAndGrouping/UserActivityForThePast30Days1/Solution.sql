/*
    Runtime
    Details
    874ms
    Beats 89.73%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/

-- Runtime: 344 ms, faster than 99.35% of MySQL online submissions for User Activity for the Past 30 Days I.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for User Activity for the Past 30 Days I.
select activity_date as day, count(*) as active_users
from (
	select activity_date, user_id
	from Activity
	group by activity_date, user_id
) subquery
where activity_date <= '2019-07-27'
and activity_date > '2019-06-27' -- dateadd(day, -30, '2019-07-27')
group by activity_date;