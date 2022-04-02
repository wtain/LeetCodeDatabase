-- Runtime: 581 ms, faster than 33.94% of MySQL online submissions for Recyclable and Low Fat Products.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Recyclable and Low Fat Products.
select product_id
from Products 
where low_fats='Y' and recyclable='Y';