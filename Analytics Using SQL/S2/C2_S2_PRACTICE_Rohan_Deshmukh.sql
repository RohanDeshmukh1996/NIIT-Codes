-- task 1: use sakila db to extract inactive customer in customer table
use sakila;
select * from customer where active =0;

-- task 2: first name ,last name and email of inactive customers
select first_name,last_name,email from customer where active =0;

-- task 3: highest number of inactive customer with thier store_id
select store_id, count(active) from customer where active =0 group by store_id;

-- task 4: name of movies with PG-13 rating
select title as 'Name'  from film where rating like 'PG-13';  

-- TASK 5:TOP 3 PG-13 MOVIES BASED ON  LONGEST RUN TIME
select title as 'Name', length from film where rating like 'PG-13' order by length desc limit 3;

-- TASK 6: most popular PG-13 movies base on rental duration (lets take top 10)
select title as 'Name', rental_duration from film where rating like 'PG-13' order by rental_duration desc;

-- TASK 7: 	AVERAGE RENTAL COST
SELECT AVG(rental_rate) as'Average Rental Cost' FROM FILM;

-- TASK 8: sum of replacement cot of all movies
SELECT SUM(replacement_cost) as'Sum of replacement cost of all movies' FROM FILM;

-- task 9: count of movie with category of Animetion and Children 
select category_id from category where name in ('Animation','Children'); -- we got 2 for Animation and 3 for children as output
select category_id ,count(category_id) from film_category where category_id in (2,3) group by category_id;

