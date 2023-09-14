/*
    Runtime
    Details
    1511ms
    Beats 99.81%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select p.product_id,
       first_year.year as first_year,
       s.quantity,
       s.price
from Sales s,
     Product p,
     (
        select product_id, min(year) as year
        from Sales
        group by product_id
    ) first_year
where s.product_id=p.product_id
and first_year.product_id=p.product_id
and first_year.year=s.year;