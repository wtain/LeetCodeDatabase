-- https://leetcode.com/problems/patients-with-a-condition/discuss/1886449/MySQL-new-solution!
-- Runtime: 491 ms, faster than 12.63% of MySQL online submissions for Patients With a Condition.
-- Memory Usage: 0B, less than 100.00% of MySQL online submissions for Patients With a Condition.
select patient_id, patient_name, conditions
from Patients
WHERE LOCATE(" DIAB1", conditions) > 0 OR conditions LIKE "DIAB1%"; 