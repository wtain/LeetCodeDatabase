-- Runtime: 1277 ms, faster than 43.81% of MySQL online submissions for Sales Person.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Sales Person.
select name from SalesPerson where sales_id not in (
	select sp.sales_id
	from Orders ord,
	     Company com,
	     SalesPerson sp
	where ord.com_id=com.com_id
	and ord.sales_id=sp.sales_id
	and com.name='RED'
);