-- Create six tables

CREATE TABLE departments (
  dept_no VARCHAR(5) PRIMARY KEY,
  dept_name STRING
);

CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY,
  title STRING
);

-- SHOW DATESTYLE;
-- SET DATESTYLE TO SQL, MDY;

-- DROP TABLE employees;

CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(5) NOT NULL,
  birthdate STRING,
  first_name STRING,
  last_name STRING,
  sex STRING,
  hire_date STRING,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
  emp_no INT,
  salary INT,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- DROP TABLE dept_manager;

CREATE TABLE dept_manager (
  dept_no VARCHAR(5),
  emp_no INT,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- DROP TABLE dept_emp;

CREATE TABLE dept_emp (
  emp_no INT,
  dept_no VARCHAR(5),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
    ON (e.emp_no=s.emp_no);
    
SELECT first_name, last_name, hire_date
FROM employees 
