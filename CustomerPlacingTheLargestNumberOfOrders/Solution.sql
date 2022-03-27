-- select customer_number from 
-- (
-- 	select customer_number, count(*) as order_count
-- 	from Orders
-- 	group by customer_number
-- ) subquery
-- having subquery.order_count=max(subquery.order_count);


-- Runtime: 515 ms, faster than 39.34% of MySQL online submissions for Customer Placing the Largest Number of Orders.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Customer Placing the Largest Number of Orders.
-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/solution/
select customer_number
from Orders
group by customer_number
order by count(*) desc
limit 1;



-- Runtime: 381 ms, faster than 92.40% of MySQL online submissions for Customer Placing the Largest Number of Orders.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Customer Placing the Largest Number of Orders.
-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/discuss/1862713/Using-window-function
select customer_number
from 
(
	select customer_number,
		   count(order_number) order_count,
		   rank() over(order by count(order_number) desc) order_rank
    from Orders
    group by customer_number
) subquery
where order_rank=1;