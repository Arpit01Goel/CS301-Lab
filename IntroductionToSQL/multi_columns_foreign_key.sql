drop table if exists fees;
drop table if exists students;

create table students (id int, name varchar(10), age int, branch varchar(10), primary key(id, name));
insert into students values (1, 'Arpit', 20, 'CSE');

create table fees (id int, name varchar(10), amount numeric(10,2), primary key(id,name), foreign key(id,name) references students(id,name));
-- insert into 