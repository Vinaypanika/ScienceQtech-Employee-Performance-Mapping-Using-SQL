create database employee;
use employee;
show tables;

show full tables where table_type = "BASE TABLE";

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT FROM employee.emp_record_table 
ORDER BY DEPT;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING FROM employee.emp_record_table WHERE EMP_RATING <2;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING FROM employee.emp_record_table WHERE EMP_RATING <2;


SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING FROM employee.emp_record_table WHERE EMP_RATING <2;


SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING FROM employee.emp_record_table WHERE EMP_RATING <2;


select count(EMP_ID) as REPORTERS from emp_record_table
where MANAGER_ID is not null
GROUP BY MANAGER_ID
order by MANAGER_ID;


SELECT * FROM employee.emp_record_table  WHERE DEPT = 'FINANCE'
UNION 
SELECT * FROM employee.emp_record_table  WHERE DEPT = 'HEALTHCARE'
ORDER BY DEPT, EMP_ID;


SELECT ROLE, MIN(SALARY) as MIN_SAL_OF_ROLE, MAX(SALARY) as MAX_SAL_OF_ROLE FROM employee.emp_record_table 
GROUP BY ROLE;

CREATE or REPLACE VIEW EMP_COUNTRY_VIEW AS 
SELECT EMP_ID, FIRST_NAME, LAST_NAME,COUNTRY,SALARY
FROM employee.emp_record_table
WHERE SALARY>6000
order by COUNTRY, EMP_ID;
select * from EMP_COUNTRY_VIEW;




select EMP_ID, FIRST_NAME, LAST_NAME,exp
from(
	select * from emp_record_table
    WHERE EXP > 10
    order by exp
) as EXP_GREATER_THAN_10;


CREATE PROCEDURE EMP_DETAILS()
BEGIN
	SELECT * FROM employee.emp_record_table WHERE EXP>3 order by EXP;
DELIMITER //
CREATE PROCEDURE EMP_DETAILS()
BEGIN
	SELECT * FROM employee.emp_record_table WHERE EXP>3 order by EXP;
END //
DELIMITER //;





CALL EMP_DETAILS();


delimiter //
CREATE FUNCTION check_role(exp int)
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
	DECLARE chck VARCHAR(40);
    IF EXP <= 2 THEN
		SET chck = "JUNIOR DATA SCIENTIST";
	elseif exp > 2 AND exp <= 5 THEN
		SET chck = "ASSOCIATE DATA SCIENTIST";
	elseif exp > 5 AND exp <= 10 THEN
		SET chck = "SENIOR DATA SCIENTIST";
	elseif exp > 10 AND exp <= 12 THEN
		SET chck = "LEAD DATA SCIENTIST";
	elseif exp > 12 AND exp <= 16 THEN
		SET chck = "MANAGER";
	end if;
    RETURN(chck);
END //
delimiter ;



select  EMP_ID, FIRST_NAME, LAST_NAME, ROLE, check_role(exp)
from data_science_team WHERE ROLE != check_role(exp);


explain select * from employee.emp_record_table where FIRST_NAME = "Eric";
create index F_index on employee.emp_record_table(FIRST_NAME(10));
show indexes from employee.emp_record_table;

explain select * from employee.emp_record_table where FIRST_NAME = "Eric";
create index F_index on employee.emp_record_table(FIRST_NAME(10));
show indexes from employee.emp_record_table;

select CONTINENT, avg(SALARY) from emp_record_table
group by CONTINENT
order by CONTINENT;