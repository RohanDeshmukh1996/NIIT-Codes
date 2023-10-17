-- TASK 1: create database as stylexcarz_db and use it
create database stylexcarz_db;
use stylexcarz_db;

-- Task 2: create 3 tables salesperson, customers, and orders
-- table 1: salesperson(salespersonid (primary key constraint), salesperson_name, salesperson_city, commission_rate)
 create table salesperson (salespersonid int primary key, salesperson_name varchar(25) not null, salesperson_city varchar(15) not null, commission_rate int not null) ;
 desc salesperson;
 -- table 2: customers(customerid(primary key constraint), c_firstname, c_stname, c_city, c_rating
 create table customers(customerid int primary key, c_firstname varchar(15) not null, c_lastname varchar(15) not null, c_city varchar(15) not null, c_rating int not null);
  desc customers;
 -- table 3:orders (orderid(primary key constraint), amount, orderdate, salespersonid(foreign key), customerid(foreign key))
 create table orders (orderid int primary key, amount int, orderdate date, salespersonid int not null,foreign key (salespersonid) references salesperson(salespersonid), customerid int not null,foreign key (customerid) references customers(customerid));
 desc orders;
 
 -- task 3: inserting values in respective tables
 insert into salesperson values(1001,'William','New York',12),(1002,'Liam','New Jersey',13),(1003,'Axelrod','San Jose',10),(1004,'James','San Diego',11),(1005,'Fran','Austin',26),(1007,'Oliver','New York',15),(1008,'John','Atlanta',2),(1009,'Charles','New Jersey',2);
 select * from salesperson;
 insert into customers values(2001,'Hoffman','Anny','New York',1),(2002,'Giovanni','Jenny','New Jerse',2),(2003,'Liu','Williams','San Jose',3),(2004,'Grass','Harry','San Diego',3),(2005,'Clemens','John','Austin',4),(2006,'Cisneros','Fanny','New York',4),(2007,'Pereira','Jonathan','Atlanta',3);
 select * from customers;
 insert into orders values(3001,23,STR_TO_DATE('01-02-2020','%d-%m-%Y'),1009,2007),(3002,20,STR_TO_DATE('23-02-2021','%d-%m-%Y'),1007,2007),(3003,89,STR_TO_DATE('06-03-2021','%d-%m-%Y'),1002,2002),(3004,67,STR_TO_DATE('02-04-2021','%d-%m-%Y'),1004,2002),(3005,30,STR_TO_DATE('30-07-2021','%d-%m-%Y'),1001,2007),(3006,35,STR_TO_DATE('18-09-2021','%d-%m-%Y'),1001,2004),(3007,19,STR_TO_DATE('02-10-2021','%d-%m-%Y'),1001,2001),(3008,21,STR_TO_DATE('09-10-2021','%d-%m-%Y'),1003,2003),(3009,45,STR_TO_DATE('10-10-2021','%d-%m-%Y'),1009,2005);
 select * from orders;
 
 -- task 4: update commission rate to 15 whose commission <15
 set sql_safe_updates=0;
 update salesperson set commission_rate= 15 where commission_rate<15;
 select * from salesperson;
 
 -- task 5: create bkp data base and store data of table orders as orders_bkp
 create database stylexcarz_bkp;
 use stylexcarz_bkp;
 CREATE TABLE  stylexcarz_bkp.orders_bkp SELECT * FROM  stylexcarz_db.orders;
 select * from orders_bkp;
 
 -- task 6: 
 use stylexcarz_db;
  set sql_safe_updates=0;
  select * from orders;
  select customerid from orders GROUP BY customerid HAVING COUNT(customerid) > 1;-- we get 2002 and 2007
  update customers set c_rating=5 where customerid=2002;
  update customers set c_rating=6 where customerid=2007;
  select * from customers;
   