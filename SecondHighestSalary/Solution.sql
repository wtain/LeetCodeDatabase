# Runtime: 233 ms, faster than 69.98% of MySQL online submissions for Second Highest Salary.
# Memory Usage: 0B, less than 100.00% of MySQL online submissions for Second Highest Salary.

# Write your MySQL query statement below
select ifnull(
(
    select 
        distinct salary 
        from employee
        order by salary desc
        limit 1 offset 1
), null) as SecondHighestSalary