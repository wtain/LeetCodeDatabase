-- Runtime: 792 ms, faster than 43.90% of MySQL online submissions for Top Travellers.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Top Travellers.
select u.name, coalesce(sum(r.distance), 0) as travelled_distance
from users u
	 left join
	 rides r
	 on u.id=r.user_id
group by u.id
order by sum(r.distance) desc, u.name;