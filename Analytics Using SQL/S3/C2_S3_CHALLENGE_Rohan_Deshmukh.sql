-- task 1:
use hr;
SELECT 
    l.city, COUNT(*)
FROM
    locations l
        JOIN
    departments d ON l.location_id = d.location_id
        JOIN
    employees e ON e.department_id = d.department_id
GROUP BY l.city
ORDER BY COUNT(*) DESC
LIMIT 5;

-- task 2:
SELECT 
  e.first_name,e.last_name,c.country_name,l.city,d.department_name,e.salary
FROM countries c join
    locations l on l.country_id=c.country_id
        JOIN
    departments d ON l.location_id = d.location_id
        JOIN
    employees e ON e.department_id = d.department_id
where l.city in ('South San Francisco','Oxford','Seattle','Southlake','Toronto');

-- task 3:

SELECT 
    l.city, COUNT(*)<10
FROM
    locations l
        JOIN
    departments d ON l.location_id = d.location_id
        JOIN
    employees e ON e.department_id = d.department_id
    GROUP BY l.city HAVING count(*)<10;
    
-- task 4:
SELECT 
    l.city,
    AVG(TIMESTAMPDIFF(YEAR,
        e.hire_date,
        CURRENT_DATE())) AS 'Experience'
   FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        JOIN
    locations l ON l.location_id = d.location_id
GROUP BY city
HAVING  COUNT(*) < 10; 

-- task 5:
select * from employees;
SELECT 
  e.first_name,e.last_name,e.email,e.phone_number
FROM countries c join
    locations l on l.country_id=c.country_id
        JOIN
    departments d ON l.location_id = d.location_id
        JOIN
    employees e ON e.department_id = d.department_id
where l.city in ('South San Francisco','Oxford','Seattle','Southlake','Toronto') and TIMESTAMPDIFF(YEAR,e.hire_date,CURRENT_DATE())>10;


-- task 6:
SELECT 
  e.first_name,e.last_name,e.email,e.phone_number,e.manager_id
FROM countries c join
    locations l on l.country_id=c.country_id
        JOIN
    departments d ON l.location_id = d.location_id
        JOIN
    employees e ON e.department_id = d.department_id
where l.city in ('South San Francisco','Oxford','Seattle','Southlake','Toronto') and TIMESTAMPDIFF(YEAR,e.hire_date,CURRENT_DATE())>10;

 

