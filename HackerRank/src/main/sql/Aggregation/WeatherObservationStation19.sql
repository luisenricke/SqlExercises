SELECT TRUNCATE(
    SQRT(
        POW(
            (
                (SELECT MIN(LAT_N) FROM STATION) -
                (SELECT MAX(LAT_N) FROM STATION)
            ), 2
        ) +
        POW(
            (
                (SELECT MIN(LONG_W) FROM STATION) -
                (SELECT MAX(LONG_W) FROM STATION)
            ), 2
        )
    ) , 4
) AS RESULT;
