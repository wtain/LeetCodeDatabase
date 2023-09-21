/*
    Runtime
    Details
    1057ms
    Beats 96.78%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select manager.employee_id as employee_id,
       manager.name as name,
       count(*) as reports_count,
       round(avg(report.age)) as average_age
from Employees manager,
     Employees report
where report.reports_to=manager.employee_id
group by manager.employee_id,
         manager.name
having count(*) > 0
order by manager.employee_id;