-- Runtime
-- 2338
-- ms
-- Beats
-- 13.57%
select person_name
from Queue q
join
(
    select max(subquery.turn) as turn
    from (
        select
        q2.turn,
        q2.person_name,
        sum(q1.weight)
        from Queue q1
        join
             Queue q2
        on q1.turn <= q2.turn
        group by q2.turn
        having sum(q1.weight) <= 1000
    ) subquery
) subq2
on subq2.turn=q.turn;
