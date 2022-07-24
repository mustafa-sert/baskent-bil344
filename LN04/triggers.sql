-- BIL344 Database Systems
-- Demonstrating triggers in Oracle SQL
-- Assoc. Prof. Mustafa SERT | msert@baskent.edu.tr

CREATING TRIGGERS
-----------------------------------------------------
create table DEPT_LOG(
log_date DATE,
action VARCHAR2(50)
);


Statement Level Triggers
-----------------------------------------------------
CREATE OR REPLACE TRIGGER WRITE_LOG
AFTER INSERT OR UPDATE OR DELETE
ON DEPT
DECLARE
log_action DEPT_LOG.action%TYPE;
BEGIN
  IF INSERTING THEN
    log_action := 'Insert';
  ELSIF UPDATING THEN
    log_action := 'Update';
  ELSIF DELETING THEN 
    log_action := 'Delete';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is unreachable');
  END IF;
  INSERT INTO DEPT_LOG(log_date, action)
    VALUES(SYSDATE, log_action);
END;

UPDATE DEPT
SET DNAME ='MAK', LOC='ANKARA'
WHERE DEPTNO=35;

Row Level Triggers
-----------------------------------------------------

CREATE SEQUENCE gen_PK_seq
minvalue 51
maxvalue 98
start with 51
increment by 1
cache 20;

CREATE OR REPLACE TRIGGER DEPT_PK_TRIG
BEFORE INSERT ON DEPT
FOR EACH ROW
BEGIN
   :NEW.DEPTNO := GEN_PK_SEQ.nextval;
END;

insert into dept(dname, loc)
values('MS', 'MS');

select * from dept;

ROW vs. STATEMENT LEVEL TRIGGERS
-----------------------------------------------------
-- This example demonstrates the difference btw two types of triggers
-----------------------------------------------------
create table emp2 as select * from emp;

-- This is a statement level trigger
create trigger trg_statement_emp2 before update on emp2
  begin
     dbms_output.put_line('Before Update Statement Trigger');
  end;

-- This is a row-level trigger
create trigger trg_statement_emp2_3 before update on emp2
  for each row
   begin
     dbms_output.put_line('Before Update Row Level Trigger');
   end;

-- See the result after executing the below statement:
update emp2 set sal = 10 where deptno = 10;
-----------------------------------------------------
