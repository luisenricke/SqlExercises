--
--SELECT MIN(LAT_N) FROM STATION;
--SELECT MAX(LAT_N) FROM STATION;
--
--SELECT ABS(
--    (SELECT MIN(LAT_N) FROM STATION) -
--    (SELECT MAX(LAT_N) FROM STATION)
--) AS LAT;
--
--
--SELECT MIN(LONG_W) FROM STATION;
--SELECT MAX(LONG_W) FROM STATION;
--
--SELECT ABS(
--    (SELECT MIN(LONG_W) FROM STATION) -
--    (SELECT MAX(LONG_W) FROM STATION)
--) AS LONG_;

SELECT TRUNCATE(
    (
        ABS(
            (SELECT MIN(LAT_N) FROM STATION) -
            (SELECT MAX(LAT_N) FROM STATION)
        ) +
        ABS(
            (SELECT MIN(LONG_W) FROM STATION) -
            (SELECT MAX(LONG_W) FROM STATION)
        )
    ) , 4
) AS RESULT;
