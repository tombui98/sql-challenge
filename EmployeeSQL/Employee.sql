-- PART 1 - Data Engineering
-- Creating table schema

-- Create department table

DROP TABLE departments

CREATE TABLE departments (
   dept_no VARCHAR(30),
   dept_name VARCHAR(30) NOT NULL,
   PRIMARY KEY (dept_no)
);

select * from departments;

-- Create dept_emp table

DROP TABLE dept_emp

CREATE TABLE dept_emp (
      emp_no INTEGER NOT NULL,
	  dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

select * from dept_emp

-- create table employees
 
drop table employees


ALTER DATABASE "Employees_SQL" SET datestyle TO "ISO, MDY";

create table employees (
     emp_no integer not null,
     emp_title_id varchar(30) not null,
     birth_date date not null,
     first_name varchar(30) not null,
     last_name varchar (30) not null,
     sex varchar (30) not null,
	 hire_date date not null,
  Primary key (emp_no)
);

ALTER DATABASE "Employees_SQL" SET datestyle TO "ISO, MDY";

select * from employees;

-- Create table dept_manager
DROP TABLE dept_manager

CREATE TABLE dept_manager (
      dept_no VARCHAR(30) NOT NULL,
      emp_no INTEGER NOT NULL,
   FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
   FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from dept_manager;

-- create table salaries

drop table salaries

create table salaries (
      emp_no int not null,
      salary int not null,
    Primary Key (emp_no),
	Foreign key (emp_no) references employees(emp_no)
);

select * from salaries;

-- create table titles 

drop table titles

create table titles (
     title_id VARCHAR (30) NOT NULL,
	 title VARCHAR (30) NOT NULL,
   Primary Key (title_id)
);

select * from titles;
---------------------------------------------------------------------------------------
-- PART 2 (DATA_ANALYSIS)

-- 1. List the employee number, last name, first name, sex, and salary of each employee.

Select employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
From employees
Left Join salaries
on employees.emp_no = salaries.emp_no
Order by emp_no;

-- 2. List the first name, last name and hire date for the employees whon were hired
-- in 1986.

Select employees.first_name,
employees.last_name,
employees.hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

-- 3. List the manager of each department along with their department number,
-- department name, employee number, last name and first name.

SELECT M.emp_no, M.dept_no, E.last_name, E.first_name, D.dept_name
From Dept_manager AS M
Inner join departments AS D
ON D.dept_no = M.dept_no
Inner join Employees AS E
ON E.emp_no = M.emp_no;

-- 4. List the department number for each employee along with that employee's
-- employee number, last name, first name and department name.

SELECT b.dept_no, E.emp_no, E.last_name, E.first_name, D.dept_name
FROM EMployees as E
Inner join dept_manager as b
ON E.emp_no = b.emp_no
Inner join departments D
ON b.dept_no = D.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with letter B.

SELECT E.first_name, E.last_name, E.sex
From employees as E
Where first_name = 'Hercules' AND last_name like 'B%';

-- 6. List each employee in the sales department, including their employee number,
-- last name, and first name.

SELECT E.emp_no, E.last_name, E.first_name, departments.dept_name
FROM employees as E
Join dept_emp
ON E.emp_no = dept_emp.emp_no
Join departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, departments.dept_name
FROM employees as E
Join dept_emp
ON E.emp_no = dept_emp.emp_no
Join departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;