-- Runtime: 597 ms, faster than 51.58% of MySQL online submissions for Calculate Special Bonus.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Calculate Special Bonus.
select
	employee_id,
	case
		when mod(employee_id, 2) = 1 and substring(name, 1, 1) <> 'M' then salary 
		else 0
	end as bonus
from Employees;