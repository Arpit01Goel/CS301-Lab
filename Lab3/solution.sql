select title from course join takes on course.courseId = takes.course_id natural join student where student.dept_name = 'CSE';

select ins_id from teaches join course on teaches.course_id = course.courseId where course.dept_name = 'EE';

select name from student where studentId not in (select studentId from takes);

select title, count(*) from course join takes on takes.course_id = course.courseId group by title;

select insId from instructor where insId not in (select distinct ins_id from teaches);

select dept_name, count(*) from course group by dept_name;

select title from course where courseid not in (select course_id from section);

select distinct name from student natural join takes join course on course.courseid = takes.course_ID where student.dept_name != course.dept_name;

select count( distinct insid  ) from instructor group by dept_name;

select title from course where credits in (select distinct credits from course where credits>3);

select name, count(distinct course_id) from student natural join takes group by name;

select classroom, count(distinct course_id) from section group by classroom;
