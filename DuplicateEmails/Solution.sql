# Write your MySQL query statement below

# Runtime: 336 ms, faster than 88.99% of MySQL online submissions for Duplicate Emails.
# Memory Usage: 0B, less than 100.00% of MySQL online submissions for Duplicate Emails.

select distinct a.email as Email
from person a,
     person b
where a.email = b.email and a.id > b.id