Use sakila;

-- Task 1 Display the full names of actors available in the database.

SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS 'Full Name'
FROM
    actor a;
-- Task 2 Management wants to know if there are any names of the actors appearing frequently.
--  Task 2a--Display the number of times each first name appears in the database.
SELECT 
    a.first_name AS 'First Name', COUNT(a.first_name) AS Count
FROM
    actor a
GROUP BY a.first_name;

--  Task 2b What is the count of actors that have unique first names in the database? Display the first names of all these actors.
SELECT 
    first_name
FROM
    actor
GROUP BY first_name
HAVING COUNT(*) = 1;

-- task 3 The management is interested to analyze the similarity in the last names of the actors
-- task 3a Display the number of times each last name appears in the database.
SELECT 
    a.last_name AS 'Last Name', COUNT(a.last_name) AS Count
FROM
    actor a
GROUP BY a.last_name;
-- task 3b Display all unique last names in the database.
SELECT 
    last_name
FROM
    actor
GROUP BY last_name
HAVING COUNT(*) = 1;

-- Task 4 The management wants to analyze the movies based on their ratings to determine if they are suitable for kids or some parental assistance is required. Perform the following tasks to perform the required analysis
-- a Display the list of records for the movies with the rating "R" (The movies with the rating "R" are not suitable for audience under 17 years of age).
SELECT 
    title
FROM
    film
WHERE
    rating = 'R'; 
 -- b Display the list of records for the movies that are not rated "R".  
SELECT 
    title
FROM
    film
WHERE
    rating != 'R';
 -- c Display the list of records for the movies that are suitable for audience below 13 years of age   
SELECT 
    title, rating
FROM
    film
WHERE
    rating = 'PG' OR rating = 'G';

-- Task 5 : The board members want to understand the replacement cost of a movie copy(disc - DVD/Blue Ray). The replacement cost refers to the amount charged to the customer if the movie disc is not returned or is returned in a damaged state.
-- a Display the list of records for the movies where the replacement cost is up to $11.
SELECT 
    title
FROM
    film
WHERE
    replacement_cost < 11;
    
-- b Display the list of records for the movies where the replacement cost is between $11 and $20.
SELECT 
    title
FROM
    film
WHERE
    replacement_cost BETWEEN 11 AND 20;
    
-- c Display the list of records for the all movies in descending order of their replacement costs.    
SELECT 
    title
FROM
    film
ORDER BY replacement_cost DESC;

-- Task 6 Display the names of the top 3 movies with the greatest number of actors
SELECT 
    f.title, COUNT(fc.actor_id) AS 'Count of actors'
FROM
    film f
        JOIN
    film_actor fc ON f.film_id = fc.film_id
GROUP BY f.title
ORDER BY COUNT(fc.actor_id) DESC
LIMIT 3;

-- Task 7 'Music of Queen' and 'Kris Kristofferson' have seen an unlikely resurgence. As an unintended consequence, films starting with the letters 'K' and 'Q' have also soared in popularity. Display the titles of the movies starting with the letters 'K' and ‘Q
SELECT 
    title
FROM
    film
WHERE
    title LIKE 'K%' OR title LIKE 'Q%';

-- Task 8 The film 'Agent Truman' has been a great success. Display the names of all actors who appeared in this film
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS 'Name'
FROM
    actor a
        JOIN
    film_actor fc ON a.actor_id = fc.actor_id
WHERE
    film_id = (SELECT 
            film_id
        FROM
            film
        WHERE
            title = 'Agent Truman');
 
 -- Task 9 Sales have been lagging among young families, so the management wants to promote family movies Identify all the movies categorized as family films
SELECT 
    f.title
FROM
    film f
        JOIN
    film_category fc
        JOIN
    category c ON f.film_id = fc.film_id
        AND fc.category_id = c.category_id
WHERE
    c.name = 'Family';
 
 -- Task 10 The management wants to observe the rental rates and rental frequencies(Number of time the movie disc is rented).
-- a Display the maximum, minimum, and average rental rates of movies based on their ratings. The output must be sorted in descending order of the average rental rates.
SELECT 
    rating,
    MAX(rental_rate) AS 'Max Rate',
    MIN(rental_rate) AS 'Min Rate',
    AVG(rental_rate) AS 'Avg Rate'
FROM
    film
GROUP BY rating
ORDER BY AVG(rental_rate) DESC;

-- b Display the movies in descending order of their rental frequencies, so the management can maintain more copies of those movies
SELECT 
    f.title, COUNT(r.inventory_id) AS 'Rental Frequency'
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
        JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY COUNT(r.inventory_id) DESC;

-- Task 11 : In how many film categories, the difference between the average film replacement cost ((disc-DVD/Blue Ray) and the average film rental rate is greater than $15?Display the list of all film categories identified above, along with the corresponding average film replacement cost and average film rental rate
SELECT 
    c.name AS category,
    AVG(f.replacement_cost) AS 'Average_replacement_cost',
    AVG(f.rental_rate) AS avg_rental_rate
FROM
    category AS c
        JOIN
    film_category AS fc ON c.category_id = fc.category_id
        JOIN
    film AS f ON fc.film_id = f.film_id
GROUP BY c.name
HAVING (AVG(replacement_cost) - AVG(rental_rate)) > 15;

-- Task 12:Display the film categories in which the number of movies is greater than 70
SELECT 
    c.name AS 'Name', COUNT(fc.film_id) AS 'Number of movies'
FROM
    category c
        JOIN
    film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
HAVING COUNT(fc.film_id) > 70
ORDER BY 'Number of movies';