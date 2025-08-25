-- sudo -u postgres psql -f ForeignKey.sql > output.txt

drop table if exists enrollment;
drop table if EXISTS student_1;

create table student_1(student_id int primary key, name varchar(10));
create table enrollment(enrollment_id SERIAL, student_id int, course varchar(15), foreign key(student_id) references student_1);

insert into student_1 (student_id, name)  values (101, 'Alice');
insert into student_1 (student_id, name)  values (102, 'Bob');

insert into enrollment (enrollment_id, student_id, course) values  (1, 101, 'Math');
insert into enrollment (enrollment_id, student_id, course)  values (2 ,102, 'Physics');
insert into enrollment (enrollment_id, student_id, course)  values (3, 102, 'Chemistry'); -- repetation is allowed
insert into enrollment (enrollment_id, student_id, course)  values (3, NULL, 'Chemistry'); -- null values is allowed
-- just outside values like 103 is not allowed 

select * from student_1;
select * from enrollment;

-- Let's make a change in student_1 and update the student_id
update student_1 set student_id = 103 where student_id = 102;

-- Let's change student_id in enrollment
update enrollment set student_id = 103 where student_id = 102;

select * from student_1;
select * from enrollment;
