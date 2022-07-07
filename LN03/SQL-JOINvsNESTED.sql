/*
 * Author: Assoc. Prof. Mustafa Sert | msert@baskent.edu.tr 
 * Purpose: Demonstrates basic SQL-DDL and SQL-DML commands.
 */

-- Join vs Nested Query. op ALL, op ANY
 
-- WITH JOIN
SELECT S.SNAME
FROM SAILORS S, RESERVES R
WHERE R.BID=101 AND S.SID = R.SID

-- LETS SOLVE THIS USING NESTED QUERY

SELECT S.SNAME
FROM SAILORS S
WHERE S.SID NOT IN ( SELECT R.SID
                FROM RESERVES R
                WHERE R.BID=101 )

-- op ALL, op ANY  --> op:operators such as =, <, >, <= ..
SELECT *
FROM SAILORS
WHERE AGE >= ALL ( SELECT AGE FROM SAILORS )

SELECT *
FROM SAILORS
WHERE RATING > ANY (SELECT RATING FROM SAILORS WHERE SNAME='Sinem')
