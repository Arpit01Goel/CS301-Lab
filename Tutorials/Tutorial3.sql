
select semester, year, count(*) from section group by semester, year having count(*) >=5;

select studentid, count(*) from takes group by studentid, semester, year having count(course_id) >=2;

select title from course where courseid in ( select course_id from takes natural join student group by course_id having count(distinct dept_name) > 1);

select name, studentid from student where studentid not in (select distinct studentid from student natural join takes join course on course.courseId = takes.course_id where student.dept_name != course.dept_name) and studentid in (select StudentID from takes);

select studentid from takes where studentid in (select studentid from takes group by studentid having count(grade)=1) and studentid in (select studentid from takes where grade='A');

select teaches.ins_id, count(distinct course.dept_name) from teaches join course on course.courseid = teaches.course_id group by ins_id ;

drop view if exists temp;
create view temp as select studentid, count(course_id) from takes group by studentid order by studentid asc;

select distinct studentid, teaches.ins_id from takes natural join teaches order by studentid;

select studentid, takes.course_Id from student natural left join takes order by studentid;

 select studentid, name from student natural join takes join course on course.courseid = takes.course_id where student.dept_name = course.dept_name group by studentid having (student.dept_name, count(*)) in (select dept_name, count(distinct courseid) from course group by dept_name) ;

select name from student where studentid in ( select studentid from takes group by studentid having count(*) >= all ( select count(*) from takes group by studentid) );

select distinct insid from instructor where insid not in (select distinct insid from instructor join teaches on instructor.insId = teaches.ins_id natural join takes join  student on student.studentid = takes.studentid where instructor.dept_name != student.dept_name);

select classroom from section join course on section.course_Id = course.courseId group by section.classroom having count (distinct dept_name) >1 

select distinct studentid from takes where section_id in ( select distinct section_id from takes group by section_id, semester, year having count(studentid)=1);

