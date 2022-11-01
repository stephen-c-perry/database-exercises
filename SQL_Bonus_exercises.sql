use sakila;

/*

Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)

Label customer first_name/last_name columns as customer_first_name/customer_last_name

Label actor first_name/last_name columns in a similar fashion.

returns correct number of records: 620

*/

SELECT customer.first_name as customer_first_name, customer.last_name as customer_last_name, actor.first_name actor_first_name, actor.last_name as actor_last_name
FROM customer
LEFT JOIN actor USING (last_name);


/*
Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)

returns correct number of records: 200
*/


1.
SELECT LOWER(first_name), LOWER(last_name) from actor;

2.
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe'

3. 
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%gen%';

4. 

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;

5. 
SELECT *
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

6. List the last names of all the actors, as well as how many actors have that last name.

SELECT last_name, count(last_name)
FROM actor
GROUP BY last_name;

7.
List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

SELECT last_name, count(last_name) as count
FROM actor
GROUP BY last_name
HAVING count >= 2
;

8.
You cannot locate the schema of the address table. Which query would you use to re-create it?

CREATE TABLE address_table




