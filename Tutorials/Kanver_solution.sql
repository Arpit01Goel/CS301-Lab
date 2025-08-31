-- 1. Sections per semester/year with more than 5 sections
SELECT semester, year, COUNT(*) AS num_sections
FROM Section
GROUP BY semester, year
HAVING COUNT(*) > 5;

-- 2. Students who took 2 or more courses in the same semester/year
SELECT studentid
FROM Takes
GROUP BY studentid, semester, year
HAVING COUNT(*) >= 2;

-- 3. Courses taken by students from at least 2 different departments
SELECT T.course_id
FROM Student S
JOIN Takes T ON S.studentid = T.studentid
GROUP BY T.course_id
HAVING COUNT(DISTINCT S.dept_name) >= 2;

-- 4. Students who have only taken courses within their own department
SELECT DISTINCT S.studentid
FROM Student S
JOIN Takes T ON S.studentid = T.studentid
JOIN Course C ON T.course_id = C.courseid
WHERE S.studentid NOT IN (
    SELECT DISTINCT S.studentid
    FROM Student S
    JOIN Takes T ON S.studentid = T.studentid
    JOIN Course C ON T.course_id = C.courseid
    WHERE S.dept_name != C.dept_name
);

-- 5. Students who received 'A' grade in all courses taken
SELECT studentid
FROM Takes
GROUP BY studentid
HAVING COUNT(*) = COUNT(*) FILTER (WHERE grade = 'A');

-- 6. Instructors and number of distinct departments they taught courses for
SELECT I.insid, COUNT(DISTINCT C.dept_name)
FROM Instructor I
JOIN Teaches T ON I.insid = T.ins_id
JOIN Course C ON T.course_id = C.courseid
GROUP BY I.insid;

-- 7. Create a view for students and their enrolled course count
CREATE VIEW student_enrolled_courses AS
SELECT studentid, COUNT(DISTINCT course_id)
FROM Takes
GROUP BY studentid;

-- 8. Student-instructor pairs for courses, semester, and year
SELECT DISTINCT T1.studentid, T2.ins_id
FROM Takes T1
JOIN Teaches T2 ON T1.course_id = T2.course_id
    AND T1.semester = T2.semester
    AND T1.year = T2.year;

-- 9. List all students and their courses (including students with no courses)
SELECT T.studentid, T.course_id
FROM Student S
LEFT JOIN Takes T ON S.studentid = T.studentid
LEFT JOIN Course C ON C.courseid = T.course_id;

-- 10. Students who took all courses from their own department and matched department course count
SELECT S.studentid
FROM Student S
JOIN Takes T ON S.studentid = T.studentid
JOIN Course C ON C.courseid = T.course_id
GROUP BY S.studentid, C.dept_name
HAVING S.dept_name = C.dept_name
   AND ((S.dept_name, COUNT(DISTINCT C.courseid)) IN (
        SELECT dept_name, COUNT(*)
        FROM Course
        GROUP BY dept_name
   ));

-- 11. Students who took the maximum number of courses
SELECT studentid
FROM Takes
GROUP BY studentid
HAVING COUNT(course_id) = (
    SELECT MAX(count)
    FROM (
        SELECT studentid, COUNT(*) AS count
        FROM Takes
        GROUP BY studentid
    ) AS sub
);

-- 12. Instructors who have never taught a student from a different department
SELECT insid
FROM Instructor
WHERE insid NOT IN (
    SELECT I.insid
    FROM Student S
    JOIN Takes T1 ON S.studentid = T1.studentid
    JOIN Teaches T2 ON T1.course_id = T2.course_id
        AND T1.semester = T2.semester
        AND T1.year = T2.year
    JOIN Instructor I ON I.insid = T2.ins_id
    WHERE I.dept_name != S.dept_name
);

-- 13. Classrooms used for courses from more than one department
SELECT S.classroom
FROM Section S
JOIN Course C ON C.courseid = S.course_id
GROUP BY S.classroom
HAVING COUNT(DISTINCT C.dept_name) > 1;

-- 14.