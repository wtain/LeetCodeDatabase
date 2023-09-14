/*
    Runtime
    Details
    709ms
    Beats 97.58%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select max(num) as num
from (
    select num
    from MyNumbers
    group by num
    having count(*) = 1
) subquery;