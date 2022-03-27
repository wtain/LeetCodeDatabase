-- Runtime: 440 ms, faster than 34.91% of MySQL online submissions for Actors and Directors Who Cooperated At Least Three Times.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Actors and Directors Who Cooperated At Least Three Times.
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(*) >= 3;