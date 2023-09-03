/*
    Runtime
    Details
    600ms
    Beats 21.36%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
select activity_start.machine_id,
       round(avg(activity_end.end-activity_start.start), 3) as processing_time
from
    (select machine_id, process_id, timestamp as start
    from Activity
    where activity_type='start') activity_start,
    (select machine_id, process_id, timestamp as end
        from Activity
        where activity_type='end') activity_end
where activity_start.machine_id=activity_end.machine_id
and activity_start.process_id=activity_end.process_id
group by activity_start.machine_id;