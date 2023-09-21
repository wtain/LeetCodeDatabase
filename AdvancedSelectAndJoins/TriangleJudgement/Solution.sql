/*
    Runtime
    Details
    762ms
    Beats 17.91%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
--select x,
--       y,
--       z,
--       case
--         when
--            x >= y and x >= z and x < y+z and x > abs(y-z) or
--            y >= x and y >= z and y < x+z and y > abs(x-z) or
--            z >= y and z >= x and z < y+x and z > abs(y-x)
--         then 'Yes'
--         else 'No'
--       end as triangle
--from Triangle;



/*
    Runtime
    Details
    500ms
    Beats 84.35%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select x,
       y,
       z,
       case
         when
            x < y+z and x > abs(y-z) or
            y < x+z and y > abs(x-z) or
            z < y+x and z > abs(y-x)
         then 'Yes'
         else 'No'
       end as triangle
from Triangle;