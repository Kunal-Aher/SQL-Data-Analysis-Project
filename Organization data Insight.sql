create database dac_dbt;
use dac_dbt;

create table dept
(deptcode varchar(15),
dept_name varchar(60),
budget integer);

alter table dept rename column deptcodac to deptcode;
select * from dept;


create table grade
(gradecode varchar(15),
gradelevel varchar(30),
gradedescription varchar(60),
basic integer);

select * from grade;
alter table grade add column deptcode varchar(15);
create table desig
(desigcode varchar(15),
designame varchar(15));
select * from grade;

create table emp
(empcode varchar(15),
empname varchar(60),
deptcode varchar(15),
birthdate date not null,
joindate date not null,
sex char(1) check (sex in ('M','F','T')),
desigcode varchar(15),
supcode varchar(15),
gradecode varchar(15),
gradelevel varchar(30),
basicpay integer);

create table salary(
empcode varchar(15),
salmonth date not null,
basic int,
allow int,
deduct int
);

create table history(
empcode varchar(15),
changedate date not null,
desigcode varchar(15),
gradecode varchar(15),
gradelevel varchar(30),
basicpay int
);


select * from history;

select * from dept,emp,salary,history;

select * from desig;

alter table design rename desig;


alter table dept add primary key(deptcode);
alter table desig add primary key(desigcode);
alter table emp add primary key(empcode);
alter table salary add primary key(empcode,salmonth);
alter table history add primary key(empcode,changedate,desigcode,gradecode,gradelevel);
alter table grade add primary key(gradecode,gradelevel);
describe history;

describe dept;
describe desig;
describe emp;
describe salary;
describe history;
describe grade;

alter table emp add foreign key(deptcode) references dept(deptcode);
alter table emp add foreign key(desigcode) references desig(desigcode);
alter table emp add foreign key(supcode) references emp(empcode);
alter table emp add foreign key(gradecode,gradelevel) references grade(gradecode,gradelevel);
alter table history add foreign key(empcode) references emp(empcode);
alter table history add foreign key(desigcode) references desig(desigcode);
alter table history add foreign key(gradecode, gradelevel) references grade(gradecode,gradelevel);
alter table salary add foreign key(empcode) references emp(empcode);

-- INSERT INTO dept (deptcode,dept_name,budget) VALUES ('ACCT', 'Accounts', 19),
-- ('PRCH', 'Purchase', 25),
-- ('SALE', 'Sales', 39),
-- ('STOR', 'Stores', 33),
-- ('FACL', 'Facilities', 42),
-- ('PERS', 'Personal', 12)

Alter table grade drop column deptcode;
-- INSERT INTO grade (gradecode,gradelevel,gradedescription,basic) VALUES
-- ('GC1', 'GL1', 'GC-GL-1', 25000),
-- ('GC4', 'GL1', 'GC-4-GL-1', 21000),
-- ('GC4', 'GL4', 'GC-4-GL-4', 15000),
-- ('GC6', 'GL1', 'GC-6-GL-1', 13000),
-- ('GC6', 'GL2', 'GC-6-GL-2', 11000),
-- ('GC12', 'GL1', 'GC-12-GL-1', 9000),
-- ('GC12', 'GL2', 'GC-12-GL-2', 8500),
-- ('GC12', 'GL3', 'GC-12-GL-3', 8000),
-- ('GC15', 'GL1', 'GC-15-GL-1', 7000),
-- ('GC15', 'GL2', 'GC-15-GL-2', 6500),
-- ('GC15', 'GL3', 'GC-15-GL-3', 6000),
-- ('GC20', 'GL1', 'GC-20-GL-1', 3500),
-- ('GC20', 'GL2', 'GC-20-GL-2', 3000),
-- ('GC20', 'GL3', 'GC-20-GL-3', 2500),
-- ('GC20', 'GL4', 'GC-20-GL-4', 2000)


-- select * from grade;

-- insert into desig (desigcode,designame) values 
-- ('CLRK', 'Clerk'),
-- ('SLMN', 'Sales Man'),
-- ('MNGR', 'Manager'),
-- ('SPRV', 'Supervisor'),
-- ('PRES', 'Personal');

select * from desig;

select * from emp;
insert into emp(empcode,empname,deptcode,birthdate,joindate,sex,desigcode,supcode,gradecode,gradelevel,basicpay) values 
('7839', 'Reddy', 'ACCT', '1959-12-12', '1981-07-17', 'M','PRES', null, 'GC1', 'GL1', 32000),
('7566', 'Jain', 'PRCH', '1955-01-24', '1981-04-02', 'F', 'MNGR', '7839', 'GC6', 'GL2',12400),
('7698', 'Murthy', 'SALE', '1960-09-16', '1981-05-01', 'F', 'MNGR', '7839', 'GC6', 'GL1',14700),
('7782', 'Menon', 'ACCT', '1967-08-30', '1981-06-09','M', 'MNGR', '7839', 'GC6', 'GL2',12400),
('7902', 'Naik', 'PRCH', '1958-02-20', '1981-12-03', 'M', 'MNGR', '7839', 'GC6', 'GL2',11800),
('7654', 'Gupta', 'SALE', '1957-01-22', '1981-09-28', 'M', 'SLMN', '7698', 'GC6', 'GL2',12600),
('7521', 'Wilson', 'STOR', '1956-03-18', '1981-02-22', 'M', 'MNGR', '7698', 'GC6', 'GL2',12200),
('7844', 'Singh', 'SALE', '1956-09-09', '1981-09-08', 'F', 'SLMN', '7698', 'GC6', 'GL1', 14300),
('7900', 'Shroff', 'SALE', '1956-06-28', '1981-12-03', 'M', 'CLRK', '7698', 'GC6', 'GL2',12000),
('7788', 'Khan', 'PRCH', '1957-02-03', '1982-12-09', 'M', 'SPRV', '7566', 'GC6', 'GL2', 11900),
('7499', 'Roy', 'SALE', '1957-09-27', '1981-02-20', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7934', 'Kaul', 'ACCT', '1957-05-02', '1982-01-23', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11950),
('7369', 'Shah', 'PRCH', '1960-05-25','1983-12-17', 'M', 'CLRK', '7902', 'GC6', 'GL2',12200),
('7876', 'Patil', 'PRCH', '1965-09-02', '1990-12-17', 'M', 'CLRK', '7788', 'GC6', 'GL2', 12300),
('7999', 'Sinha', 'SALE', '1970-04-11', '1992-02-20', 'M', 'SLMN', '7782', 'GC6', 'GL1',14600),
('7939', 'Rai', 'PRCH', '1988-08-10', '2012-12-06', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11800),
('7192', 'John', 'ACCT', '1968-11-05', '1994-12-03', 'M', 'CLRK', '7902', 'GC6', 'GL2',12300),
('9902', 'Ahmad', 'SALE', '1970-02-16', '1992-04-17', 'M', 'SLMN', '7698', 'GC6', 'GL1',14200),
('7802', 'Sanghvi','STOR', '1980-05-06', '1993-01-01', 'M', 'MNGR', '7566', 'GC6', 'GL2',12400),
('6569', 'Tiwari', 'STOR', '1989-08-19', '2010-08-21', 'M', 'MNGR', '7782', 'GC6', 'GL2',12400);


insert into salary(empcode,salmonth,basic,allow,deduct) 
values
('7839','2011-12-01', 30000, 3000, 1200),
('7839', '2012-01-01', 32000, 3200, 1250),
('7839', '2012-02-01', 32000, 3200, 1250),
('7566', '2011-12-01', 12000, 600, 400),
('7566', '2012-01-01', 12400, 1240, 550),
('7566', '2012-02-01', 12400, 1240, 550),
('7698', '2011-12-01', 13900, 800, 500),
('7698', '2012-01-01', 14700, 1470, 650),
('7698', '2012-02-01', 14700, 1470, 650),
('7782', '2011-12-01', 11800, 600, 500),
('7782', '2012-01-01', 12400, 1240, 550),
('7782', '2012-02-01', 12400, 1240, 550),
('7902', '2011-12-01', 11200, 600, 450),
('7902', '2012-01-01', 11800, 1180, 550),
('7902', '2012-02-01', 11800, 1180, 550),
('7654', '2011-12-01', 11900, 700, 500),
('7654', '2012-01-01', 12600, 1260, 550),
('7654', '2012-02-01', 12600, 1260, 550),
('7521', '2011-12-01', 11400, 800, 500),
('7521', '2012-01-01', 12200, 1220, 550),
('7521', '2012-02-01', 12200, 1220, 550),
('7844', '2011-12-01', 13400, 900, 600),
('7844', '2012-01-01', 14300, 1430, 650),
('7844', '2012-02-01', 14300, 1430, 650),
('7900', '2011-12-01', 11500, 500, 300),
('7900', '2012-01-01', 12000, 1200, 550),
('7900', '2012-02-01', 12000, 1200, 550),
('7788', '2011-12-01', 11300, 600, 450),
('7788', '2012-01-01', 11900, 1190, 550),
('7788', '2012-02-01', 11900, 1190, 550),
('7499', '2011-12-01', 13400, 800, 550),
('7499', '2012-01-01', 14200, 1420, 650),
('7499', '2012-02-01', 14200, 1420, 650),
('7934', '2011-12-01', 11450, 500, 250),
('7934', '2012-01-01', 11950, 1195, 550),
('7934', '2012-02-01', 11950, 1195, 550),
('7369', '2011-12-01', 11600, 600, 450),
('7369', '2012-01-01', 12200, 1220, 550),
('7369', '2012-02-01', 12200, 1220, 550),
('7876', '2011-12-01', 11700, 600, 500),
('7876', '2012-01-01', 12300, 1230, 550),
('7876', '2012-02-01', 12300, 1230, 550),
('7999', '2011-12-01', 13950, 650, 600),
('7999', '2012-01-01', 14600, 1460, 650),
('7999', '2012-02-01', 14600, 1460, 650),
('7939', '2011-12-01', 11100, 700, 400),
('7939', '2012-01-01', 11800, 1180, 550),
('7939', '2012-02-01', 11800, 1180, 550),
('7192', '2011-12-01', 11700, 600, 500),
('7192', '2012-01-01', 12300, 1230, 550),
('7192', '2012-02-01', 12300, 1230, 550),
('9902', '2011-12-01', 13400, 800, 500),
('9902', '2012-01-01', 14200, 1420, 650),
('9902', '2012-02-01', 14200, 1420, 650),
('7802', '2011-12-01', 11900, 500, 300),
('7802', '2012-01-01', 12400, 1240, 550),
('7802', '2012-02-01', 12400, 1240, 550),
('6569', '2011-12-01', 11800, 600, 400),
('6569', '2012-01-01', 12400, 1240, 550);

select * from salary;

select * from history;
insert into history
(empcode,changedate,desigcode,gradecode,gradelevel,basicpay) values ( '7839','1981-09-17', 'CLRK', 'GC15','GL1', 7000),
( '7839', '1985-12-31', 'SLMN', 'GC12','GL3', 8000),
( '7839', '1988-12-31', 'SPRV', 'GC12','GL2', 8500),
( '7839', '1990-12-31', 'MNGR', 'GC12','GL1', 9000),
( '7839', '1994-12-31', 'CLRK', 'GC6', 'GL2', 11000),
( '7839', '1998-12-31', 'SLMN', 'GC6', 'GL1', 13000),
( '7839', '2001-12-31', 'SPRV', 'GC4', 'GL4', 15000),
( '7839', '2006-12-31', 'MNGR', 'GC4', 'GL1', 21000),
( '7839', '2011-12-31', 'PRES', 'GC1', 'GL1', 25000),
( '7566', '1981-04-02', 'CLRK', 'GC12','GL3', 8000),
( '7566', '1991-12-31', 'SLMN', 'GC12','GL2', 8500),
( '7566', '2001-12-31', 'SPRV', 'GC12','GL1', 9000),
( '7566', '2011-12-31', 'MNGR', 'GC6', 'GL2', 11000),
( '7698', '1981-05-01', 'CLRK', 'GC12','GL3', 8000),
( '7698', '1991-05-01', 'SLMN', 'GC12','GL2', 8500),
( '7698', '2001-05-01', 'MNGR', 'GC12','GL1', 9000),
( '7698', '2006-05-01', 'SPRV', 'GC6', 'GL2', 11000),
( '7698', '2011-05-01', 'MNGR', 'GC6', 'GL1', 13000),
( '7782', '1981-06-09', 'CLRK', 'GC12','GL3', 8000),
( '7782', '1991-06-09', 'SLMN', 'GC12','GL2', 8500),
( '7782', '2001-06-09', 'SPRV', 'GC12','GL1', 9000),
( '7782', '2011-06-09', 'MNGR', 'GC6', 'GL2', 11000),
( '7902', '1981-12-03', 'CLRK', 'GC12','GL3', 8000),
( '7902', '1991-12-03', 'SLMN', 'GC12','GL2', 8500),
( '7902', '2001-12-03', 'SPRV', 'GC12','GL1', 9000),
( '7902', '2011-12-03', 'MNGR', 'GC6', 'GL2', 11000),
( '7654', '1981-09-28', 'SLMN', 'GC12','GL3', 8000),
( '7654', '1991-09-28', 'SLMN', 'GC12','GL2', 8500),
( '7654', '2001-09-28', 'SLMN', 'GC12','GL1', 9000),
( '7654', '2011-09-28', 'SLMN', 'GC6', 'GL2', 11000),
( '7521', '1981-02-22', 'CLRK', 'GC12','GL3', 8000),
( '7521', '1991-02-22', 'SLMN', 'GC12','GL2', 8500),
( '7521', '2001-02-22', 'SPRV', 'GC12','GL1', 9000),
( '7521', '2011-02-22', 'MNGR', 'GC6', 'GL2', 11000),
( '7844', '1981-09-08', 'SLMN', 'GC12','GL3', 8000),
( '7844', '1991-09-08', 'SLMN', 'GC12','GL2', 8500),
( '7844', '2001-09-08', 'SLMN', 'GC12','GL1', 9000),
( '7844', '2006-09-08', 'SLMN', 'GC6', 'GL2', 11000),
( '7844', '2011-09-08', 'SLMN', 'GC6', 'GL1', 13000),
( '7900', '1981-12-03', 'SLMN', 'GC12','GL3', 8000),
( '7900', '1991-12-03', 'SLMN', 'GC12','GL2', 8500),
( '7900', '2001-12-03', 'CLRK', 'GC12','GL1', 9000),
( '7900', '2011-12-03', 'CLRK', 'GC6', 'GL2', 11000),
( '7788', '1982-12-09', 'SLMN', 'GC12','GL3', 8000),
( '7788', '1992-12-09', 'CLRK', 'GC12','GL2', 8500),
( '7788', '2002-12-09', 'MNGR', 'GC12','GL1', 9000),
( '7788', '2012-12-09', 'SPRV', 'GC6', 'GL2', 11000),
( '7499', '1981-02-20', 'SLMN', 'GC12','GL3', 8000),
( '7499', '1991-02-20', 'SLMN', 'GC12','GL2', 8500),
( '7499', '2001-02-20', 'SLMN', 'GC12','GL1', 9000),
( '7499', '2006-02-20', 'SLMN', 'GC6', 'GL2', 11000),
( '7499', '2011-02-20', 'SLMN', 'GC6', 'GL1', 13000),
( '7934', '1982-01-23', 'SLMN', 'GC12','GL3', 8000),
( '7934', '1992-01-23', 'SLMN', 'GC12','GL2', 8500),
( '7934', '2002-01-23', 'CLRK', 'GC12','GL1', 9000),
( '7934', '2012-01-23', 'CLRK', 'GC6', 'GL2', 11000),
( '7369', '1983-12-17', 'SLMN', 'GC12','GL3', 8000),
( '7369', '1993-12-17', 'SLMN', 'GC12','GL2', 8500),
( '7369', '2003-12-17', 'CLRK', 'GC12','GL1', 9000),
( '7369', '2006-12-17', 'CLRK', 'GC6', 'GL2', 11000);


select * from dept;
select * from desig;
select * from emp;
select * from salary;
select * from history;
select * from grade;

-- Section 2
-- 1. List the name, employee code and designation of each employee of the office

select emp.empcode,emp.empname,desig.desigcode,desig.designame from 
emp join desig ON emp.desigcode = desig.desigcode;


select empcode,empname,desigcode from emp;
-- 2. List all the departments and the budgets
select dept_name,budget from dept order by budget;
-- 3. List the employees and their respective department names
select e.empcode,e.empname,d.deptcode,d.dept_name 
from emp e join dept d ON e.deptcode = d.deptcode;
-- 4. List the employees who are not having any superior to work under
select empcode,empname from emp where supcode is null;
-- 5. List the employees who are working directly under superior most employee of the
-- office. (Assume the superior most employee is the employee who does not have a
-- supervisor)
select * from emp where desigcode <>'SPRV';
select empcode,empname from emp where desigcode is NULL;




-- 6. List the employee(s) who is senior most in the office
select * from emp where joindate =(select min(joindate) from emp);

-- 7. List the employees who will retire from the office next.
select empname,timestampdiff(year,birthdate,curdate()) as age from emp having age > 55 order by age; 

-- 8. List the departments with the respective department managers
select d.deptcode,d.dept_name,e.empname as Manager_name ,e.desigcode
from dept d join emp e on d.deptcode = e.deptcode where e.desigcode = 'MNGR';


-- 9. List the employees who work as ‘manager’ to at least one department.

SELECT e.empcode, e.empname, d.deptcode,de.designame
FROM emp e
JOIN dept d join desig de ON e.deptcode = d.deptcode and e.desigcode = de.desigcode 
where e.desigcode='MNGR';


-- 10. List the number of employees working for either ‘accounts’ or ‘personal’ or
-- ‘purchase’ departments
select empcode,empname,deptcode 
from emp where deptcode = "acct" or deptcode= "PERS"or deptcode ="PRCH"  ;




-- or
-- SELECT empcode, empname, deptcode 
-- (select count(empcode) from emp where deptcode IN ('acct', 'PERS', 'PRCH') ) as total_count
-- FROM emp 
-- WHERE deptcode IN ('acct', 'PERS', 'PRCH') group by empcode order by empname ;


-- 11. List the employees working for ‘accounts’ or ‘personal’ department
select e.empcode,e.empname,d.deptcode,d.dept_name
from emp e join dept d on  e.deptcode = d.deptcode where dept_name IN ('accounts'or'personal');

-- 12. List the employees working for ‘accounts’ and ‘personal’ department
select e.empcode,e.empname,d.deptcode,d.dept_name 
from emp e join dept d on e.deptcode = e.deptcode where dept_name IN ('accounts'AND'personal') order by dept_name ;
-- 13. List the employees working for ‘accounts’ but not for ‘personal’ department
select e.empcode,e.empname,d.deptcode,d.dept_name
from emp e join dept d on e.deptcode = e.deptcode where dept_name='accounts'and dept_name <> 'personal';
-- 14. List the youngest employee of the office
select empname, timestampdiff(year,birthdate,curdate()) as age from emp having age <= 40;

-- 15. List the employees who are drawing basic pay not equal to 12400.
select empcode,empname,basicpay from emp where basicpay <> 12400;
-- 16. List the employees who are drawing basic salary between 11000 and 12000.
select empcode,empname,basicpay from emp where basicpay between 11000 AND 12000 ;



-- 17. List the employees who are drawing basic salary not between 11000 and 12000
select empcode,empname,basicpay from emp where basicpay not between 11000 AND 12000 ;
-- 18. List the employees who got salary allowance between Rs.1000 to Rs.1500 in the month of January 2012.

select e.empcode,e.empname,s.allow,s.salmonth 
from emp e join salary s on e.empcode = s.empcode 
where s.allow between 1000 and 1500 And s.salmonth > 2012-01-01; 

-- 19. List the employees whose name ends with ‘i’ or ‘y’.

select empcode,empname from emp where empname like "%i" or"%y";

-- 20. List the employees who have atleast 25 years of experience
select empcode,empname,timestampdiff(year,joindate,curdate()) as experience from emp having experience > 25 order by experience ; 
-- 21. List the ‘Salesmen’ who have minimum 30 to 20 years of experience
select e.empcode,e.empname,d.designame,d.desigcode,timestampdiff(year,joindate,curdate()) as experience 
from emp e join desig d on e.desigcode=d.desigcode Having designame='salesman' AND experience between 20 and 30;
-- 22. List the basic salary and half of the basic salary for each employee.
select e.empcode,e.empname,s.basic,s.basic/2 as basic2 from emp e join salary s on e.empcode=s.empcode ;

-- 23. List the employees and the latest take-home-pay of each employee. (Hint: Take-home-pay = basic + allowance - deductions)
select e.empcode,e.empname,s.basic + s.allow - s.deduct as Take_home_pay 
from emp e join salary s on e.empcode=s.empcode order by Take_home_pay ASC;
-- 24. List the employees and the latest take-home-pay of each employee of ‘Accounts’
-- department.
select e.empcode,e.empname,s.basic + s.allow - s.deduct as Take_home_pay,d.dept_name,d.deptcode
from emp e join salary s join dept d on e.empcode=s.empcode 
and e.deptcode=d.deptcode having dept_name ='Accounts' order by Take_home_pay ASC ;

-- 25. List employees and their respective ages.
select empcode,empname,timestampdiff(year,birthdate,curdate()) as age from emp ;
-- and  
select count(*) from (select empcode,empname,timestampdiff(year,birthdate,curdate()) as age from emp) as Total_count;

-- 26. List all the ‘Accounts’ department employees, first ordered by their age and then by their names.
Select e.empcode,e.empname, timestampdiff(year,birthdate,curdate()) as age,d.deptcode,d.dept_name 
from emp e join dept d on e.deptcode=d.deptcode having d.dept_name='Accounts' order by empname and age ;
-- 27. List the number of employees directly reporting to ‘Reddy’
select count(*) as Reddy_Supervision from emp where supcode =(select empcode from emp where empname='Reddy');
-- 28. List the employees who have atleast one person working under him/her and the number of their subordinates. List the employee with highest number of subordinates first, next the person with next highest number of subordinates andso on.
select A.empname as manager,count(B.empcode) as Count_of_Subordinates 
from emp A join emp B on A.empcode=B.supcode 
group by A.empname having count(B.empcode)>0 order by Count_of_Subordinates DESC ;


-- 29. List the employees who have minimum 3 employees working under him/her.
select A.empcode as Manager_code, A.empname as manager,count(B.empcode) as Count_of_employee 
from emp A join emp B on A.empcode=B.supcode 
group by A.empcode having count(B.empcode)>3 ;

-- 30. List the minimum and maximum salaries drawn in each grade code.
select e.empcode,a.gradecode,
	min(s.basic + s.allow - s.deduct) as Min_Salary,
	max(s.basic + s.allow - s.deduct) as Max_Salary 
from grade a 
join emp e 
join salary s 
on a.gradecode =e.gradecode and e.empcode = s.empcode 
GROUP BY e.empcode, a.gradecode 
order by a.gradecode DESC;



-- 31. List the employees with names of their supervisors (Hint: Use Join).

select x.supcode,x.empname as Supervisor,e.empcode,e.empname as emp  
from emp e join emp x on  e.supcode = x.empcode order by supcode,Supervisor;

-- 32. List the number of officers reporting to each supervisor having more than 3people working under them
select x.supcode,x.empname 
as Supervisor,count(e.empcode) 
as No_Of_Officer
from emp e 
join emp x 
on x.empcode =  e.supcode  
group by x.supcode ,x.empname
having count(e.empcode) > 3 order by supcode;


-- 33. List the employees who have not got any promotion till now.

select e.empcode,e.empname ,g.gradecode,g.gradelevel,e.basicpay 
from emp e 
join grade g 
on e.gradelevel = g.gradelevel having g.gradelevel  > 'GL';  
-- 34. List the employee with maximum number of promotions. Also list the number ofpromotions that he/she got.
select e.empcode,e.empname,e.supcode ,count(g.gradecode) as Promotion_count,g.gradelevel,e.basicpay 
from emp e 
join grade g 
on e.gradelevel = g.gradelevel group by e.empcode,e.empname having count(g.gradecode) order by basicpay Desc,Promotion_count; 
-- 35. List the employees who got promoted in the year 1991.
select e.empcode,e.empname,h.changedate as Promoted
from emp e inner join history h on e.empcode=h.empcode having Promoted between '1991-01-01'AND  '1991-12-31' ;

-- delimiter //
-- drop procedure ALL_Command//
-- create procedure ALL_Command()
-- begin
select * from dept;
select * from desig;
select * from emp;
select * from salary;
select * from history;
select * from grade;
-- end//
-- call ALL_Command();

-- 36. List the department budget and the total salary drawn (by the employees of this department).
Select e.empcode,e.empname,d.deptcode,d.dept_name,d.budget,sum(s.basic + s.allow - s.deduct) 
as Drawn_salary 
from emp e join salary s join  dept d on d.deptcode = e.deptcode and e.empcode=s.empcode group by e.empcode,e.empname order by budget,Drawn_salary ;
-- 37. Display the employee names in full uppercase.
select upper(empname) as Employee_Name from emp;
-- 38. List all the employees drawing salary higher than the salary drawn by ‘Jain’

Select e.empcode,e.empname,d.deptcode,d.dept_name,d.budget,sum(s.basic + s.allow - s.deduct) 
as Drawn_salary 
from emp e 
join salary s 
join  dept d 
on d.deptcode = e.deptcode and e.empcode=s.empcode 
group by e.empcode,e.empname  having sum(s.basic + s.allow - s.deduct)  > 
(select sum(s2.basic + s2.allow - s2.deduct) 
	as High_Salary 
    from emp e2 
    join salary s2 
    on e2.empcode=s2.empcode 
    where e2.empname='jain') order by d.budget,Drawn_salary ;




-- 39. List all the employees who have higher salary than all the employees who draw salary in the range of 11000 to 12000.
select e.empcode,e.empname ,s.basic + s.allow - s.deduct as Drawn_salary 
from emp e 
join salary s on e.empcode = s.empcode 
-- group by e.empcode,e.empname 
having Drawn_salary not between 11000 and 12000 order by Drawn_salary;


-- 40. List all the employees who have greater than average pay. Display the result in the increasing order of the salary.
select e.empcode,e.empname,
(s.basic + s.allow - s.deduct) 
as morethenavg_pay from emp e 
join salary s 
on e.empcode=s.empcode 
-- group by e.empcode,e.empname
having morethenavg_pay > (select avg(s.basic + s.allow - s.deduct) from salary s ) order by morethenavg_pay ASC; 


select avg(s.basic + s.allow - s.deduct) from salary s;

-- 41. List the employees who draws highest salary
select e.empcode, e.empname,max(s.basic + s.allow - s.deduct) as highest_salary 
from emp e 
join salary s on e.empcode=s.empcode group by e.empcode, e.empname order by highest_salary Desc limit 2;
-- or
SELECT e.empcode,e.empname,(s.basic + s.allow - s.deduct) as highest_salary 
from emp e 
join salary s on e.empcode=s.empcode 
having highest_salary =(select max(s.basic + s.allow - s.deduct) from salary s )  limit 1;




-- 42. List all the employees other than the employees who draw highest salary-------------------
select e.empcode,e.empname,s.basic + s.allow - s.deduct as Hightest_salary 
from emp e join salary s on e.empcode=s.empcode 
group by e.empcode,e.empname ,s.basic , s.allow , s.deduct
having Hightest_salary <> (select max(s2.basic + s2.allow - s2.deduct) from salary s2);

SELECT e.empcode, e.empname, (s.basic + s.allow - s.deduct) AS Highest_salary
FROM emp e
JOIN salary s ON e.empcode = s.empcode
GROUP BY e.empcode, e.empname, s.basic, s.allow, s.deduct
HAVING Highest_salary <> (
    SELECT MAX(s2.basic + s2.allow - s2.deduct)
    FROM salary s2
);


-- 43. List the employees who draw highest salary in each department
select e.empcode,e.empname,
	d.dept_name,
	max(s.basic + s.allow + s.deduct) as Highest_salary_asper_dept
from emp e 
join dept d 
join salary s on e.deptcode=d.deptcode and e.empcode =s.empcode group by e.empcode,e.empname;
-- 44. List the employee(s) getting second highest salary
select e.empcode,e.empname ,max(s.basic + s.allow + s.deduct) as salaries 
from emp e 
join salary s ON e.empcode = s.empcode
group by e.empcode,e.empname 
having salaries < (select max(s.basic + s.allow + s.deduct) from salary s) limit 2;



-- 45.List the employee(s) who are getting fifth highest salary.
select e.empcode,e.empname ,max(s.basic + s.allow - s.deduct) as salaries 
from emp e 
join salary s ON e.empcode = s.empcode
group by e.empcode,e.empname 
having salaries < (select max(s.basic + s.allow - s.deduct) 
							from salary s)  
                            order by e.empcode,e.empname ,salaries desc limit 1 offset 4;





select s.empcode, max(s.basic + s.allow - s.deduct) as news from salary s group by s.empcode order by news Desc;

-- 46. List the female employee who draws the highest salary higher than any other female employee
select s.empcode,e.empname,e.sex, max(s.basic + s.allow - s.deduct) 
as F_salary 
from emp e 
join salary s 
on e.empcode=s.empcode group by s.empcode having sex = 'F' order by F_salary Desc;

select * from emp where sex = 'F'; 
-- 47. List the department name of the female employee who draws the highest salary higher than any other female employee
select d.deptcode,d.dept_name,e.empname,e.sex,s.empcode,max(s.basic + s.allow - s.deduct) as F_salary2 
from dept d join  emp e join salary s on d.deptcode = e.deptcode and e.empcode=s.empcode group by e.empname,s.empcode having sex='F';
-- 48. List the department manager of the department, in which the female employee who draws the highest salary higher than any other female employee works in

select e.empcode,e.empname,e.desigcode,
e.basicpay as Salary,d.dept_name,e.sex from emp e join dept d on e.deptcode = d.deptcode 
group by e.empcode,e.empname having e.sex ='F' and Salary > (select max(basicpay) from emp where sex='F') order by Salary DESC ;




-- 49. List all male employees who draw salary greater than atleast on female employee
select * 
from emp
where sex = 'M' and basicpay  >(select min(basicpay) from emp where sex = 'F');





-- 50. List the departments in which average salary of employees is more than average salary of the company

select d.deptcode,d.dept_name,e.empcode,e.empname,
avg(e.basicpay) as Avg_salary
from emp e 
join dept d 
on e.deptcode=d.deptcode group by d.deptcode,d.dept_name,e.empcode,e.empname having Avg_salary > (select avg(basicpay) from emp);

select avg(basicpay) from emp;
-- 51. List the employees drawing salary lesser than the average salary of employees working for ‘accounts’ department
select e.empcode,e.empname,d.deptcode,d.dept_name,e.basicpay from emp e join dept d on e.deptcode = d.deptcode group by e.empcode,e.empname having min(basicpay) < (select avg(basicpay) from emp);

use dac_dbt;
-- Section -3
-- Views Practice questions:
-- 1. Write a view to compute the employee age of the organization
create or replace view EMP_Ages as
select empname,timestampdiff(year,birthdate,curdate()) as EMP_AGE from emp order by EMP_AGE asc ;

select * from EMP_Ages;

-- 2. Write a view to compute the employee experience with the organization
create view EMP_Experince as
select empname,timestampdiff(year,joindate,curdate()) as EMP_Experince from emp order by EMP_Experince asc ;

select * from EMP_Experince;
-- 3. Write a view that computes the employee pay for the current month for all the employees. Hint: Compute the employee pay as the Basic+Allowance-Deduction
create view Current_Emp_Salary as
select e.empcode,e.empname,max(joindate) as current_d,max(basic+allow-deduct) as employee_pay 
from emp e join salary s on e.empcode = s.empcode group by e.empcode,e.empname order by current_d desc;


select * from Current_Emp_Salary;
-- 4. List the employees who are older than their supervisors. Hint: Use views to implement employee age
-- create or replace view Emp_Age as
select distinct(e.empcode),e.empname,e.desigcode ,w.EMP_AGE 
from EMP_Ages w join emp e on e.empname = w.empname 
where w.EMP_AGE > (select max(timestampdiff(year,e.joindate,curdate())) from emp where desigcode="SPRV") ;



select max(timestampdiff(year,e.birthdate,curdate())) from emp e;

select * from emp;
select * from Current_Emp_Salary;
select * from Emp_Age;
-- 5. Write a view to display the total number of employees in each department
create or replace view NO_of_Emp as 
select d.dept_name,count(e.empcode) as NO_of_emp_in_Dept
from dept d join emp e on d.deptcode=e.deptcode 
group by d.dept_name order by NO_of_emp_in_Dept Desc ;

select * from NO_of_Emp;
-- 6. Write a view to display the total number of employees in the organization
create or replace view Total_emp as
select count(e.empcode) as NO_of_emp_in_organization
from dept d join emp e on d.deptcode=e.deptcode;

select * from Total_emp;
-- 7. Use the views in Qn No 5 & Qn No 6, to display the percentage of employees ineach department
create or replace view percentage_of_employees as
select d.dept_name, (e.NO_of_emp_in_Dept*100 / t.NO_of_emp_in_organization ) as percentage_of_employee_in_each_department from dept d join Total_emp t join NO_of_Emp e on 1=1 and d.dept_name=e.dept_name ;

select * from percentage_of_employees;
