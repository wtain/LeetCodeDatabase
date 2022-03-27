-- select product_id, product_name  
-- from product
-- where product_id in (
-- 	select product_id
-- 	from sales
-- 	where sale_date < '2019-01-01' or sale_date > '2019-03-31'
-- );


-- select p.product_id, p.product_name
-- from product p, 
--      sales s1,
--      sales s2
-- where p.product_id=s1.product_id
-- and p.product_id=s2.product_id
-- and (s1.sale_date >= '2019-01-01' and s1.sale_date <= '2019-03-31')
-- and (s2.sale_date < '2019-01-01' or s2.sale_date > '2019-03-31');



-- Runtime: 1173 ms, faster than 47.89% of MySQL online submissions for Sales Analysis III.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Sales Analysis III.
select product_id, product_name  
from product
where product_id in (
	select product_id
	from sales
	where sale_date >= '2019-01-01' and sale_date <= '2019-03-31'
)
and product_id not in (
	select product_id
	from sales
	where sale_date < '2019-01-01' or sale_date > '2019-03-31'
);