drop table if exists temp;
create table temp (name varchar(10), age int, branch varchar(10), primary key(name, age, branch));

insert into temp values ('Alice', 20, 'CSE');
insert into temp values ('Bob', 20, 'ECE');
insert into temp values ('Charlie', 20, 'CSE');

select * from temp;
-- Below line will create error because of repetition of primary key values
-- insert into temp values ('Alice', 20, 'CSE');

