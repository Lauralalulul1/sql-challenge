
-- Inspect the CSVs and sketch out an ERD of the tables. Feel free to use a tool like http://www.quickdatabasediagrams.com.


-- Data Engineering
-- Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
-- For the primary keys check to see if the column is unique, otherwise create a composite key. Which takes to primary keys in order to uniquely identify a row.
-- Be sure to create tables in the correct order to handle foreign keys.


create table employees (
	emp_no INT,
	emp_title varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,
		PRIMARY KEY (emp_no)
);
SELECT * from employees;

create table Departments (
dept_no varchar,
dept_name varchar,
	PRIMARY KEY (dept_no)
);

SELECT * FROM Departments;

create table dept_emp (
	emp_no int,
	dept_no varchar,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);
		
SELECT * FROM dept_emp;

create table dept_manager (
	dept_no varchar,
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
SELECT * FROM dept_manager;

create table salaries (
	emp_no int,
	salary int,	
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no)REFERENCES Departments (dept_no)
);
SELECT * FROM salaries;

create table titles (
	title_id varchar,
	title varchar,
		FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
SELECT * FROM salaries;



-- Data Analysis
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries .salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT Departments.dept_no, Departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN Departments ON
dept_manager.dept_no = Departments.dept_no
INNER JOIN Employees ON
dept_manager.emp_no = employees.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, Departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
INNER JOIN Departments ON
dept_manager.dept_no = Departments.dept_no;


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, Departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN Departments ON
dept_emp.dept_no = Departments.dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, Departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN Departments ON
dept_emp.dept_no = Departments.dept_no
WHERE dept_name = 'Sales' OR 
	  dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;




