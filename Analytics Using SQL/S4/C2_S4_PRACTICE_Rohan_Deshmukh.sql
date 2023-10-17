-- task 1:
use HR;
select e.employee_id, e.first_name,e.last_name,(select d.department_name from departments d where e.department_id=d.department_id) as 'department name' from employees e; 

-- task 2:

select e.first_name,e.last_name, salary from employees e where salary>(select avg(salary) from employees) group by e.employee_id;

-- task 3:

select e.first_name,e.last_name from employees e where salary<(select avg(e.salary) from employees e where e.department_id in(select d.department_id from departments d where d.department_name like'%Sales%')) and e.department_id in (select d.department_id from departments d where d.department_name like'%sales%')  group by e.employee_id;

-- task 4
SELECT * FROM 	jobs;
select e.first_name, e.last_name ,e.salary from employees e where e.salary>(select j.max_salary from jobs j where j.job_id='IT_PROG') order by e.salary asc;

-- task 5:

select * ,(select j.min_salary from jobs j where j.job_id=e.job_id) as 'min salary' from employees e ORDER BY e.salary asc;


-- task 6:

SELECT e.first_name, e.last_name,e.department_id FROM employees e WHERE salary >( SELECT (SUM(e1.salary))*.6 FROM employees e1 WHERE e1.department_id=e.department_id);



-- (optional)task 7:

Select e.first_name,e.last_name, e.manager_id from employees e join departments d on e.department_id=d.department_id join locations l on d.location_id=l.location_id where country_id='UK' ;

-- (OPTIONAL) TASK 8:

SELECT first_name,last_name,salary FROM employees order by salary desc limit 5; 
