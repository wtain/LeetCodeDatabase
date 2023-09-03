/*
    Runtime
    Details
    2412ms
    Beats 29.36%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select e.name, b.bonus
from Employee e
     left join
     Bonus b
on e.empId=b.empId
where b.bonus < 1000 or b.empId is null;