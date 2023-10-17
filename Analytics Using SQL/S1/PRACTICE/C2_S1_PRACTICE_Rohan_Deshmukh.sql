-- TASK 1: Create a database to store employees' records and name it techmac_db. Use the techmac_db database to store database objects such as tables.
CREATE DATABASE techmac_db;
USE techmac_db;

-- TASK 2.1:Create three tables to store the details of the employees of the three start-ups. Name the tables as techhyve_employees, techcloud_employees, and techsoft_employees. Each table must be designed to store employee ID, first name, last name, gender, and age
CREATE TABLE techhyve_employees(employeeid VARCHAR(6), firstname varchar(15), lastname varchar(15), gender varchar(6), age int);
CREATE TABLE techcloud_employees(employeeid VARCHAR(6), firstname varchar(15), lastname varchar(15), gender varchar(6), age int);
CREATE TABLE techsoft_employees(employeeid VARCHAR(6), firstname varchar(15), lastname varchar(15), gender varchar(6), age int);
DESC techsoft_employees;
DESC techhyve_employees;
DESC techcloud_employees;

-- TASK 2.2: Each record should be identified uniquely. So, alter the Employee ID column with the primary key constraint.
ALTER TABLE techhyve_employees ADD PRIMARY KEY(employeeid);
ALTER TABLE techcloud_employees ADD PRIMARY KEY(employeeid);
ALTER TABLE techsoft_employees ADD PRIMARY KEY(employeeid);
DESC techsoft_employees;
DESC techhyve_employees;
DESC techcloud_employees;

-- TASK2.3:The age of the employees should be between 21 and 55. So, alter the Age column structure with the check constraint
ALTER TABLE techhyve_employees ADD CHECK(age BETWEEN 21 AND 55);
ALTER TABLE techcloud_employees ADD CHECK(age BETWEEN 21 AND 55);
ALTER TABLE techsoft_employees ADD CHECK(age BETWEEN 21 AND 55);
DESC techsoft_employees;
DESC techhyve_employees;
DESC techcloud_employees;

-- TASK 3.1:The organization has suggested to store the communication proficiency level of employees, ranging from 1 to 5. Alter the three tables and add a new column, Communication_Proficiency
ALTER TABLE techsoft_employees ADD COLUMN communication_proficiency int;
ALTER TABLE techhyve_employees ADD COLUMN communication_proficiency int;
ALTER TABLE techcloud_employees ADD COLUMN communication_proficiency int;

-- TASK 3.2:Alter the Communication_Proficiency column with the check constraint and set the default value of this column as 1
ALTER TABLE techhyve_employees ADD CHECK(communication_proficiency BETWEEN 1 AND 5);
ALTER TABLE techcloud_employees ADD CHECK(communication_proficiency BETWEEN 1 AND 5);
ALTER TABLE techsoft_employees ADD CHECK(communication_proficiency BETWEEN 1 AND 5);
ALTER TABLE techhyve_employees ALTER communication_proficiency SET DEFAULT 1;
ALTER TABLE techcloud_employees ALTER communication_proficiency SET DEFAULT 1;
ALTER TABLE techsoft_employees ALTER communication_proficiency SET DEFAULT 1;

-- TASK 4:Insert the employee data in the three tables, techhyve_employees, techcloud_employees, and techsoft_employees by using the INSERT INTO command
INSERT techhyve_employees VALUES('TH0001','Eli','Evans','male',26,1), ('TH0002','Carlos','Simmons','male',32,2),('TH0003','Kathie','Bryant','female',25,1),('TH0004','Joey','Hughes','male',41,4),('TH0005','Alice','Matthews','female',52,4);
SELECT * FROM techhyve_employees;
INSERT techcloud_employees VALUES('TC0001','Teresa','Bryant','Female',39,2),('TC0002','Alexis','Patterson','Male',48,5),('TC0003','Rose','Bell','Female',42,3),('TC0004','Gemma','Watkins','Female',44,3),('TC0005','Kingston','Martinez','Male',29,2);
SELECT * FROM techcloud_employees;
INSERT techsoft_employees VALUES('TS0001','Peter','Burtler','Male',44,4),('TS0002','Harold','Simmons','Male',54,4),('TS0003','Juliana','Sanders','Female',36,2),('TS0004','Paul','Ward','Male',29,2),('TS0005','Nicole','Bryant','Female',30,2);
SELECT * FROM techsoft_employees;

-- TASK 5:Back up the three tables, techhyve_employees, techcloud_employees, and techsoft_employees, and name them as techhyve_employees_bkp, techcloud_employees_bkp, and techsoft_employees_bkp, respectively
CREATE DATABASE backup_techmac_db;
use backup_techmac_db ;
CREATE TABLE  backup_techmac_db.techhyve_employees_bkp SELECT * FROM  techmac_db.techhyve_employees;
CREATE TABLE  backup_techmac_db.techcloud_employees_bkp SELECT * FROM  techmac_db.techcloud_employees;
CREATE TABLE  backup_techmac_db.techsoft_employees_bkp SELECT * FROM  techmac_db.techsoft_employees;

-- TASK 6.1:The employees with the following employee IDs from TechHyve and TechCloud have resigned: TH0003, TH0005, TC0001, and TC0004. Delete the data of these employees from the original table and retain it in the backup database
USE techmac_db;
DELETE FROM techhyve_employees WHERE employeeid ='TH0003';
DELETE FROM techhyve_employees WHERE employeeid='TH0005';
SELECT * FROM techhyve_employees;
DELETE FROM techcloud_employees WHERE employeeid ='TC0001';
DELETE FROM techcloud_employees WHERE employeeid='TC0004';
SELECT * FROM techcloud_employees;

-- TASK 7:Merge the data of these two start-ups in a new table called fechhyvecloud_employees. Then, delete the records from the tables techhyve_employees and techcloud employees and retain them in the backup database
CREATE TABLE techhyvecloud_employees LIKE techcloud_employees;
INSERT techhyvecloud_employees SELECT * FROM techhyve_employees;
INSERT techhyvecloud_employees SELECT * FROM techcloud_employees;
SELECT * FROM techhyvecloud_employees;
TRUNCATE TABLE techhyve_employees;
TRUNCATE TABLE techcloud_employees;
SELECT * FROM techcloud_employees;
SELECT * FROM techhyve_employees;


