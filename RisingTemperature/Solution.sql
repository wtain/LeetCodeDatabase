# Runtime: 329 ms, faster than 98.07% of MySQL online submissions for Rising Temperature.
# Memory Usage: 0B, less than 100.00% of MySQL online submissions for Rising Temperature.

# Write your MySQL query statement below
select wt.id
from Weather wt,
Weather wy
where wy.recorddate = date_add(wt.recorddate, interval -1 day)
and wt.temperature > wy.temperature