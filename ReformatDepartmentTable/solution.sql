# Write your MySQL query statement below


	-- 	select id, 
	--        sum(revenue) as Jan_Revenue,
	--        null as Feb_Revenue, 
	-- 	   null as Mar_Revenue, 
	-- 	   null as Apr_Revenue, 
	-- 	   null as May_Revenue, 
	-- 	   null as Jun_Revenue, 
	-- 	   null as Jul_Revenue, 
	-- 	   null as Aug_Revenue, 
	-- 	   null as Sep_Revenue, 
	-- 	   null as Oct_Revenue, 
	-- 	   null as Nov_Revenue, 
	-- 	   null as Dec_Revenue
	-- from Department
	-- where month='Jan'
	-- union all
	-- 	select id, 
	--        null as Jan_Revenue,
	--        sum(revenue) as Feb_Revenue, 
	-- 	   null as Mar_Revenue, 
	-- 	   null as Apr_Revenue, 
	-- 	   null as May_Revenue, 
	-- 	   null as Jun_Revenue, 
	-- 	   null as Jul_Revenue, 
	-- 	   null as Aug_Revenue, 
	-- 	   null as Sep_Revenue, 
	-- 	   null as Oct_Revenue, 
	-- 	   null as Nov_Revenue, 
	-- 	   null as Dec_Revenue
	-- from Department
	-- where month='Feb'
	-- union all
	-- 	select id, 
	--        null as Jan_Revenue,
	--        null as Feb_Revenue, 
	-- 	   sum(revenue) as Mar_Revenue, 
	-- 	   null as Apr_Revenue, 
	-- 	   null as May_Revenue, 
	-- 	   null as Jun_Revenue, 
	-- 	   null as Jul_Revenue, 
	-- 	   null as Aug_Revenue, 
	-- 	   null as Sep_Revenue, 
	-- 	   null as Oct_Revenue, 
	-- 	   null as Nov_Revenue, 
	-- 	   null as Dec_Revenue
	-- from Department
	-- where month='Mar';


-- Runtime: 453 ms, faster than 71.43% of MySQL online submissions for Reformat Department Table.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Reformat Department Table.
-- select id, 
-- 	       sum(case when month='Jan' then revenue end) as Jan_Revenue,
-- 	       sum(case when month='Feb' then revenue end) as Feb_Revenue, 
-- 		   sum(case when month='Mar' then revenue end) as Mar_Revenue, 
-- 		   sum(case when month='Apr' then revenue end) as Apr_Revenue, 
-- 		   sum(case when month='May' then revenue end) as May_Revenue, 
-- 		   sum(case when month='Jun' then revenue end) as Jun_Revenue, 
-- 		   sum(case when month='Jul' then revenue end) as Jul_Revenue, 
-- 		   sum(case when month='Aug' then revenue end) as Aug_Revenue, 
-- 		   sum(case when month='Sep' then revenue end) as Sep_Revenue, 
-- 		   sum(case when month='Oct' then revenue end) as Oct_Revenue, 
-- 		   sum(case when month='Nov' then revenue end) as Nov_Revenue, 
-- 		   sum(case when month='Dec' then revenue end) as Dec_Revenue
-- 	from Department
-- 	group by id;


-- Runtime: 1463 ms, faster than 97.94% of MS SQL Server online submissions for Reformat Department Table.
-- Memory Usage: 0B, less than 100.00% of MS SQL Server online submissions for Reformat Department Table.
# T-SQL
/* Write your T-SQL query statement below */
select id, 
	       Jan as Jan_Revenue,
	       Feb as Feb_Revenue, 
		   Mar as Mar_Revenue, 
		   Apr as Apr_Revenue, 
		   May as May_Revenue, 
		   Jun as Jun_Revenue, 
		   Jul as Jul_Revenue, 
		   Aug as Aug_Revenue, 
		   Sep as Sep_Revenue, 
		   Oct as Oct_Revenue, 
		   Nov as Nov_Revenue, 
		   Dec as Dec_Revenue
	from Department
	pivot(
		sum(revenue) for month 
		in (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
		) as departmentpivot