-- SQL Plus
-- 1. Create a table named 'employee_demo' for the 'scott' user

-- Set the format for the output of the SELECT statement.
set line 200 pages 1000

create table employees_demo
  (employee_id number(6),
  first_name varchar2(20),
  last_name varchar2(25),
  email varchar2(25)
  );

-- Confirm the creation of the 'employees_demo' table
desc employees_demo
select * from employees_demo;

/* 2. Insert data into the table
Insert test data into the empty employees_demo table */
insert into employees_demo values (101,'Nayeon','Kwon','kwon@gmail.com');

insert into employees_demo values (102,'Lay','Kim','kim@gmail.com');

insert into employees_demo values (103,'Wonyoung','Jang','jang@gmail.com');

insert into employees_demo values (104,'Jone','Lee','lee@gmail.com');

insert into employees_demo values (105,'Kongjoo','Kim','kong@gmail.com');

-- Verify 5 data records entered into the employees_demo table
select * from employees_demo;

-- Set the SQL*Plus screen output format
col first_name format a10
col last_name format a10
col email format a20

select * from employees_demo;

-- 3. Modify data stored in the table
update employees_demo set employee_id=99
  where first_name = 'Nayeon';

update employees_demo set email = 'kong@naver.com'
  where employee_id = 105;

-- Verify the modified records
select * from employees_demo;

select last_name, first_name from employees_demo;

-- 5. Delete data stored in the table
delete from employees_demo where employee_id=99;

delete from employees_demo where first_name = 'Kongjoo';

select * from employees_demo;

/* 6. rollback & commit
Undo the insert, update, and delete operations that were previously performed by executing the rollback command */
rollback;

-- Verify that data has been removed
select * from employees_demo;

-- Enter three test data records into the empty employees_demo table
insert into employees_demo values (101,'Nayeon','Kwon','kwon@gmail.com');

insert into employees_demo values (102,'Lay','Kim','kim@gmail.com');

insert into employees_demo values (103,'Wonyoung','Jang','jang@gmail.com');

-- Execute the commit command to complete the data insert operation previously performed
commit;

-- Verify the three data records entered into the employees_demo table
select * from employees_demo;

-- Delete the data record with id 101 from the stored data records in the table
delete from employees_demo where employee_id = 101;

-- Verify the deleted data record
select * from employees_demo;

-- Cancel the deletion of data with id 101 and recover the data
rollback;

-- Verify that the data with id 101 has been recovered after the rollback
select * from employees_demo;
