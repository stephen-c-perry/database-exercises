use employees;

# to find those hired in the 1990s

select *
from employees
where hire_date like '199%';

select distinct first_name
from employees
where hire_date like '%-10-%';

#to find those hired between 1990 and 1999

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

SELECT * 
FROM employees
WHERE first_name LIKE 'S%s';

# Find all those whose last name is either foote or sidou

Select *
FROM employees
WHERE last_name = 'foote' OR last_name = 'Sidou';

SELECT *
FROM employees
WHERE last_name IN ('Foote', 'Sidou');

# Any records where hire_date is not null?

SELECT *
FROM employees
WHERE hire_date IS NOT NULL;

# Find employees who were hired in the 90s and first name starts with s or last name starts with s

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND (first_name LIKE 'S%' OR last_name LIKE 'S%');
	
#Employees hired in the 90s, order by hire_date ascending

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY hire_date ASC;
# ^ORDER BY defaults to Ascending if not specified



# sort by gender and hire_date

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY hire_date ASC, gender ASC;

# find the oldest employee hired in 1990
SELECT *
FROM employees
WHERE hire_date LIKE '1990%'
ORDER BY birth_date ASC, first_name ASC
LIMIT 5 OFFSET 3;

