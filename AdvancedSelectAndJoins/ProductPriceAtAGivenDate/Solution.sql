# Runtime
# 1690
# ms
# Beats
# 7.02%
--select product_id,
--       10 as price
--from Products
--group by product_id
--having min(change_date) > '2019-08-16'
--union all
--select
--    product_id,
--    new_price as price
--from Products
--where
--    (product_id, change_date) in (
--        select product_id, max(change_date)
--        from Products
--        where change_date <= '2019-08-16'
--        group by product_id
--    );


# 899
# ms
# Beats
# 24.80%
--select UniqueProductId.product_id,
--    ifnull(LastChangedPrice.new_price, 10) as price
--from (
--    select distinct product_id
--    from Products) as UniqueProductId
--left join (
--    select Products.product_id,
--        new_price
--    from Products
--        join (
--            select
--                product_id,
--                max(change_date) as change_date
--            from
--                Products
--            where
--                change_date <= '2019-08-16'
--            group by
--                product_id
--        ) as LastChangedDate
--        using (product_id, change_date)
--        group by product_id
--) as LastChangedPrice
--using (product_id);


# Runtime
# 743
# ms
# Beats
# 36.66%
select
    product_id,
    ifnull(price, 10) as price
from
    (
        select distinct product_id
        from Products
    ) as UniqueProducts
left join (
    select distinct
        product_id,
        first_value(new_price) over (
            partition by product_id
            order by change_date desc
        ) as price
    from Products
    where change_date <= '2019-08-16'
) as LastChangedPrice using (product_id);