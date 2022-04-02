-- Runtime: 1068 ms, faster than 5.52% of MySQL online submissions for Find Followers Count.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Find Followers Count.
select user_id, count(*) as followers_count
from Followers 
group by user_id
order by user_id;