USE employees;

/* 
--------------

case column
	when condition_a then value_a
	when condition_b then value_b
	else value_c
end as new_column_name 
	
--------------
*/



/*
1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
*/

show tables;

select first_name, last_name, dept_no, from_date, to_date, to_date > now() AS is_current_employee
from employees
join dept_emp using (emp_no)
limit 100;



/*

2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
*/

select first_name, -- last_name, left(last_name, 1), 
	case
		when left(last_name, 1) <= 'H' then 'A-H'
		when left(last_name, 1) <= 'Q' then 'I-Q'
		else 'R-Z'
	end as 'alpha_group'
from employees
limit 1000;


# can use operators on strings


/*
3. How many employees (current or previous) were born in each decade?*/

select min(birth_date), max(birth_date)
from employees
limit 100;

select birth_date,
	case
		when birth_date >= '1960-01-01' then '60s'
		when birth_date >= '1950-01-01' then '50s'
	end as 'birth_decade'
from employees
LIMIT 1000;


select birth_decade, count(*) as num_births
	(select birth_date,
		case
			when birth_date >= '1960-01-01' then '60s'
			when birth_date >= '1950-01-01' then '50s'
		end as 'birth_decade'
	from employees) as e
group by birth_decade
;


/*
4. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service? */


select 
	case
		when dept_name in ('Research', 'Development') then 'R&D'
		when dept_name in ('Sales', 'Marketing') then 'Sales & Marketing'
		when dept_name in ('Production', 'Quality Management') then 'Prod & QM'
		when dept_name in ('Finance', 'Human Resources') then 'Finance & HR'
	  else 'Customer_Service'
	end as 'new_dept',  round(avg(salary),2) as mean_salary
from departments
	join dept_emp de
		using (dept_no)
	join salaries s
		using (emp_no)
Where de.to_date > now()
	and s.to_date > now()
group by new_dept;

-- -----------