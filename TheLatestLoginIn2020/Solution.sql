-- Runtime: 628 ms, faster than 52.25% of MySQL online submissions for The Latest Login in 2020.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for The Latest Login in 2020.
select
	user_id,
	max(time_stamp) as last_stamp
from Logins
where time_stamp between '2020-01-01' and '2021-01-01'
group by user_id;