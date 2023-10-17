-- Task 1: find the count of employee in organization
use hr;
select * from employees;
select Count(*) from employees;

-- Task 2: count of employee department id  wise
select department_id, count(department_id) from employees group by department_id;

-- Task 3: first name , last name, salaries whose salry is greater tha $6000
select first_name,last_name,salary from employees where salary>6000;

-- Task 4 count of employees whose salary is graeter than $20000
select count(employee_id) from employees where salary>20000;

-- Task 5: list of employees who get commission to decide percentage of bonus
select * from employees where commission_pct is not null;

-- Task 6: name employee who gets commission
select concat(first_name,' ',last_name) as 'Full Name' from employees where commission_pct is not null;

-- task 7:  get detail of employee  who get commission in given format 
select employee_id as 'Employee ID',concat(first_name,' ',last_name) as 'Employee Full Name', email as 'Email ID', phone_number as 'Phone Number' from employees where commission_pct is not null;

-- task 8: top 3 department ids that have highest  total salary of employees
select department_id, sum(salary) from employees group by department_id order by sum(salary) desc limit 3; 

-- task 9: show all details of employee who works in IT department
select department_id from departments where department_name like 'IT'; --- we get u/p of 60
select * from employees where department_id=60;

-- task 10:
select count(department_id) as 'count of employee in IT' , avg(salary) from employees where department_id=60;

-- task 11:
select department_id as'Department ID', count(department_id) as 'Number of Employees' from employees where salary between 7000 and 10000 group by department_id; 