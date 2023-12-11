/*
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query 
to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge.
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Input Format

    The following tables contain contest data:

        Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

            +-------------+--------------+
            | Column      | Type         |
            +-------------+--------------+
            | hacker_id   | Integer      |
            | name        | String       |
            +-------------+--------------+
        
        Difficulty: The difficult_level is the level of difficulty of the challenge, and score 
        is the score of the challenge for the difficulty level.

            +--------------------+--------------------+
            | Column             | Type               |
            +--------------------+--------------------+
            | difficulty_level   | Integer            |
            | score              | Integer            |
            +--------------------+--------------------+

        Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who 
        created the challenge, and difficulty_level is the level of difficulty of the challenge.

            +--------------------+--------------------+
            | Column             | Type               |
            +--------------------+--------------------+
            | challenge_id       | Integer            |
            | hacker_id          | Integer            |
            | difficulty_level   | Integer            |
            +--------------------+--------------------+

        Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker 
        who made the submission, challenge_id is the id of the challenge that the submission belongs to,
        and score is the score of the submission.

            +--------------------+--------------------+
            | Column             | Type               |
            +--------------------+--------------------+
            | submission_id      | Integer            |
            | challenge_id       | Integer            |
            | hacker_id          | Integer            |
            | difficulty_level   | Integer            |
            +--------------------+--------------------+
*/


SELECT S.hacker_id, H.name
FROM Submissions AS S
INNER JOIN Hackers AS H ON H.hacker_id = S.hacker_id
INNER JOIN Challenges AS C ON C.challenge_id = S.challenge_id
INNER JOIN Difficulty AS D ON D.difficulty_level = C.difficulty_level
WHERE S.score = D.score
GROUP BY S.hacker_id, H.name
HAVING COUNT(S.hacker_id) > 1
ORDER BY COUNT(S.hacker_id) DESC, S.hacker_id ASC

/*
Breakdown:
    SELECT:
        Simply selecting 2 rows, that we will need: Hacker's ID and Hacker's name
    FROM:
        Using Submissions table as the main source
    JOIN:
        Adding 3 other tables to the submissins (LEFT JOIN WORKS AS WELL), to create a huge table with all the data we will later need
            
            Hackers:
                Pulling this table into Submissions by hacker_id
            Challenges:
                Pulling this table into Submissions by challenge_id
            Difficulty:
                Pulling this table into Challenges by difficulty_level
            
            *This will simply create a big table with several column repeating, as we pull seevral other tables into Submissions.
    WHERE:
        Some submissions have not achived the top score, but the top is what we need :p. So, having this table, made with JOIN, we are going
        to secet only thise rows, where score in column 'score' from Submissions is equal to the same column (score) in Difficulty table,
        as Difficulty table have onyl the top score for each level.
    GROUP BY:
        At this moment, as we are using Submissions as a data-source, we will have several records of the same hackers, which have made
        more than 1 submission. We don't want that, as we only need one record for each Hacker, so we are grouping them by these 2 columns.
    HAVING:
        At this point we have selected all Hackers, managed to reach top score, but we only want those, who made it at least twice. So
        we do that in HAVING-clause, by indicating that hacker_id in Submission should be mentioned more than once.
    ORDER BY:
        Last thing to do is to sort it all. We want this table to have hackers with the higest submissions to be on top, and if
        several hackers have the same submissions number - sort them in an ascending order.
*/
