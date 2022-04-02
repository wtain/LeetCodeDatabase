-- Runtime: 813 ms, faster than 18.99% of MySQL online submissions for Fix Names in a Table.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Fix Names in a Table.
select 
	user_id, 
	CONCAT(upper(SUBSTRING(name, 1, 1)), lower(SUBSTRING(name, 2))) as name
from Users
order by user_id;



-- {"headers":{"Users":["user_id","name"]},"rows":{"Users":[[593,"DAlia"],[944,"FREIda"],[222,"refAEL"]]}}
-- {"headers":["user_id","name"],"values":[[222,"Refael"],[593,"Dalia"],[944,"Freida"]]}