-- Task 1:
use sakila;
Select a.First_name,  a.last_name, a.actor_id, a.last_update from actor a;

-- Task 2:
Select concat(a.first_name,' ',a.last_name) as 'Full Name' from actor a;
Select a.first_name as 'First Name', count(a.first_name) as Count from actor a group by a.first_name;
Select a.last_name as 'Last Name', count(a.last_name) as Count from actor a group by a.last_name; 

-- Task 3:
Select Rating, count(Rating) as 'Count Of Movies' from film group by Rating;

-- Task 4:
Select Rating,avg(rental_rate) as 'Average Rental Rate (in $)' from film group by Rating;

-- Task 5:
Select title, replacement_cost from film where replacement_cost<=9;
Select title, replacement_cost from film where replacement_cost between 15 and 20;
Select title,max(replacement_cost),min(rental_rate)  from film;

-- Task 6:
select * from film_actor;Select f.title,count(fa.actor_id) as 'Number of actors' 
from film f join film_actor fa on f.film_id= fa.film_id group by f.title;

-- Task 7:
Select title from film where title like 'K%' or title like 'Q%';

-- Task 8:
Select a.first_name,a.last_name from film f join film_actor fa join actor a on 
f.film_id=fa.film_id and fa.actor_id=a.actor_id where f.title='AGENT TRUMAN';	

-- Task 9:
Select f.title from film f join film_category fc on f.film_id=fc.film_id join 
category c on fc.category_id=c.category_id where c.name in('Children','Family');

-- Task 10:
Select f.title from  film f join inventory i join rental r on f.film_id=i.film_id 
and i.inventory_id=r.inventory_id group by r.inventory_id order by count(r.inventory_id) desc ;

-- Task 11:
Select c.name,count(f.replacement_cost-f.rental_rate) as 'Count in Replacement Cost and Rental Rate Greater than 15' 
from category c join film_category fc join film f on c.category_id=fc.category_id and fc.film_id=f.film_id 
where (f.replacement_cost-f.rental_rate)>15 group by c.name;

-- Task 12:
select c.name,count(fc.film_id) as 'Number of Movies' from category c join film_category fc on 
c.category_id=fc.category_id group by c.name having count(fc.film_id) between 60 and 70 order by 'Number of movies';