
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














