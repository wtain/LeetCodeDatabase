-- select distinct employee_id 
-- from
-- (
-- 	select e.employee_id
-- 	from Employees e
-- 	right join
-- 	Salaries s
-- 	on s.employee_id=e.employee_id or s.employee_id is null
-- ) q1
-- union all
-- (
-- 	select s.employee_id
-- 	from Salaries s
-- 	right join
-- 	Employees e
-- 	on s.employee_id=e.employee_id or e.employee_id is null
-- );


-- select
-- 		case
-- 			when s.employee_id is null then e.employee_id
-- 			else s.employee_id
-- 		end as employee_id
-- from
-- 		Employees e
-- full outer join Salaries s
-- on e.employee_id=s.employee_id
-- where e.name is null or s.salary is null
-- order by employee_id;


-- select
-- 		case
-- 			when s.employee_id is null then e.employee_id
-- 			else s.employee_id
-- 		end as employee_id
-- from
-- 		Employees e
-- left join Salaries s
-- on e.employee_id=s.employee_id
-- where e.name is null or s.salary is null
-- order by employee_id;


-- Runtime: 521 ms, faster than 57.29% of MySQL online submissions for Employees With Missing Information.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Employees With Missing Information.
-- https://leetcode.com/problems/employees-with-missing-information/discuss/1892876/MySQL-easy-to-understand-find-all-employee_id-then-join-to-find-the-missing-ones
with t as (
	select employee_id
	from employees
	union
	select employee_id
	from salaries
)
select a.employee_id
from t a
left join employees b
on a.employee_id=b.employee_id
left join salaries c
on a.employee_id=c.employee_id
where b.name is null or c.salary is null
order by employee_id;