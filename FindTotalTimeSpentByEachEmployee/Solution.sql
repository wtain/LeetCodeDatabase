-- Runtime: 570 ms, faster than 34.79% of MySQL online submissions for Find Total Time Spent by Each Employee.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Find Total Time Spent by Each Employee.
select
	event_day as day,
	emp_id,
	sum(out_time - in_time) as total_time 
from Employees 
group by event_day, emp_id;