show databases;
USE zillow;
select database();
show databases;
use fruits_db;
select database();
show databases;
use tsa_item_demand;
select database();
select item_brand from items;
select store_address from stores;
select sale_id from sales where sale_amount > 15;
select item_name from items where item_price < 5;

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
