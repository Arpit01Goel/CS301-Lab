select name, dept_name from student;


select * from course where credits > 3;

select title, credits from course;

select insId, dept_name from instructor;

select distinct dept_name from department;
select course_id, classroom from section;
select name from student where dept_name = 'CSE';
select title from course where dept_name = 'ECE';
select title from teaches join course on teaches.course_id = course.courseID where ins_id = 1 ;
select name from takes natural join student where grade = 'A';