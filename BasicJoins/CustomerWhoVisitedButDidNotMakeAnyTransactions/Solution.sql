-- Runtime: 1119 ms, faster than 64.92% of MySQL online submissions for Customer Who Visited but Did Not Make Any Transactions.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Customer Who Visited but Did Not Make Any Transactions.
-- select customer_id, count(*) as count_no_trans
-- from (
-- 		select v.customer_id, v.visit_id, t.transaction_id
-- 		from Visits v left join
-- 			 Transactions t on v.visit_id=t.visit_id or t.transaction_id is null
-- 			 ) subquery
-- where transaction_id is null
-- group by customer_id;


-- Runtime: 2075 ms, faster than 5.06% of MySQL online submissions for Customer Who Visited but Did Not Make Any Transactions.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Customer Who Visited but Did Not Make Any Transactions.
select distinct customer_id, count(customer_id) over(partition by customer_id) as count_no_trans
from Visits where visit_id not in (select visit_id from Transactions);