-- PART-1

create database company_management;
use company_management;

-- PART-2
create table departments(dept_id int PRIMARY KEY,dept_name varchar(50) unique,location varchar(50) default 'Hyderabad');
desc departments;

-- PART-3
create table employees(emp_id int PRIMARY KEY,emp_name varchar(50) not null,email varchar(100) unique,
						age int check(age>=18),salary decimal(10,2),city varchar(50) default 'Hyderabad',
                        dept_id int ,joining_date date);
alter table employees add column dept varchar(20);
desc employees;
alter table employees drop column dept_id;
-- PART-4

insert into employees values(101,'John','John@gmail.com',30,40000.00,'Banglore','2024-10-29','IT');

insert into employees values
(102,'Joe','Joe@gmail.com',25,25000.00,'Chennai','2025-02-10','HR'),
(103,'Amit','Amit@gmail.com',28,40000.00,'Hyderabad','2022-10-10','Finance');

INSERT INTO employees VALUES
(104,'Rahul Sharma','rahul@gmail.com',25,45000,'Banglore','2022-01-15','IT'),
(105,'Priya Reddy','priya@gmail.com',28,52000,'Hyderabad','2021-06-20','HR'),
(106,'Ankeit Verma','ankeit@gmail.com',30,60000,'Mumbai','2020-09-10','Finance'),
(107,'Sneha Patel','sneha@gmail.com',24,40000,'Pune','2023-03-12','Marketing'),
(108,'Kiran Kumar','kiran@gmail.com',29,55000,'Chennai','2021-11-18','Operations'),
(109,'Anjali Gupta','anjali@gmail.com',27,48000,'Banglore','2022-07-25','IT'),
(110,'Vikram Singh','vikram@gmail.com',35,75000,'Mumbai','2019-05-30','Finance'),
(111,'Meena Rao','meena@gmail.com',26,42000,'Hyderabad','2023-01-05','HR'),
(112,'Arjun Nair','arjun@gmail.com',31,68000,'Chennai','2020-12-14','Operations'),
(113,'Pooja Shah','pooja@gmail.com',23,39000,'Pune','2024-02-20','Marketing'),
(114,'Ravi Teja','ravi@gmail.com',32,70000,'Banglore','2018-08-09','IT'),
(115,'Neha Jain',NULL,29,51000,'Mumbai','2021-04-16','HR'),
(116,'Suresh Babu','suresh@gmail.com',34,72000,'Hyderabad','2019-10-22','Finance'),
(117,'Divya Menon','divya@gmail.com',27,NULL,'Chennai','2022-05-11','Marketing'),
(118,'Manoj Yadav','manoj@gmail.com',36,80000,'Pune','2017-07-19','Operations'),
(119,'Keerthi Das','keerthi@gmail.com',25,46000,'Banglore','2023-09-08','IT'),
(120,'Harish Kumar',NULL,28,53000,'Mumbai','2022-12-01','Operations');

insert into employees values
(121,'krishna','krishna@gmail.com',40,44000.00,'Hyderabad','2024-01-13','HR');

insert into employees values
(122,'uday','uday@gmail.com',41,83000.00,'Mumbai','2023-01-13','Finance');

-- PART-5
select * from employees;
select emp_name,salary from employees;
select * from employees where city='Hyderabad';
select * from employees where salary>50000;
select * from employees where dept='IT';
select * from employees where city='Hyderabad' and salary>50000;
select * from employees where dept='HR' or dept='Finance';
select * from employees where not city ='Banglore';

-- PART-6
select * from employees where emp_name like 'A%';
select * from employees where emp_name like '%A';
select * from employees where city in('Hyderabad','Banglore','Chennai');
select * from employees where salary between 40000 and 70000;

-- PART-7
select * from employees order by salary;
select * from employees order by salary desc;
select * from employees order by city,salary;

-- PART_8
select count(*) from employees;
select sum(salary) as total_salary from employees;
select sum(salary)/count(*) as average_salary from employees;
select max(salary) as highest_salary from employees;
select min(salary) as lowest_salary from employees;

-- PART_9
select dept,count(*) as total_employee from employees group by dept;
select dept,sum(salary)/count(*) as average_salary from employees group by dept;
 select dept,max(salary) as maximum_salary from employees group by dept;
select city,sum(salary) as total_salary from employees group by city;

-- PART-10
select dept,count(*) as total_employee from employees group by dept having count(*)>3;
select dept,sum(salary)/count(*) as average_salary from employees group by dept having sum(salary)/count(*)>50000;
select city,count(*) as total_employee from employees group by city having count(*)>2;

-- PART-11
create index emp_name_index on employees(emp_name);
create unique index email_index on employees(email);
show indexes from employees;

-- PART_12

create user 'hr1_user'@'localhost' identified by 'hr@user';
grant select,update on company_management.employees to 'hr1_user'@'localhost';

create user 'viewer_user'@'localhost' identified by 'view@user';
grant select on company_management.employees to 'viewer_user'@'localhost';
show grants for 'hr1_user'@'localhost';
show grants for 'viewer_user'@'localhost';


-- bonus challenge

select dept,sum(salary) as total_salary from employees group by dept having sum(salary)>200000;












