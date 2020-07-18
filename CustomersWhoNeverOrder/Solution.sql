# Runtime: 491 ms, faster than 81.85% of MySQL online submissions for Customers Who Never Order.
# Memory Usage: 0B, less than 100.00% of MySQL online submissions for Customers Who Never Order.

# Write your MySQL query statement below
select c.name as Customers
from customers c
     left join orders o
     on o.customerid=c.id
     where o.id is null