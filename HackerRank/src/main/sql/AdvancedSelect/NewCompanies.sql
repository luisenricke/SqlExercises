/*
-- Drop C from String
SELECT SUBSTRING(company_code,2,LENGTH(company_code)) AS num FROM Company
ORDER BY CONVERT(num, SIGNED)
*/

-- Query to solve problem
SELECT
    A.company_code,
--    B.num,
    A.founder,
    (SELECT COUNT(*) FROM Lead_Manager
        WHERE company_code = A.company_code) AS LEAD,
    (SELECT COUNT(*) FROM Senior_Manager
        WHERE company_code = A.company_code) AS SENIOR_MANAGER,
    (SELECT COUNT(*) FROM Manager
        WHERE company_code = A.company_code) AS MANAGER,
    (SELECT COUNT(*) FROM Employee
        WHERE company_code = A.company_code) AS EMPLOYEE
FROM Company AS A
INNER JOIN
    (
        SELECT
            company_code,
            CONVERT(SUBSTRING(company_code,2,LENGTH(company_code)), SIGNED) AS num
        FROM Company
    ) AS B
    ON A.company_code = B.company_code
-- INNER JOIN Lead_Manager AS C
--    ON A.company_code = C.company_code
-- GROUP BY A.founder
 ORDER BY B.num

-- Proposition
SELECT
    A.company_code,
--    B.num,
    A.founder,
    (SELECT COUNT(DISTINCT lead_manager_code) FROM Lead_Manager
        WHERE company_code = A.company_code) AS LEAD,
    (SELECT COUNT(DISTINCT senior_manager_code) FROM Senior_Manager
        WHERE company_code = A.company_code) AS SENIOR_MANAGER,
    (SELECT COUNT(DISTINCT manager_code) FROM Manager
        WHERE company_code = A.company_code) AS MANAGER,
    (SELECT COUNT(DISTINCT employee_code) FROM Employee
        WHERE company_code = A.company_code) AS EMPLOYEE
FROM Company AS A
INNER JOIN
    (
        SELECT
            company_code,
            CONVERT(SUBSTRING(company_code, 2, LENGTH(company_code)), SIGNED) AS num
        FROM Company
    ) AS B
    ON A.company_code = B.company_code

ORDER BY B.num
-- ORDER BY A.company_code
