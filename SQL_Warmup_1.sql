
#Using the cities table, how many different countries are represented?
select count(distinct CountryCode) as num_countries
from city;


#Which countries have the most entries?
select countrycode, count(*) as mode
from city
group by countrycode
order by count(*) desc;


#What is the average city population in the dataset?
select avg(population) as avg_pop
from city;


#How many cities fall below the average population?
select count(name) as num_below_avg
from city
where population < (select avg(population) as avg_pop
					from city);


#Which city has the highest population of all?
select name
from city
where population = (select max(population) as max_pop
					from city);

