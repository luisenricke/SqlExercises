/*
select * from Submissions
where hacker_id = '68141'
*/
/*
SELECT hacker_id as hacker, COUNT(challenge_id) as challenge, SUM(score) as score from Submissions
GROUP BY hacker_id
ORDER BY score desc, challenge desc, hacker
*/

SELECT
    A.hacker_id as id,
    B.name as name
--    A.score as score,
--    D.score AS level_
--    COUNT(A.challenge_id) as challenge,
--    SUM(A.score) as score
FROM Submissions AS A
INNER JOIN Hackers AS B
    ON A.hacker_id = B.hacker_id
INNER JOIN Challenges AS C
    ON A.challenge_id = C.challenge_id
INNER JOIN Difficulty AS D
    ON C.difficulty_level = D.difficulty_level
WHERE A.score = D.score AND C.difficulty_level = D.difficulty_level
GROUP BY A.hacker_id, B.name
HAVING COUNT(A.HACKER_ID) > 1
ORDER BY COUNT(A.hacker_id) DESC, A.hacker_id ASC
