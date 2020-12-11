DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;




CREATE TABLE departments (
  dept_no varchar NOT NULL,
  dept_name VARCHAR NOT NULL
);


CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL
);

CREATE TABLE dept_managers (
  dept_no VARCHAR NOT NULL,
  emp_no INT NOT NULL
);

CREATE TABLE employees (
  emp_no INT NOT NULL,
  emp_title_id VARCHAR NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date DATE NOT NULL
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL
);
--SELECT * FROM employees --limit 

-------------------------------------------------------------------------------------
--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.first_name, employees.last_name, employees.emp_no, employees.sex, salaries.salary
FROM employees
	LEFT JOIN salaries ON (employees.emp_no= salaries.emp_no)
ORDER BY employees.emp_no;
-----------------------------------------------------------------------------------------------
--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

---------------------------------------------------------------------------------------------
--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name

SELECT dept_managers.dept_no, dept_managers.emp_no, departments.dept_name, employees.last_name,employees.first_name
FROM dept_managers 
INNER JOIN departments ON (dept_managers.dept_no=departments.dept_no)
INNER JOIN employees ON (dept_managers.emp_no=employees.emp_no);

------------------------------------------------------------------------------------------------
--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT departments.dept_name, employees.emp_no, employees.last_name,employees.first_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no=dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no=departments.dept_no);

------------------------------------------------------------------------------------------------
--List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name= 'Hercules'
AND last_name like 'B%';

--------------------------------------------------------------------------------------------
--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no= dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no= departments.dept_no)
WHERE departments.dept_name= 'Sales';
-------------------------------------------------------------------------------------------
--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no= dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no= departments.dept_no)
WHERE departments.dept_name IN ('Sales','Development');

---------------------------------------------------------------------------------------------
--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

SELECT last_name, COUNT (*)
FROM employees 
GROUP BY last_name
ORDER BY count(*) DESC;

----------------------------------------------------------------------------------------------
--BONUS






