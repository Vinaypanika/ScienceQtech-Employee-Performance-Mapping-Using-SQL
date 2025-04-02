/* 1.	Create a database named employee, then import data_science_team.csv proj_table.csv 
and emp_record_table.csv into the employee database from the given resources */

create database employee;
use employee;

-- 2.	Create an ER diagram for the given employee database.

/* 3.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, 
and make a list of employees and details of their department. */

select  emp_id, first_name, last_name, gender, dept as Department
from emp_record_table;

/* 4.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
●	less than two
●	greater than four 
●	between two and four */

-- less than two
select emp_id, first_name, last_name, gender, dept as Department, Emp_rating
from emp_record_table
where emp_rating < 2;

-- greater than four
select emp_id, first_name, last_name, gender, dept as Department, Emp_rating
from emp_record_table
where emp_rating > 4;

-- between two and four
select emp_id, first_name, last_name, gender, dept as Department, Emp_rating
from emp_record_table
where emp_rating between 2 and 4;

/* 5.	Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees 
in the Finance department from the employee table 
and then give the resultant column alias as NAME. */

select concat(first_name, ' ', last_name) as full_name
from emp_record_table
where dept = "finance";

/* 6.	Write a query to list only those employees who have someone reporting to them. 
Also, show the number of reporters (including the President). */

select e.emp_id, concat(e.first_name,' ', e.last_name) as Emp_name,
e.gender, e.role, e.dept, count(m.emp_id) as number_of_reporters
from emp_record_table as e
join emp_record_table as m on m.manager_id = e.emp_id
group by e.emp_id, Emp_name,e.gender, e.role, e.dept
order by number_of_reporters desc;

/* 7.	Write a query to list down all the employees from the healthcare 
and finance departments using union. Take data from the employee record table. */

select * from emp_record_table where dept = "healthcare"
union all
select * from emp_record_table where dept = "finance";

/* 8.	Write a query to list down employee details such as EMP_ID, FIRST_NAME, 
LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. 
Also include the respective employee rating along with the max emp rating for the department. */

select emp_id, first_name, last_name, role, dept, Emp_rating, 
max(Emp_rating) over(partition by dept ) as Dept_max_emp_rating 
from emp_record_table
order by dept, emp_rating desc;

/* 9.	Write a query to calculate the minimum and 
the maximum salary of the employees in each role.
 Take data from the employee record table. */
 
select role, min(salary) as min_salary, max(salary) as max_salary
from emp_record_table
group by role;

/* 10.	Write a query to assign ranks to each employee based on their experience.
 Take data from the employee record table. */
 
 select emp_id, first_name, last_name , exp, 
 dense_rank() over(order by exp desc) as emp_rank
 from emp_record_table;
 

/* 11.	Write a query to create a view that displays employees in various countries whose salary is more than six thousand. 
Take data from the employee record table. */

create view Salary_greater_than_6000 as
select * from emp_record_table 
where salary > 6000;

select * from Salary_greater_than_6000;

/* 12.	Write a nested query to find employees with experience of more than ten years.
 Take data from the employee record table. */
 
select first_name, last_name, role, exp
from emp_record_table
where exp >= (select min(exp) from emp_record_table where exp >10);

/* 13.	Write a query to create a stored procedure to retrieve the details of the 
employees whose experience is more than three years. 
Take data from the employee record table. */

call employee.`Exp>3`();

/* 14.	Write a query using stored functions in the project table to check whether the job profile 
assigned to each employee in the data science team matches the organization’s set standard.

The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'. */

call employee.job_profile();


/* 15.	Create an index to improve the cost and performance of the 
query to find the employee whose FIRST_NAME is ‘Eric’ in the employee 
table after checking the execution plan. */


create Index idx_first_name
on emp_record_table (first_name(255));

-- Query to find first_name is Eric
select * from emp_record_table
where first_name = "Eric";

-- Checking Execution Plan:
explain select * from emp_record_table where first_name = "Eric";

/* 16.	Write a query to calculate the bonus for all the employees, based on their ratings 
and salaries (Use the formula: 5% of salary * employee rating). */

select emp_id, first_name, last_name, role, salary, emp_rating,
(0.05*salary*emp_rating) as Bonus from emp_record_table;

/* 17.	Write a query to calculate the average salary distribution based on the continent and country. 
Take data from the employee record table. */

select continent, country , avg(salary) as Avg_salary
from emp_record_table
group by continent, country;

