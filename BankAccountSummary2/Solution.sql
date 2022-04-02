-- Runtime: 661 ms, faster than 52.76% of MySQL online submissions for Bank Account Summary II.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Bank Account Summary II.
select name, sum(t.amount) as balance
from Users u,
	 Transactions t
where u.account=t.account
group by u.name, u.account
having balance > 10000;