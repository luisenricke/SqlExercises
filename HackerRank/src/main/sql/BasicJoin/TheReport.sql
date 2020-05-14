-- Slowest query
SELECT
    (
        SELECT IF(A.Marks >= 70, A.Name, NULL)
        FROM Grades AS B
        WHERE A.Marks BETWEEN B.Min_Mark AND B.Max_Mark
    ) as X,
    (
        SELECT B.Grade
        FROM Grades AS B
        WHERE A.Marks BETWEEN B.Min_Mark AND B.Max_Mark
    ) as Y,

    Marks as Z
FROM Students AS A
ORDER BY Y DESC, X, Z


-- Fastest query
SELECT
    IF(B.Grade<8, NULL, A.Name),
    B.Grade,
    A.Marks
FROM Students AS A
JOIN Grades AS B
ON A.Marks
BETWEEN B.Min_Mark AND B.Max_Mark
ORDER BY B.Grade DESC, A.Name, A.Marks;
