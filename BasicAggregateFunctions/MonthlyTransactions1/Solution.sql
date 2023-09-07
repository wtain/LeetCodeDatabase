/*
    Runtime
    Details
    1123ms
    Beats 64.47%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select
        month,
        country,
        count(*) as trans_count,
        sum(is_approved) as approved_count,
        sum(amount) as trans_total_amount,
        sum(is_approved*amount) as approved_total_amount
from (
    select t.*,
           case
             when state='approved' then 1
             else 0
           end as is_approved,
           concat(year(trans_date), '-', LPAD(month(trans_date), 2, '00')) as month
    from Transactions t
) subqeuery
group by month, country;