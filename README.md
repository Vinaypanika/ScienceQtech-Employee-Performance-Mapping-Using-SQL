# ScienceQtech-Employee-Performance-Mapping-Using-SQL
### Project Description
Generated reports on employee details, their performance, and on the project that the employees have undertaken, to analyze the employee database and extract specific data based on different requirements.
### Tasks performed
Created a database named employee, then inserted values from data_science_team.csv proj_table.csv and emp_record_table.csv into the employee database from the given resources.

Created an ER diagram for the given employee database.

Wrote a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and made a list of employees and details of their department.

Wrote a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING was: * less than two * greater than four * between two and four

Wrote a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then gave the resultant column alias as NAME.

Wrote a query to list only those employees who have someone reporting to them. Also, showed the number of reporters (including the President).

Wrote a query to list down all the employees from the healthcare and finance departments using union.

Wrote a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also included the respective employee rating along with the max emp rating for the department.

Wrote a query to calculate the minimum and the maximum salary of the employees in each role.

Wrote a query to assign ranks to each employee based on their experience.

Wrote a query to create a view that displays employees in various countries whose salary is more than six thousand.

Wrote a nested query to find employees with experience of more than ten years.

Wrote a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years.

Wrote a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard:

The standard being:

For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST'
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST'
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST'
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST'
For an employee with the experience of 12 to 16 years assign 'MANAGER'
Created an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.

Wrote a query to calculate the bonus for all the employees, based on their ratings and salaries (Using the formula: 5% of salary * employee rating).

Wrote a query to calculate the average salary distribution based on the continent and country.
