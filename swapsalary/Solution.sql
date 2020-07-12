# Write your MySQL query statement below
update salary
set sex = char(ord('f') + ord('m') - ord(sex));