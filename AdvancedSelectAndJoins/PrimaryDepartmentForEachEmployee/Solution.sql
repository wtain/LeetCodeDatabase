/*
    Runtime
    Details
    932ms
    Beats 98.22%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select e1.employee_id,
       e1.department_id
from Employee e1,
     (
        select employee_id,
               count(*) as cnt
        from Employee
        group by employee_id
     ) e2
where e1.employee_id=e2.employee_id
and (e2.cnt=1 or e1.primary_flag='Y');