-- BIL344 Database Systems
-- Demonstrating Stored Procedures in Oracle SQL
-- Assoc. Prof. Mustafa SERT | msert@baskent.edu.tr

STORED PROCEDURES
----------------------------------------------------------------------------
P.S. It is not allowed to use DECLARE statement in procedure and functions

A. Using IN arguments
-- This example takes two arguments as the emp id and salary
-- And changes it correspondingly

CREATE OR REPLACE PROCEDURE change_salary1(no IN NUMBER, sl IN NUMBER)
IS
BEGIN
  UPDATE EMP
  SET SAL = sl
  WHERE EMPNO = no;
END;


-- Running SP
BEGIN
  change_salary1(7902, 4500);
END;


B. Using OUT arguments
-- This example takes two arguments as the emp id and salary
-- And changes it correspondingly. Returns the operation result

CREATE OR REPLACE PROCEDURE change_salary2(no IN NUMBER, sl IN NUMBER, done OUT BOOLEAN)
IS
  temp NUMBER;
BEGIN
  UPDATE EMP  SET SAL = sl WHERE EMPNO = no; 

  SELECT sal INTO temp FROM emp WHERE empno = no; 
    
  IF temp = sl THEN
    done := TRUE;
  ELSE
    done := FALSE;
  END IF;
END;


-- Running SP
DECLARE 
  res BOOLEAN := FALSE;
BEGIN
  change_salary2(7902, 10200, res);
  IF res  THEN   -- DBMS_OUTPUT.PUT_LINE is NOT overloaded for boolean types
    DBMS_OUTPUT.PUT_LINE('TRUE');
  ELSE 
    DBMS_OUTPUT.PUT_LINE('FALSE');
  END IF;
END;


FUNCTIONS
----------------------------------------------------------------------------

A. Creating Functions

CREATE OR REPLACE FUNCTION isEven(num NUMBER) return BOOLEAN
IS 
BEGIN
  IF (num MOD 2) = 0 THEN
    return TRUE;
  ELSE
    return FALSE;
  END IF;
END;

-- Running Functions
DECLARE
  result BOOLEAN := FALSE;
BEGIN
  result := isEven(20);
  IF result  THEN   -- DBMS_OUTPUT.PUT_LINE is NOT overloaded for boolean types
    DBMS_OUTPUT.PUT_LINE('TRUE');
  ELSE 
    DBMS_OUTPUT.PUT_LINE('FALSE');
  END IF;
END;


B. Using LOOP Structures in Functions
-- sum from 1 to N

Using FOR command:

CREATE OR REPLACE FUNCTION mySum(n NUMBER) return NUMBER
IS 
  i NUMBER;
  total NUMBER:= 0;
BEGIN
  FOR i IN 1 .. n LOOP
    total := total + i;
  END LOOP;
  RETURN total;
END;

Using LOOP command:

CREATE OR REPLACE FUNCTION mySum(n NUMBER) return NUMBER
IS 
  i NUMBER := 1;
  total NUMBER := 0;
BEGIN
  LOOP
    total := total + i;
    i := i + 1;
    EXIT WHEN i > n;
  END LOOP;
  RETURN total;
END;

-- Running 
  -- Method 1:
  select mySum(5) from dual; -- dual is a special table in Oracle with one column and row.
                             -- It's used to conform the notation of SELECT .. FROM statement.

  -- Method 2:
  --BEGIN
  --  DBMS_OUTPUT.PUT_LINE('Total is: ' || mySum(5));
  --END;

