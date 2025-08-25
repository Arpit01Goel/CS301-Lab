 select studentid, name from student natural join takes join course on course.courseid = takes.course_id where student.dept_name = course.dept_name group by studentid having (student.dept_name, count(*)) in (select dept_name, count(distinct courseid) from course group by dept_name) ;


 select courseid, count(courseid) from course join takes on takes.course_id = course.courseid group by course.courseid having count(courseid) >= all (select count(studentid) from takes group by course_id);
-- select * from instructor; 

-- select * from instructor join teaches on instructor.insId = teaches.ins_id natural join takes join  student on student.studentid = takes.studentid where instructor.dept_name != student.dept_name;


select distinct insid from instructor where insid not in (select distinct insid from instructor join teaches on instructor.insId = teaches.ins_id natural join takes join  student on student.studentid = takes.studentid where instructor.dept_name != student.dept_name);

-- select * from takes;
select studentid from takes where grade <= all (select distinct grade from takes);
-- select * from teaches;
select distinct  title from instructor join teaches on teaches.ins_id = instructor.insid join course on teaches.course_id = course.courseid where instructor.dept_name = course.dept_name;
