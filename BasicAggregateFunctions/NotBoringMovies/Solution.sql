/*
    Runtime
    Details
    650ms
    Beats 12.30%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
# Write your MySQL query statement below
select * from cinema where mod(id, 2) = 1 and description <> 'boring' order by rating desc;