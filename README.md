# SQL Case Study

A SQL project demonstrating database creation and various query types using a sample employee management database.

## Project Structure

- **`create_tables.sql`**: Creates the database schema with four tables: `LOCATION`, `DEPARTMENT`, `JOB`, and `EMPLOYEE`.
- **`insert_data.sql`**: Populates the tables with sample data.
- **`queries.sql`**: Contains categorized SQL queries (Simple, WHERE, ORDER BY, GROUP BY/HAVING, Joins, Conditional Statements, Subqueries).

## Database Schema

### LOCATION
| Column       | Type       | Description          |
|--------------|------------|----------------------|
| Location_ID  | INT (PK)   | Unique location ID   |
| City         | VARCHAR(50)| City name            |

### DEPARTMENT
| Column        | Type       | Description               |
|---------------|------------|---------------------------|
| Department_Id | INT (PK)   | Unique department ID      |
| Name          | VARCHAR(50)| Department name           |
| Location_Id   | INT (FK)   | References LOCATION       |

### JOB
| Column      | Type       | Description          |
|-------------|------------|----------------------|
| Job_ID      | INT (PK)   | Unique job ID        |
| Designation | VARCHAR(50)| Job title            |

### EMPLOYEE
| Column        | Type       | Description               |
|---------------|------------|---------------------------|
| EMPLOYEE_ID   | INT (PK)   | Unique employee ID        |
| LAST_NAME     | VARCHAR(20)| Employee last name        |
| FIRST_NAME    | VARCHAR(20)| Employee first name       |
| MIDDLE_NAME   | CHAR(1)    | Middle initial            |
| JOB_ID        | INT (FK)   | References JOB            |
| MANAGER_ID    | INT        | ID of the manager         |
| HIRE_DATE     | DATE       | Date of hire              |
| SALARY        | INT        | Monthly salary            |
| COMM          | INT        | Commission (nullable)     |
| DEPARTMENT_ID | INT (FK)   | References DEPARTMENT     |

## Setup Instructions

1. **Choose a Database System**: This project uses standard SQL syntax compatible with MySQL, PostgreSQL, SQLite, etc. Adjust date functions (`MONTH()`, `YEAR()`) if needed (e.g., `EXTRACT(MONTH FROM HIRE_DATE)` in PostgreSQL).
2. **Run Scripts**:
   - Execute `create_tables.sql` to create the tables.
   - Execute `insert_data.sql` to insert the sample data.
   - Run queries from `queries.sql` to explore the database.
3. **Tools**: Use a SQL client like MySQL Workbench, pgAdmin, DBeaver, or SQLite browser.

## Usage

- Open `queries.sql` to view and execute queries by category.
- Modify the data in `insert_data.sql` to test different scenarios.

## Notes

- The dataset is small (6 employees), so some queries (e.g., departments with ≥3 employees) may return empty results.
- Salary grades in conditional statements are assumed as: A (≥3000), B (2000–2999), C (<2000).

---
© Adapted from Intellipaat SQL Certification Training materials.# SQL-Case-Study
