-- task 1:
use world;
select * from country;	-- display table
select count(*) from country; -- count of table
select name, population from country where code in ('USA','GBR','ARE'); -- DISPLAY NAME  AND POPULATION OF GIVEN CODE

-- TASK 2:
select continent,sum(population) from country group by continent order by sum(population) desc; -- group by continent and adding population of continents

-- Task 3:
select c.name from country c where c.continent = 'Europe' and code in(select cl.countrycode from countrylanguage cl where language='French');

-- task 4:
SET sql_mode=(select REPLACE(@@SQL_MODE,'ONLY_FULL_GROUP_BY',''));
SELECT continent, name FROM country GROUP BY name;

