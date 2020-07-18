# Runtime: 1776 ms, faster than 81.10% of MySQL online submissions for Delete Duplicate Emails.
# Memory Usage: 0B, less than 100.00% of MySQL online submissions for Delete Duplicate Emails.
# Write your MySQL query statement below
delete p2
from person p1,
     person p2
where p1.email = p2.email 
  and p2.id > p1.id