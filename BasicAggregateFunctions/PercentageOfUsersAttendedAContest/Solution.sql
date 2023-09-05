--total := select count(*) from Users;
--select contest_id,
--       round(100 * count(*) / total, 2) as percentage
--from Users u,
--     Register r
--where u.user_id=r.user_id
--group by contest_id;


/*
    Runtime
    Details
    2074ms
    Beats 47.68%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select contest_id,
       round(100 * count(*) / (
        select count(*) from Users
       ), 2) as percentage
from Users u,
     Register r
where u.user_id=r.user_id
group by contest_id
order by percentage desc, contest_id;