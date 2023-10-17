-- task 1:
use sakila ;
SELECT f.film_id,COUNT(i.film_id) FROM INVENTORY i join film f on f.film_id=i.film_id where f.title in('BROTHERHOOD BLANKET','SOUP WISDOM') group by i.film_id;

-- TASK 2:
select c.name,count(fc.film_id) as 'Number of Movies' from category c join film_category fc on c.category_id=fc.category_id group by c. name;

-- task 3:
select a.first_name,a.last_name from actor a join film_actor fa join film f on a.actor_id=fa.actor_id and fa.film_id=f.film_id order by f.rental_rate desc limit 3;

-- task 4:
select c.name as 'Film', sum(p.amount) as 'Total sales' from category as c join film_category as fc on fc.category_id = c.category_id join inventory as i on i.film_id = fc.film_id join rental as r on r.inventory_id = i.inventory_id join payment as p on p.rental_id = r.rental_id group by c.name;

-- (optional)task 5:
select c.name as 'Film', sum(p.amount) as 'Total_sales' from category as c join film_category as fc on fc.category_id = c.category_id join inventory as i on i.film_id = fc.film_id join rental as r on r.inventory_id = i.inventory_id join payment as p on p.rental_id = r.rental_id group by c.name order by Total_sales desc limit 10 ;
