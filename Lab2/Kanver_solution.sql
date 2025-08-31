-- 1. List distinct course titles taken by CSE students
SELECT DISTINCT C.title
FROM Student S
JOIN Takes T ON S.StudentID = T.StudentID
JOIN Course C ON C.CourseID = T.Course_id
WHERE S.dept_name = 'CSE';

-- 2. List instructor IDs who teach EE department courses
SELECT I.insid
FROM Instructor I
JOIN Teaches T ON I.insid = T.ins_id
JOIN Course C ON C.courseid = T.course_id
WHERE C.dept_name = 'EE';

-- 3. List names of students who have not taken any course
SELECT S.name
FROM Student S
WHERE S.studentid NOT IN (SELECT studentid FROM Takes);

-- 4. List course titles and number of students enrolled in each course
SELECT C.title, COUNT(*) AS students_enrolled
FROM Takes T
JOIN Course C ON C.courseid = T.course_id
GROUP BY C.courseid;

-- 5. List instructor IDs who have not taught any course
SELECT I.insid
FROM Instructor I
WHERE I.insid NOT IN (SELECT ins_id FROM Teaches);

-- 6. List department names and number of courses offered by each department
SELECT C.dept_name, COUNT(*) AS enrolled
FROM Course C
GROUP BY C.dept_name;

-- 7. List course titles that are not offered in any section
SELECT C.title
FROM Course C
WHERE C.courseid NOT IN (SELECT course_id FROM Section);

-- 8. List names of students who are taking courses outside their department
SELECT S.name
FROM Student S
JOIN Takes T ON S.studentid = T.studentid
JOIN Course C ON C.courseid = T.course_id
WHERE S.dept_name != C.dept_name;

-- 9. List department names and number of instructors in each department
SELECT dept_name, COUNT(*) AS num_instructors
FROM Instructor
GROUP BY dept_name;

-- 10. List course titles with more than 3 credits
SELECT C.title
FROM Course C
WHERE C.credits > 3;

-- 11. List student names and number of courses taken by each student
SELECT S.name, COUNT(*)
FROM Student S
JOIN Takes T ON S.studentid = T.studentid
GROUP BY S.studentid;

-- 12. List classrooms and number of distinct courses scheduled in each classroom
SELECT classroom, COUNT(DISTINCT course_id)
FROM Section
GROUP BY classroom;