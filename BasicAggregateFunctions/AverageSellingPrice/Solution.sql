/*
    Runtime
    Details
    1729ms
    Beats 50.33%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select p.product_id,
       round(sum(p.price*u.units) / sum(u.units), 2) as average_price
from Prices p,
     UnitsSold u
where p.product_id=u.product_id
and u.purchase_date BETWEEN p.start_date and p.end_date
group by p.product_id;