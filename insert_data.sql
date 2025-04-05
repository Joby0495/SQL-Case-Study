-- Insert data into LOCATION table
INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');

-- Insert data into DEPARTMENT table
INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

-- Insert data into JOB table
INSERT INTO JOB (Job_ID, Designation)
VALUES (667, 'CLERK'),
       (668, 'STAFF'),
       (669, 'ANALYST'),
       (670, 'SALES_PERSON'),
       (671, 'MANAGER'),
       (672, 'PRESIDENT');

-- Insert data into EMPLOYEE table
INSERT INTO EMPLOYEE (EMPLOYEE_ID, LAST_NAME, FIRST_NAME, MIDDLE_NAME, JOB_ID, MANAGER_ID, HIRE_DATE, SALARY, COMM, DEPARTMENT_ID)
VALUES (7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '1984-12-17', 800, NULL, 20),
       (7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '1985-02-20', 1600, 300, 30),
       (7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '1985-04-04', 2850, NULL, 30),
       (7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '1985-05-15', 2750, NULL, 30),
       (7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '1985-06-10', 2200, NULL, 40),
       (7521, 'WARK', 'CYNTHIA', 'D', 670, 7698, '1985-02-22', 1250, 500, 30);
