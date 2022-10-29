/*
1. Use the employees database.*/

USE employees;


/*
2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.


  Department Name    | Department Manager
 --------------------+--------------------
  Customer Service   | Yuchang Weedman
  Development        | Leon DasSarma
  Finance            | Isamu Legleitner
  Human Resources    | Karsten Sigstam
  Marketing          | Vishwani Minakawa
  Production         | Oscar Ghazalie
  Quality Management | Dung Pesch
  Research           | Hilary Kambil
  Sales              | Hauke Zhang
 */
 
 DESCRIBE dept_manager;
 # fields: emp_no, dept_no, from_date, to_date
 
 DESCRIBE departments;
 #fields: dept_no, dept_name
 
 DESCRIBE employees;
 # emp_no, birth_date, first_name, last_name, gender, hire_date
 
 #What do the tables have in common?
 
 /* 1. employees and dept_manager share emp_no. 2. depart_manager and departments have dept_no in common.  
 	  */
 
SELECT dept_name AS Department, CONCAT(first_name,'_',last_name) AS Full_Name
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE to_date LIKE '9999%'
 
-- can also be written with USING since the column names we are selecting for the join are identical across tables -- 

-- To JOIN with ON you must specify the table and column (ex. table_a.column_in_a or dept_manager.dept_no) these can be aliased with AS alternate_name --
 
 SELECT dept_name, CONCAT(first_name, " ", last_name) AS `Name`
 FROM departments
 JOIN dept_manager USING (dept_no)
 JOIN employees USING (emp_no)
 WHERE to_date LIKE "9999%";
 
-- To JOIN with USING the column name must be the same in the two tables that are being joined -- 
 
 
 SELECT *
 FROM employees AS e
 JOIN dept_manager AS dm ON e.emp_no = dm.emp_no AND to_date > CURDATE()
 LIMIT 50;
 
 -- Adding to my supertable
 SELECT *
 FROM employees AS e
 JOIN dept_manager AS dm ON e.emp_no = dm.emp_no AND to_date > CURDATE()
 JOIN departments AS d USING (dept_no)
 LIMIT 50;
 
 -- Limiting my output by a specific SELECT
 SELECT d.dept_name, CONCAT(e.first_name, " ", e.last_name) AS current_department_manager
 FROM employees AS e
 JOIN dept_manager AS dm ON e.emp_no = dm.emp_no AND to_date > CURDATE()
 JOIN departments AS d USING (dept_no)
 ORDER BY dept_name;
  
-- thought process: join everything together to make a super table, then go back and start pulling things out 	   	that you don't need and clean everything up.  






/*  
3. Find the name of all departments currently managed by women.


Department Name | Manager Name
----------------+-----------------
Development     | Leon DasSarma
Finance         | Isamu Legleitner
Human Resources | Karsetn Sigstam
Research        | Hilary Kambil
*/

SELECT dept_name AS "Department Name", CONCAT(first_name, " ",last_name) AS "Manager Name"
FROM departments
JOIN dept_manager USING (dept_no)
JOIN employees USING (emp_no)
WHERE to_date LIKE "9999%" AND gender = "F"
ORDER BY dept_name;

-- The query above and below return the same results -- --

SELECT dept_name AS "Department Name", CONCAT(first_name, " ",last_name) AS "Manager Name"
FROM employees AS e 
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
#can build conditions into the join itself, or, add them at the end in a WHERE clause.  Either is fine.
	AND to_date > CURDATE()
	AND gender = 'F'
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;



/*
4. Find the current titles of employees currently working in the Customer Service department.


Title              | Count
-------------------+------
Assistant Engineer |    68
Engineer           |   627
Manager            |     1
Senior Engineer    |  1790
Senior Staff       | 11268
Staff              |  3574
Technique Leader   |   241
*/

SELECT title
FROM titles
JOIN dept_manager USING (emp_no)
JOIN departments USING (dept_no)
WHERE dept_name LIKE "Customer service" AND (titles.to_date LIKE "9999%");

-- 

SELECT *
FROM dept_emp AS de
JOIN titles AS t ON de.emp_no = t.emp_no
	AND t.to_date > CURDATE()
	AND de.to_date > CURDATE()
JOIN departments AS d ON d.dept_no = de.dept_no
	AND dept_name = 'Customer service';



/*
5. Find the current salary of all current managers.


Department Name    | Name              | Salary
-------------------+-------------------+-------
Customer Service   | Yuchang Weedman   |  58745
Development        | Leon DasSarma     |  74510
Finance            | Isamu Legleitner  |  83457
Human Resources    | Karsten Sigstam   |  65400
Marketing          | Vishwani Minakawa | 106491
Production         | Oscar Ghazalie    |  56654
Quality Management | Dung Pesch        |  72876
Research           | Hilary Kambil     |  79393
Sales              | Hauke Zhang       | 101987
*/

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS `NAME`, salary AS Salary
FROM salaries
JOIN dept_manager USING (emp_no)
JOIN departments USING (dept_no)
JOIN employees USING (emp_no)
WHERE salaries.to_date LIKE '9999%'
ORDER BY dept_name;

-- Instructor's solution below --

SELECT d.dept_name,
		CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager,
		s.salary
FROM employees as e
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;



  

/*
6. Find the number of current employees in each department.


+---------+--------------------+---------------+
| dept_no | dept_name          | num_employees |
+---------+--------------------+---------------+
| d001    | Marketing          | 14842         |
| d002    | Finance            | 12437         |
| d003    | Human Resources    | 12898         |
| d004    | Production         | 53304         |
| d005    | Development        | 61386         |
| d006    | Quality Management | 14546         |
| d007    | Sales              | 37701         |
| d008    | Research           | 15441         |
| d009    | Customer Service   | 17569         |
+---------+--------------------+---------------+
*/


SELECT d.dept_no,
	d.dept_name,
	COUNT(*)
FROM dept_emp AS de
JOIN departments AS d ON de.dept_no = d.dept_no
	AND de.to_date > CURDATE()
GROUP BY dept_no, dept_name;


/*
7. Which department has the highest average salary? Hint: Use current not historic information.


+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+
*/


SELECT
	d.dept_name
		ROUND(AVG(salary), 2) AS average_salary
FROM dept_emp AS department
JOIN salaries AS s ON de.emp_n = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;



/*
8. Who is the highest paid employee in the Marketing department?


+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+
*/

DESCRIBE salaries
DESCRIBE departments

SELECT first_name, last_name
FROM employees
JOIN dept_emp ON employees.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
WHERE salaries.to_date LIKE '9999%' AND departments.dept_name = 'Marketing'
ORDER BY salary DESC
LIMIT 1;


/*
9. Which current department manager has the highest salary?


+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+
*/




/*
10. Determine the average salary for each department. Use all salary information and round your results.


+--------------------+----------------+
| dept_name          | average_salary | 
+--------------------+----------------+
| Sales              | 80668          | 
+--------------------+----------------+
| Marketing          | 71913          |
+--------------------+----------------+
| Finance            | 70489          |
+--------------------+----------------+
| Research           | 59665          |
+--------------------+----------------+
| Production         | 59605          |
+--------------------+----------------+
| Development        | 59479          |
+--------------------+----------------+
| Customer Service   | 58770          |
+--------------------+----------------+
| Quality Management | 57251          |
+--------------------+----------------+
| Human Resources    | 55575          |
+--------------------+----------------+
*/




/*
Bonus

11. Find the names of all current employees, their department name, and their current manager's name.


240,124 Rows

Employee Name | Department Name  |  Manager Name
--------------|------------------|-----------------
 Huan Lortz   | Customer Service | Yuchang Weedman

 .....
Bonus 

12. Who is the highest paid employee within each department.

*/