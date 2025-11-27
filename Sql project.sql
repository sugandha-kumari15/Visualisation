create database 11am;
use 11am;
select * from invoice;
select count(invoice_id)from invoice;
select sum(total) as sales from invoice;
select avg(total) as sales from invoice;
select max( total) as maxsales from invoice;
select min(total) as minsales from invoice;

-- total number of customer orders
select count(customer_id)from invoice;
select customer_id,count(customer_id) from invoice group by customer_id;
select customer_id,count(*) from invoice group by customer_id;

-- find the orders from each city
select billing_city,count(billing_city) as bill from invoice group by billing_city;

-- find  the sales by each customer_id
select customer_id,sum(total) from invoice group by customer_id;

-- find the max sales of each customer
select customer_id,max(total) from invoice group by customer_id;

-- find the min sales of each customer
select customer_id,min(total) from invoice group by customer_id;

-- find the avg Sales of each customer
select customer_id,avg(total) as average from invoice group by customer_id;

-- find the orders from each city where count of orders>10
select billing_city,count(*) as orders from invoice group by billing_city having orders>10;
select billing_state, count(billing_state) as orders from invoice group by billing_state having orders<20;


-- sort data
select * from invoice order by billing_city asc;
select * from invoice order by invoice_id desc;

-- find top 3 sales value
 select* from invoice order by total desc limit 3;
 select * from invoice order by total asc limit 5;
 
 -- find 2nd and 3rd highest sales values
 select * from invoice order by total desc limit 4,2;
 
 -- find top  and bottom 5 customer based on numbers of orders
 select customer_id,count(*)as orders from invoice group by customer_id order by orders asc limit 5;
 select customer_id,count(*) as orders from invoice group by customer_id order by orders desc limit 10;
 
 use 11am;
 show tables;
 select* from empdata;
 select * from department;
 -- joins
select id ,name ,e.deptid,deptname from empdata e inner join department d on e.deptid=d.deptid;
select id,name, e.deptid,deptname from empdata e left outer join department d on e. deptid=d.deptid;
select id,name, e.deptid, deptname from empdata e right outer join department d on e.deptid=d.deptid;
select id, name,e.deptid,deptname from empdata e cross join department d on e.deptid=d.deptid;
select id,name,e.deptid,deptname from empdata e  join department d on e.deptid=d.deptid;


create database 3pm;
use 3pm;
create table student (id int,name varchar(100), marks int, subject varchar(100));
select * from student;
insert into student( id, name,marks,subject)value(1,"sugandha",90,"science"),(2,"deepa" ,80,"maths"),(3,"sandeep",98,"sst"),(4,"khushi",90,"english"),(5,"niks",85,"maths");
select* from student;
alter table student  add column percentage int;
select * from student;
alter table student  add column phone int after percentage;
select* from student;
alter table student drop column percentage;
select* from student;
alter table student rename column phone to mobile_no;
select* from student;
alter table student add column lname  varchar(100) after marks;
select* from student;

create database joined;
use joined;
create table matches ( id  int, players varchar(100), games varchar(100)); 
select * from matches;
insert into matches (id,players,games) value(1,"sandy","cricket"),(2,"sugandha","basketball"),(3,"khushbu","volleyball"),(4,"shiv","football");
select* from matches;
create table final ( id int, players int, prizes varchar(100));
insert into final (id,players,prizes)value(1,10,"first"),(2,12,"second"),(3,11,"third"),(4,11,"forth");
select* from final;
select* from matches inner join final on matches.id=final.id;
select* from matches left join  final  on matches.id=final.id;
select* from matches;
select* from matches right join  final on matches.id=final.id;
select* from matches;
select* from matches cross join final on matches.id=final.id;
select* from matches;
-- find no of players in games
select* from matches join final on matches.id=final.id where games= "players";
select * from matches;
-- fill data in column using another table
select * from matches;
set sql_safe_updates=0;
alter table matches add column region varchar(100);
select* from matches;

use  joined;
select* from matches;
-- union
select* from final;
select * from matches;
-- unionall
select* from final;
select* from matches;
-- minus
select* from final;

create table table1( id int,name varchar(100),city varchar(100),country varchar(100));
use table1;
insert into table1 (id,name,city,country)values(1,"sandeep","gkp","india"),(2,"sugandha","delhi","netherland"),(3,"sun","noida","india"),(4,"sandy","gurgao","itlay");
select* from  table1;
create table table2(id int,name varchar(100),city varchar(100),country varchar(100));
select* from table2;
insert into table2(id ,name, city,country)values(1,"deepa","gkp","india"),(2,"dumboo","sdr","canada"),(3,"deeps","lck","india"),(4," dumm","patna","usa");
select* from  table2;
select name, city,country from table1 union select name ,city,country from table2;
select name ,country,city from table1 union all select name, city,country from table2;
select name from table1 intersect select name from table2;
select name from table1 where name in ("deeps"," deepa","sandeep");
select city from table1 where city in (select city from table2);
select country from table1 where country in ( select country from table2);
select id from table1 where id in ( select id from table2);
-- minus
select name from table1 where name not in ( select name from table2);
select name from table2 where name not in ( select name from table1);
-- combine
select city  from table1 where city not in (select city from table2) ;
select name from table1 where name  not in ( select name from table1);
 create view dub as select name,city,country from table1;
 select* from dub;
 insert into dub ( name, country) value ( "sugandha","marrying");
 select* from dub;
 set sql_safe_updates=0;
 update table1 set id = "tab" where city is null;
 select* from table1;
 delete from table1 where id  is null;
 select * from table1;
 
 use 3pm;
 show tables;
 grant select,insert, delete on student to hello;
 
 revoke update on student from hello;
 -- constrant practice--
 create database practice;
 use practice;
 create table data1(id int not null,name varchar(200),age int check(age>18), city varchar(100) default "delhi");
 drop table data1;
  create table data1(id int not null,name varchar(200),age int check(age>18), city varchar(100) default "delhi");
  select* from data1;
  insert into data1(id,name,age)value("shiv",24),(2,"parvati",27);
  select* from data1;
  insert into data1(id,name,age)value("shiv",24),(2,"parvati",27),("vishnu",23),(4,"vishnuu",44);
  
  -- KEYS --
  use practice;
  create table keyss(id int primary key, name varchar(200),price int);
  insert into keyss(id,name,price)values(1,"shiv",190000),(2,"parvati",120000),(3,"vishnu",34000);
  select*from keyss;
  desc keyss;
  create table keyss1(id int, name varchar(200),price int ,city varchar(100)default "delhi");
  insert into keyss1(id,name,price)values(1,"shiv",190000),(2,"parvati",120000),(3,"vishnu",34000),(3,"shiv",190000),(4,"sgiv",20000),(3,"vishnu",34000);
  select* from keyss1;
  select distinct * from keyss1;
  create table keey as select distinct * from keyss1;
  select * from keey;
  truncate table keyss1;
  select* from keyss1;
  insert into keyss1 select* from keey;
  select* from keey;
  
  create table customer(cid int primary key auto_increment,name varchar(100),phone_no char(3)unique);
  desc customer;
insert into customer(name,phone_no)values("shiv",128),("shiva",256),("shib",244),("shan",124),("shan",129);
select* from customer;
select distinct *from customer;
create table cust as select distinct * from customer;
select* from cust;
-- foregin key--
create table purchase(cid int,pname varchar (100),price int,foreign key (cid) references customer(cid));
desc purchase;
insert into purchase(cid,pname,price)values(1,"iphone",34000),(1,"buds",24000),(22,"cloths",3499),(3,"jeans",1200),(20,"saree",3500);
select* from customer;
select* from purchase;
  
use practice;
create table class(roll_no int primary key auto_increment,sname varchar(200),phone_no int unique);
insert into class(sname,phone_no)values("suggu",123),("sandy",124),("shiv",125);
select* from class;
 create table classrooms(roll_no int primary key auto_increment,marks int,score int, foreign key (roll_no) references class(roll_no));
 insert into classrooms(marks,score)values(79,89),(90,89),(67,89);
 select*from classrooms;
 select*from class;
 desc classrooms;
 create table class10(roll_no int primary key auto_increment,sname varchar(200),phone_no int unique,city varchar(200)default"dehradoon");
insert into class10(roll_no,sname,phone_no,city)values("suggu",123),("sandy",124),("shiv",125),("vishnu",200),("sandy",124),("suggu",123),("mahi",450),("t",900);
drop table class10;
 

 create table classes1(roll_no int primary key auto_increment,sname varchar(200),phone_no int unique,city varchar(200) default"delhi");
insert into classes1(sname,phone_no)values("suggu",123),("sandy",124),("shiv",125),("vishnu",200),("sandy",1244),("suggu",1233),("mahi",450),("t",900),("suggu",1236),("sandy",1245);
select distinct *from classes1;
desc classes1;

-- set operators--
use practice;
select*from customer;
select*from purchase;
-- union--
select cid from customer union select cid from purchase;
-- union all--
select cid from customer union all select cid from purchase;
-- intersect--
select cid from customer intersect select cid from purchase;
-- intersect using subqueries--
select cid from customer where cid not in (select cid from purchase);
-- minus--
select cid from purchase where cid not in (select cid from customer);

-- grant and revoke--
 grant select,insert on customer to ok;
select* from customer;
revoke select,insert on customer from ok;





