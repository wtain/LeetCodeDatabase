/*
    Runtime
    Details
    2238ms
    Beats 13.59%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select project_id,
       round(sum(e.experience_years) / count(*), 2) as average_years
from Project p,
     Employee e
where p.employee_id=e.employee_id
group by project_id;