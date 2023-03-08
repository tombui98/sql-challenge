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