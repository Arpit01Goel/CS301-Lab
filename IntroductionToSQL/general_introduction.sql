drop table if exists students;

create table students (roll_no serial primary key, name varchar(10), age int, branch varchar(10) );
select * from students;
alter table students add address varchar(50), add phone varchar(15), add email varchar(30);
alter table students drop roll_no, drop  name, add name varchar(10);

select * from students;
