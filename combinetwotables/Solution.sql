# Write your MySQL query statement below


select 
p.FirstName, p.LastName, a.City, a.State
from
Person p
left outer join
Address a
On
p.PersonId = a.PersonId