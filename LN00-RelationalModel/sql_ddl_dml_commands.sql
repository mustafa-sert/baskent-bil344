/*
 * Author: Assoc. Prof. Mustafa Sert | msert@baskent.edu.tr 
 * Purpose: Demonstrates basic SQL-DDL and SQL-DML commands.
 */

-- SQL DDL commands
-- To create table
 
CREATE TABLE STUDENTS(
   SID NUMBER, 
   SNAME VARCHAR2(50),
   GPA NUMBER,
   CONSTRAINT STUDENT_PK PRIMARY KEY(SID)
)

CREATE TABLE COURSES(
   CID VARCHAR2(11),
   CNAME VARCHAR2(50),
   CREDIT NUMBER,
   PRIMARY KEY(CID)
)

CREATE TABLE ENROLLED(
   SID NUMBER,
   CID VARCHAR2(11),
   GRADE VARCHAR2(2),
   PRIMARY KEY(SID, CID)
)

-- To delete a table (also delete its data if any)
DROP TABLE ENROLLED

-- To describe table structure
DESC ENROLLED

-- To modify structure of existing table
-- To add a primary key constraint
ALTER TABLE ENROLLED 
ADD PRIMARY KEY(SID, CID, SEMESTER)                
-- To delete existing column/field/attribute
ALTER TABLE ENROLLED
DROP COLUMN GRADE
-- To add a new column
ALTER TABLE ENROLLED
ADD SEMESTER DATE
-- To modify existing column's type
ALTER TABLE ENROLLED
MODIFY CID VARCHAR2(25)

-- SQL DML commands
-- To insert a new record
INSERT INTO STUDENTS
VALUES(101, 'ALI', 2.70)

INSERT INTO STUDENTS(SID, SNAME)
VALUES(102, 'AYSE')

INSERT INTO STUDENTS(GPA, SID)
VALUES(3.5, 103)

INSERT INTO STUDENTS
VALUES(101, 'VELI', 3.20)

-- To query tables
SELECT * FROM USER_TABLES
SELECT * FROM USER_CONSTRAINTS
SELECT * FROM STUDENTS

-- To delete record
DELETE FROM STUDENTS -- deletes all records (not the table)
DELETE FROM STUDENTS WHERE GPA < 3.0
DELETE FROM STUDENTS WHERE SNAME = 'AYSE'
DELETE FROM STUDENTS WHERE SNAME IS NULL

-- To update existing records that satisfy given condition (where)
UPDATE STUDENTS
SET SNAME='ALI', SID=105
WHERE GPA=3.2
