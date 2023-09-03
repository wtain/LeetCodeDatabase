/*
Runtime
Details
2810ms
Beats 14.61%of users with MySQL
Memory
Details
0.00MB
Beats 100.00%of users with MySQL
*/
select p.product_name, s.year, s.price
from Sales s, Product p
where s.product_id=p.product_id;