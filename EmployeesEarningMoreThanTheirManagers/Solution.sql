# Runtime: 393 ms, faster than 71.21% of MySQL online submissions for Employees Earning More Than Their Managers.
# Memory Usage: 0B, less than 100.00% of MySQL online submissions for Employees Earning More Than Their Managers.

# Write your MySQL query statement below

select subordinate.name as Employee 
from employee subordinate,
     employee manager
where subordinate.managerid = manager.id
and (manager.salary < subordinate.salary)
