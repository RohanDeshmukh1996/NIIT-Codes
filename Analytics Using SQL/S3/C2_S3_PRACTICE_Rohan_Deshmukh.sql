-- task 1: diplay id, first name and last name  of those who are in IT department 
use HR;
SELECT 
    e.employee_id AS IDs, e.first_name, e.last_name
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
WHERE
    d.department_name = ('IT');

-- task 2:min and max salariesn of each deapartment
SELECT 
    d.department_name AS 'dept_name',
    MIN(e.salary) AS 'MIN SALARY',
    MAX(salary) AS 'MAX SALARY'
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- task 3: 
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
LIMIT 10;


-- task 4: diplay id, first name and last name of those who are end_date is 1999-12-31
SELECT 
    e.employee_id AS IDs, e.first_name, e.last_name
FROM
    employees e
        JOIN
    job_history j ON e.employee_id = j.employee_id
WHERE
    j.end_date = ('1999-12-31');

-- task 5: display id first name dept name and experience of those who
SELECT 
    e.employee_id AS 'ID',
    e.first_name AS 'Name',
    d.department_name AS 'Department',
    TIMESTAMPDIFF(YEAR,
        e.hire_date,
        CURRENT_DATE()) AS 'Total Experience'
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
WHERE
    TIMESTAMPDIFF(YEAR,
        e.hire_date,
        CURRENT_DATE()) >= 25; 