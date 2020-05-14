SELECT First.X, First.Y FROM Functions AS First
    WHERE First.X = First.Y AND
        (
            SELECT COUNT(*) FROM Functions AS Second
            WHERE Second.X = First.X AND Second.Y = First.X
        ) > 1
UNION
SELECT First.X, First.Y FROM Functions AS First
    WHERE EXISTS
        (
            SELECT Second.X, Second.Y FROM Functions AS Second
            WHERE First.X = Second.Y AND First.Y = Second.X AND First.X < Second.X
        )
ORDER BY X;
