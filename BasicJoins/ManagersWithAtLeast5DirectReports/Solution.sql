/*
    Runtime
    Details
    621ms
    Beats 57.28%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select name
from Employee
where id in (
    select manager.id
    from Employee employee,
         Employee manager
    where manager.id=employee.managerId
    group by manager.id
    having count(*) >= 5
);