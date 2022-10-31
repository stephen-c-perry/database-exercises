use employees;

/*

1. Find all the current employees with the same hire date as employee 101010 using a sub-query.*/

DESCRIBE employees;
#contains hire_date, emp_no, first_name, last_name, 

DESCRIBE dept_emp;
#contains: emp_no, to_date

SELECT *
FROM employees
WHERE emp_no = 101010;

-- Employee 101010 was hired on 1990-10-22 --


SELECT *
FROM employees
JOIN dept_emp USING (emp_no) 
WHERE hire_date = (
	SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
AND to_date > CURDATE()
);


-- The subquery is used to define the WHERE --




/*
2. Find all the titles ever held by all current employees with the first name Aamod.*/

-- Which table has job titles? titles
-- filter for current employees only
-- filter first_name = Aamod

SELECT first_name, last_name, title, t.to_date
FROM employees AS e 
JOIN titles AS t USING (emp_no)
WHERE to_date LIKE '9999%' AND e.first_name = 'Aamod';

--

SELECT title, first_name
FROM (
	SELECT first_name, employees.emp_no
	FROM employees
	JOIN dept_emp as de ON de.emp_no = employees.emp_no
	WHERE first_name = 'Aamod'
	AND de.to_date > CURDATE()
	) as e
JOIN titles AS t ON t.emp_no = e.emp_no;



-- question for class--
-- pay attention to how the answer is obtained with a subquery since my solution does not have a subquery --



-- start with employees table, filter for first_name Aamod, join titles, where to_date sub --



/*
3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.*/


DESCRIBE employees;
DESCRIBE dept_emp;

SELECT *
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE to_date NOT LIKE '9999%'
);
	

/*
4. Find all the current department managers that are female. List their names in a comment in your code.*/



SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
JOIN dept_manager USING (emp_no)
WHERE gender = "F"
AND dept_manager.emp_no IN (
							SELECT emp_no
								FROM dept_manager
								WHERE to_date > CURDATE()
								);
# Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil





/*
5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.*/

SELECT emp_no, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
JOIN salaries USING (emp_no)
WHERE salary > (
	SELECT AVG(salary)
	FROM salaries
	)
AND to_date > CURDATE()
GROUP BY emp_no, full_name;

/*
6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

Hint You will likely use multiple subqueries in a variety of ways
Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.*/


SELECT COUNT(*) AS num_of_emps, (COUNT(*) / (

										SELECT COUNT('to_date')
												FROM salaries
												WHERE to_date > CURDATE()) * 100) AS percent_of_emps
												
FROM salaries
WHERE salary >= (SELECT (MAX(salary) - STD(salary))
	FROM salaries
	)
AND salaries.to_date > CURDATE();




/*
BONUS

Find all the department names that currently have female managers.
Find the first and last name of the employee with the highest salary.
Find the department name that the employee with the highest salary works in.
*/