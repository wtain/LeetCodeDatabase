/*
    Runtime
    Details
    845ms
    Beats 98.26%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by teacher_id;