-- Runtime: 772 ms, faster than 13.09% of MySQL online submissions for Rearrange Products Table.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Rearrange Products Table.

select 
	product_id,
	'store1' as store,
	store1 as price 
from Products
where store1 is not null
union all
select 
	product_id,
	'store2' as store,
	store2 as price 
from Products
where store2 is not null
union all
select 
	product_id,
	'store3' as store,
	store3 as price 
from Products
where store3 is not null;


-- {"headers": ["product_id", "store1", "price"], "values": [[0, "store1", 95], [1, "store1", 70], [0, "store2", 100], [0, "store3", 105], [1, "store3", 80]]}
-- {"headers": ["product_id", "store", "price"], "values": [[0, "store1", 95], [1, "store1", 70], [0, "store2", 100], [0, "store3", 105], [1, "store3", 80]]}