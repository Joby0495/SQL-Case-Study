-- Simple Queries
-- 1. List all the employee details.
SELECT * FROM EMPLOYEE;

-- 2. List all the department details.
SELECT * FROM DEPARTMENT;

-- 3. List all job details.
SELECT * FROM JOB;

-- 4. List all the locations.
SELECT * FROM LOCATION;

-- 5. List out the First Name, Last Name, Salary, Commission for all Employees.
SELECT FIRST_NAME, LAST_NAME, SALARY, COMM FROM EMPLOYEE;

-- 6. List out the Employee ID, Last Name, Department ID for all employees and alias as specified.
SELECT EMPLOYEE_ID AS "ID of the Employee", LAST_NAME AS "Name of the Employee", DEPARTMENT_ID AS "Dep_id" 
FROM EMPLOYEE;

-- 7. List out the annual salary of the employees with their names only.
SELECT FIRST_NAME, LAST_NAME, SALARY * 12 AS "Annual Salary" FROM EMPLOYEE;

-- WHERE Condition
-- 1. List the details about "Smith".
SELECT * FROM EMPLOYEE WHERE LAST_NAME = 'SMITH';

-- 2. List out the employees who are working in department 20.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 20;

-- 3. List out the employees who are earning salary between 2000 and 3000.
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 2000 AND 3000;

-- 4. List out the employees who are working in department 10 or 20.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID IN (10, 20);

-- 5. Find out the employees who are not working in department 10 or 30.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID NOT IN (10, 30);

-- 6. List out the employees whose name starts with 'L'.
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'L%';

-- 7. List out the employees whose name starts with 'L' and ends with 'E'.
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'L%E';

-- 8. List out the employees whose name length is 4 and starts with 'J'.
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'J%' AND LENGTH(LAST_NAME) = 4;

-- 9. List out the employees who are working in department 30 and draw salaries more than 2500.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 30 AND SALARY > 2500;

-- 10. List out the employees who are not receiving commission.
SELECT * FROM EMPLOYEE WHERE COMM IS NULL OR COMM = 0;

-- ORDER BY Clause
-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEE ORDER BY EMPLOYEE_ID ASC;

-- 2. List out the Employee ID and Name in descending order based on salary.
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEE ORDER BY SALARY DESC;

-- 3. List out the employee details according to their Last Name in ascending order.
SELECT * FROM EMPLOYEE ORDER BY LAST_NAME ASC;

-- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
SELECT * FROM EMPLOYEE ORDER BY LAST_NAME ASC, DEPARTMENT_ID DESC;

-- GROUP BY and HAVING Clause
-- 1. List out the department-wise maximum salary, minimum salary, and average salary of the employees.
SELECT DEPARTMENT_ID, MAX(SALARY) AS Max_Salary, MIN(SALARY) AS Min_Salary, AVG(SALARY) AS Avg_Salary
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID;

-- 2. List out the job-wise maximum salary, minimum salary, and average salary of the employees.
SELECT JOB_ID, MAX(SALARY) AS Max_Salary, MIN(SALARY) AS Min_Salary, AVG(SALARY) AS Avg_Salary
FROM EMPLOYEE
GROUP BY JOB_ID;

-- 3. List out the number of employees who joined each month in ascending order.
SELECT MONTH(HIRE_DATE) AS Month, COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE)
ORDER BY Month ASC;

-- 4. List out the number of employees for each month and year in ascending order based on the year and month.
SELECT YEAR(HIRE_DATE) AS Year, MONTH(HIRE_DATE) AS Month, COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
ORDER BY Year ASC, Month ASC;

-- 5. List out the Department ID having at least four employees.
SELECT DEPARTMENT_ID
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 4;

-- 6. How many employees joined in February month.
SELECT COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) = 2;

-- 7. How many employees joined in May or June month.
SELECT COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) IN (5, 6);

-- 8. How many employees joined in 1985?
SELECT COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985;

-- 9. How many employees joined each month in 1985?
SELECT MONTH(HIRE_DATE) AS Month, COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985
GROUP BY MONTH(HIRE_DATE)
ORDER BY Month ASC;

-- 10. How many employees were joined in April 1985?
SELECT COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985 AND MONTH(HIRE_DATE) = 4;

-- 11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT DEPARTMENT_ID
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985 AND MONTH(HIRE_DATE) = 4
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 3;

-- Joins
-- 1. List out employees with their department names.
SELECT E.*, D.Name AS Department_Name
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPARTMENT_ID = D.Department_Id;

-- 2. Display employees with their designations.
SELECT E.*, J.Designation
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_ID = J.Job_ID;

-- 3. Display the employees with their department names and city.
SELECT E.*, D.Name AS Department_Name, L.City
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPARTMENT_ID = D.Department_Id
JOIN LOCATION L ON D.Location_Id = L.Location_ID;

-- 4. How many employees are working in different departments? Display with department names.
SELECT D.Name AS Department_Name, COUNT(E.EMPLOYEE_ID) AS Number_of_Employees
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON D.Department_Id = E.DEPARTMENT_ID
GROUP BY D.Name;

-- 5. How many employees are working in the sales department?
SELECT COUNT(*) AS Number_of_Employees
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPARTMENT_ID = D.Department_Id
WHERE D.Name = 'Sales';

-- 6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order.
SELECT D.Name AS Department_Name
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.Department_Id = E.DEPARTMENT_ID
GROUP BY D.Name
HAVING COUNT(E.EMPLOYEE_ID) >= 3
ORDER BY D.Name ASC;

-- 7. How many employees are working in 'Dallas'?
SELECT COUNT(*) AS Number_of_Employees
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPARTMENT_ID = D.Department_Id
JOIN LOCATION L ON D.Location_Id = L.Location_ID
WHERE L.City = 'Dallas';

-- 8. Display all employees in sales or operation departments.
SELECT E.*
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPARTMENT_ID = D.Department_Id
WHERE D.Name IN ('Sales', 'Operations');

-- Conditional Statement
-- 1. Display the employee details with salary grades.
SELECT E.*,
       CASE
           WHEN SALARY >= 3000 THEN 'A'
           WHEN SALARY >= 2000 THEN 'B'
           ELSE 'C'
       END AS Salary_Grade
FROM EMPLOYEE E;

-- 2. List out the number of employees grade-wise.
SELECT
    CASE
        WHEN SALARY >= 3000 THEN 'A'
        WHEN SALARY >= 2000 THEN 'B'
        ELSE 'C'
    END AS Salary_Grade,
    COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
GROUP BY CASE
    WHEN SALARY >= 3000 THEN 'A'
    WHEN SALARY >= 2000 THEN 'B'
    ELSE 'C'
END;

-- 3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
SELECT
    CASE
        WHEN SALARY >= 3000 THEN 'A'
        WHEN SALARY >= 2000 THEN 'B'
        ELSE 'C'
    END AS Salary_Grade,
    COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 5000
GROUP BY CASE
    WHEN SALARY >= 3000 THEN 'A'
    WHEN SALARY >= 2000 THEN 'B'
    ELSE 'C'
END;

-- Subqueries
-- 1. Display the employees list who got the maximum salary.
SELECT *
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

-- 2. Display the employees who are working in the sales department.
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales');

-- 3. Display the employees who are working as 'Clerk'.
SELECT *
FROM EMPLOYEE
WHERE JOB_ID = (SELECT Job_ID FROM JOB WHERE Designation = 'CLERK');

-- 4. Display the list of employees who are living in 'Boston'.
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (
    SELECT Department_Id
    FROM DEPARTMENT
    WHERE Location_Id = (SELECT Location_ID FROM LOCATION WHERE City = 'Boston')
);

-- 5. Find out the number of employees working in the sales department.
SELECT COUNT(*) AS Number_of_Employees
FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales');

-- 6. Update the salaries of employees who are working as clerks by 10%.
UPDATE EMPLOYEE
SET SALARY = SALARY * 1.10
WHERE JOB_ID = (SELECT Job_ID FROM JOB WHERE Designation = 'CLERK');

-- 7. Display the second highest salary drawing employee details.
SELECT *
FROM EMPLOYEE
WHERE SALARY = (
    SELECT MAX(SALARY)
    FROM EMPLOYEE
    WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE)
);

-- 8. List out the employees who earn more than every employee in department 30.
SELECT *
FROM EMPLOYEE
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = 30);

-- 9. Find out which department has no employees.
SELECT *
FROM DEPARTMENT
WHERE Department_Id NOT IN (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEE WHERE DEPARTMENT_ID IS NOT NULL);

-- 10. Find out the employees who earn greater than the average salary for their department.
SELECT *
FROM EMPLOYEE E
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM EMPLOYEE
    WHERE DEPARTMENT_ID = E.DEPARTMENT_ID
);
