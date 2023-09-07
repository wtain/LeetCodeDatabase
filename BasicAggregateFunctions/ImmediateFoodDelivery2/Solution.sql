/*
    Runtime
    Details
    1330ms
    Beats 61.92%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select
    round(100 * sum(is_immediate) / count(*), 2) as immediate_percentage
    from (
        select
            case
                when d.order_date=customer_pref_delivery_date then 1
                else 0
            end as is_immediate
        from Delivery d,
             (
                select customer_id,
                    min(order_date) as first_order_date
                from Delivery
                group by customer_id
             ) first_order
        where d.order_date=first_order.first_order_date
        and d.customer_id=first_order.customer_id
    ) subquery;