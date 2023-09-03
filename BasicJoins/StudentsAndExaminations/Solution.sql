--select student_id, student_name, subject_name, sum(attended_exams) as attended_exams
--from (
--    select student_id, student_name, subject_name, attended_exams
--    from
--    (
--        select s.student_id, student_name, subject_name,
--        case
--            when e. is not null then 1
--            else 0
--        end as attended_exams
--        from Students s
--             left join Examinations e
--                on s.student_id=e.student_id
--    ) subquery_students
--    union all
--    (
--        select student_id, student_name, subject_name, attended_exams
--        from Subjects su
--        left join Examinations e
--                    on su.subject_name=e.subject_name
--    ) subquery_subjects
--) subquery
--group by student_id, student_name, subject_name
--order by student_id, subject_name;


/*
    Runtime
    Details
    1931ms
    Beats 66.50%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
-- https://leetcode.com/problems/students-and-examinations/solutions/3511410/mysql-three-solutions/
--select
--    s.student_id,
--    s.student_name,
--    sub.subject_name,
--    count(e.student_id) as attended_exams
--from Students s
--cross join Subjects sub
--left join Examinations e on s.student_id=e.student_id and sub.subject_name=e.subject_name
--group by s.student_id, s.student_name, sub.subject_name
--order by s.student_id, sub.subject_name;


/*
    Runtime
    Details
    1961ms
    Beats 62.74%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
-- https://leetcode.com/problems/students-and-examinations/solutions/3511410/mysql-three-solutions/
--select
--    s.student_id,
--    s.student_name,
--    sub.subject_name,
--    coalesce(e.attended_exams, 0 ) as attended_exams
--from Students s
--cross join Subjects sub
--left join
--(
--    select student_id,
--           subject_name,
--           count(*) as attended_exams
--    from Examinations
--    group by student_id, subject_name
--) e
--on s.student_id=e.student_id and sub.subject_name=e.subject_name
--group by s.student_id, s.student_name, sub.subject_name
--order by s.student_id, sub.subject_name;

/*
    Runtime
    Details
    1828ms
    Beats 78.87%of users with MySQL
    Memory
    Details
    0.00MB
    Beats 100.00%of users with MySQL
*/
-- https://leetcode.com/problems/students-and-examinations/solutions/3511410/mysql-three-solutions/
select
    s.student_id,
    s.student_name,
    sub.subject_name,
    coalesce(e.attended_exams, 0 ) as attended_exams
from Students s
cross join Subjects sub
left join
(
    select student_id,
           subject_name,
           count(*) as attended_exams
    from Examinations
    group by student_id, subject_name
) e USING (student_id, subject_name)
order by s.student_id, sub.subject_name;