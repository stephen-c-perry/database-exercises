show databases;

-- single line comment

/* multi line comment
that keeps going until you 
close it. */

describe items;

use employees;
show tables;

/* Which table(s) do you think contain a numeric type column?  
dept_emp, dept_manager, employees, salaries, titles
*/

/*Which table(s) do you think contain a string type column? 
departments, dept_emp, dept_manager, employees, titles
*/

/*Which table(s) do you think contain a date type column? 
dept_emp, dept_manager, employees, salaries, titles
*/

/*What is the relationship between the employees and the departments tables?
Many to Many
*/

SHOW CREATE TABLE dept_manager;

/*
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/