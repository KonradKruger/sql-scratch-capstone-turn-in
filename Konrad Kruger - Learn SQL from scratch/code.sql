SELECT *
 FROM survey
 LIMIT 10;

SELECT question, 
 COUNT(DISTINCT user_id) as ‘Total’
 FROM survey
 GROUP BY question;

SELECT *
 FROM quiz
 LIMIT 5;

SELECT *
 FROM home_try_on
 LIMIT 5;

SELECT *
 FROM purchase
 LIMIT 5;

SELECT
   DISTINCT quiz.user_id as 'User',
     CASE
       WHEN home_try_on.user_id IS NOT NULL THEN 'True'
       ELSE 'False'
     END  as 'is_home_try_on',
     CASE
       WHEN home_try_on.number_of_pairs = '3 pairs' THEN '3'
       WHEN home_try_on.number_of_pairs = '5 pairs' THEN '5' 
       ELSE 'NULL'
     END  as 'number_of_pairs',
     CASE
       WHEN purchase.user_id IS NOT NULL THEN 'True'
       ELSE 'False'
     END  as 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
   ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
   ON purchase.user_id = quiz.user_id
LIMIT 10;

SELECT
     count(DISTINCT quiz.user_id) 
   FROM quiz
   LEFT JOIN home_try_on
     ON quiz.user_id = home_try_on.user_id
   LEFT JOIN purchase
     ON purchase.user_id = quiz.user_id
   WHERE purchase.user_id is not null
   AND number_of_pairs = '3 pairs'; 

SELECT
     count(DISTINCT quiz.user_id)
   FROM quiz
   LEFT JOIN home_try_on
     ON quiz.user_id = home_try_on.user_id
   LEFT JOIN purchase
     ON purchase.user_id = quiz.user_id
   WHERE purchase.user_id is not null
   AND number_of_pairs = '5 pairs'; 

SELECT
     count(DISTINCT quiz.user_id)
   FROM quiz
   LEFT JOIN home_try_on
     ON quiz.user_id = home_try_on.user_id
   LEFT JOIN purchase
     ON purchase.user_id = quiz.user_id
   WHERE home_try_on.user_id is not null
   AND purchase.user_id is not NULL;

SELECT
     count(DISTINCT quiz.user_id)
   FROM quiz;






