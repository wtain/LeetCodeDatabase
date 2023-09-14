/*
    Runtime
    Details
    489ms
    Beats 98.53%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
# Write your MySQL query statement below
select class
from Courses
group by class
having count(distinct student) >= 5