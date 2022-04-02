-- Runtime: 567 ms, faster than 21.74% of MySQL online submissions for Group Sold Products By The Date.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Group Sold Products By The Date.
select sell_date, 
	   count(distinct product) as num_sold,
	   GROUP_CONCAT(distinct product order by product) as products
from Activities
group by sell_date
order by sell_date; 