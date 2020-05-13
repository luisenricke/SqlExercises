/*
SET @VALUE = 20;


SELECT REPEAT('* ', @VALUE)
FROM
(
    SELECT CASE
        WHEN @VALUE>=0 THEN @VALUE:=@VALUE-1
    END AS COUNTER
) AS X
*/
set @number = 21;
select repeat('* ', @number := @number - 1) from information_schema.tables;