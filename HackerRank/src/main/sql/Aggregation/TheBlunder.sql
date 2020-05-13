SET @ZEROS := (SELECT AVG(Salary) FROM EMPLOYEES);
SET @NOZEROS := (SELECT AVG(REPLACE(Salary, '0', '')) FROM EMPLOYEES);

SELECT CEILING(@ZEROS - @NOZEROS) AS RESULT;
