/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
Answer: 709

SELECT *
FROM employees
Where first_name IN ('Irena', 'Vidya', 'Maya');



Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
Answer: Yes, 709

SELECT *
FROM employees
Where first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';



Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
Answer: 441

SELECT *
FROM employees
Where (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') 
	AND gender = 'M';


Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
ANSWER: 7330

SELECT *
FROM employees
Where last_name LIKE 'E%';


Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
ANSWER: 30,723 have a last name that starts or ends with E
SELECT *
FROM employees
Where last_name Like 'E%' or last_name LIKE '%E';

ANSWER: 24,292 have a last name that ends with E but does not start with E
SELECT *
FROM employees
Where last_name LIKE '%E';


Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
ANSWER: 899
SELECT *
FROM employees
WHERE last_name LIKE 'E%E';

ANSWER 24,292
SELECT *
FROM employees
WHERE last_name LIKE '%E';


Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
ANSWER: 135,214
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';



Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
ANSWER: 842
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';



Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
ANSWER: 362
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	AND birth_date LIKE '%-12-25';



Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
ANSWER: 1873
SELECT *
FROM employees
WHERE last_name LIKE '%q%';



Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
ANSWER: 547
SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';

*/

