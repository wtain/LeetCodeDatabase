/*
    Runtime
    Details
    853ms
    Beats 98.98%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select customer_id
from Customer
group by customer_id
having count(distinct product_key) = (select count(product_key) from Product);