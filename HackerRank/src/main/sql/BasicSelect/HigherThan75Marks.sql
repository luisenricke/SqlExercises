SELECT NAME FROM STUDENTS
    WHERE Marks > 75
    ORDER BY MID(NAME, CHAR_LENGTH(NAME) - 2, 3) ASC, ID ASC
