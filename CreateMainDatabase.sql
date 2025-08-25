drop table if exists Teaches;
drop table if exists Takes;
drop table if exists Section;
drop table if exists Course;
drop table if exists Student;
drop table if exists Instructor;
drop table if exists Department;


CREATE TABLE Department(
dept_name VARCHAR(6) NOT NULL PRIMARY KEY
);
INSERT INTO Department(dept_name) VALUES ('CSE');
INSERT INTO Department(dept_name) VALUES ('EE');
INSERT INTO Department(dept_name) VALUES ('ME');
INSERT INTO Department(dept_name) VALUES ('CY');
INSERT INTO Department(dept_name) VALUES ('CH');
INSERT INTO Department(dept_name) VALUES ('MS');
INSERT INTO Department(dept_name) VALUES ('PH');
INSERT INTO Department(dept_name) VALUES ('BIO');
INSERT INTO Department(dept_name) VALUES ('ECE');
INSERT INTO Department(dept_name) VALUES ('IT');
INSERT INTO Department(dept_name) VALUES ('VLSI');
INSERT INTO Department(dept_name) VALUES ('SIGCOM');
CREATE TABLE Instructor(
InsID INTEGER NOT NULL PRIMARY KEY,
dept_name VARCHAR(6) NOT NULL,
FOREIGN KEY(dept_name) REFERENCES Department(dept_name)
);
INSERT INTO Instructor(InsID,dept_name) VALUES (1,'CSE');
INSERT INTO Instructor(InsID,dept_name) VALUES (2,'ECE');
INSERT INTO Instructor(InsID,dept_name) VALUES (3,'EE');
INSERT INTO Instructor(InsID,dept_name) VALUES (4,'CY');
INSERT INTO Instructor(InsID,dept_name) VALUES (5,'MS');
INSERT INTO Instructor(InsID,dept_name) VALUES (6,'ME');
INSERT INTO Instructor(InsID,dept_name) VALUES (7,'SIGCOM');
INSERT INTO Instructor(InsID,dept_name) VALUES (8,'CSE');
INSERT INTO Instructor(InsID,dept_name) VALUES (9,'IT');
INSERT INTO Instructor(InsID,dept_name) VALUES (10,'PH');
INSERT INTO Instructor(InsID,dept_name) VALUES (11,'CH');
INSERT INTO Instructor(InsID,dept_name) VALUES (12,'ME');
INSERT INTO Instructor(InsID,dept_name) VALUES (13,'EE');
INSERT INTO Instructor(InsID,dept_name) VALUES (14,'BIO');
INSERT INTO Instructor(InsID,dept_name) VALUES (15,'MS');
INSERT INTO Instructor(InsID,dept_name) VALUES (16,'CY');
INSERT INTO Instructor(InsID,dept_name) VALUES (17,'VLSI');
INSERT INTO Instructor(InsID,dept_name) VALUES (18,'ECE');
INSERT INTO Instructor(InsID,dept_name) VALUES (19,'CSE');
INSERT INTO Instructor(InsID,dept_name) VALUES (20,'ME');
CREATE TABLE Student(
StudentID INTEGER NOT NULL PRIMARY KEY
,name VARCHAR(20) NOT NULL
,dept_name VARCHAR(6) NOT NULL
,FOREIGN KEY(dept_name) REFERENCES Department(dept_name)
);
INSERT INTO Student(StudentID, name, dept_name) VALUES (1,'BKY','EE');
INSERT INTO Student(StudentID, name, dept_name) VALUES (2,'BMD','CSE');
INSERT INTO Student(StudentID, name, dept_name) VALUES (3,'CDY','CY');
INSERT INTO Student(StudentID, name, dept_name) VALUES (4,'AMK','ECE');
INSERT INTO Student(StudentID, name, dept_name) VALUES (5,'DAB','ME');
INSERT INTO Student(StudentID, name, dept_name) VALUES (6,'JKG','CSE');
INSERT INTO Student(StudentID, name, dept_name) VALUES (7,'BBB','CH');
INSERT INTO Student(StudentID, name, dept_name) VALUES (8,'LKZ','PH');
INSERT INTO Student(StudentID, name, dept_name) VALUES (9,'FBK','EE');
INSERT INTO Student(StudentID, name, dept_name) VALUES (10,'NPY','ECE');
INSERT INTO Student(StudentID, name, dept_name) VALUES (11,'ZLB','IT');
INSERT INTO Student(StudentID, name, dept_name) VALUES (12,'HME','MS');
INSERT INTO Student(StudentID, name, dept_name) VALUES (13,'GIT','SIGCOM');
INSERT INTO Student(StudentID, name, dept_name) VALUES (14,'GLB','VLSI');
INSERT INTO Student(StudentID, name, dept_name) VALUES (15,'FTP','BIO');
INSERT INTO Student(StudentID, name, dept_name) VALUES (16,'LSC','EE');
INSERT INTO Student(StudentID, name, dept_name) VALUES (17,'DAB','CSE');
INSERT INTO Student(StudentID, name, dept_name) VALUES (18,'NPP','VLSI');
CREATE TABLE Course(
CourseID INTEGER NOT NULL PRIMARY KEY,
title VARCHAR(20) NOT NULL,
dept_name VARCHAR(6) NOT NULL,
credits INTEGER NOT NULL,
FOREIGN KEY(dept_name) REFERENCES Department(dept_name)
);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (201,'DSA','CSE',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (202,'ASE','ECE',3);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (211,'FD','ME',3);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (213,'DSP','SIGCOM',3);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (222,'BCS','EE',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (301,'RC','CY',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (303,'MET','ME',3);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (323,'SE','IT',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (506,'DM','MS',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (511,'OPT','PH',3);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (518,'ORG','CH',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (523,'NEO','BIO',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (604,'WLD','CY',3);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (655,'CNS','CSE',3);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (702,'MIB','BIO',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (710,'ECM','VLSI',3);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (716,'SPT','SIGCOM',4);
INSERT INTO Course(CourseID, title, dept_name, credits) VALUES (722,'TBS','CSE',4);
CREATE TABLE Section(
Course_id INTEGER NOT NULL,
Section_id INTEGER NOT NULL,
semester INTEGER NOT NULL,
year INTEGER NOT NULL,
classroom VARCHAR(4) NOT NULL,
PRIMARY KEY(Course_id,Section_id,semester,year),
FOREIGN KEY(Course_id) REFERENCES Course(CourseID)
);
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (201,1,1,1,'CS1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (201,1,1,2,'CS2');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (202,2,1,2,'EC1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (202,1,1,1,'EC1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (211,1,2,3,'ME2');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (213,1,2,1,'EC2');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (222,2,2,2,'EE1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (303,1,2,3,'ME2');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (506,2,1,2,'CH1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (511,1,1,1,'PH2');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (518,1,2,2,'CH1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (655,2,1,3,'CY1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (655,1,2,4,'CS2');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (710,1,1,4,'EC2');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (710,2,2,3,'EC1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (722,2,1,4,'CS1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (702,1,2,4,'CH1');
INSERT INTO Section(Course_id, Section_id, semester, year, classroom) VALUES (604,2,2,3,'CY2');
CREATE TABLE Takes(
StudentID INTEGER NOT NULL,
Course_id INTEGER NOT NULL,
Section_id INTEGER NOT NULL,
semester INTEGER NOT NULL,
year INTEGER NOT NULL,
grade VARCHAR(2) NOT NULL,
PRIMARY KEY(StudentID,Course_id,Section_id,semester,year),
FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
FOREIGN KEY(Course_id) REFERENCES Course(CourseID)
);
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (5,211,1,2,3,'A');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (12,506,2,1,2,'B');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (8,511,1,1,1,'D');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (6,655,1,2,4,'C');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (17,655,2,1,3,'A');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (9,201,1,1,2,'B-');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (15,213,1,2,1,'C');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (17,722,2,1,4,'B');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (7,518,1,2,2,'F');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (10,202,2,1,2,'A');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (4,202,1,1,1,'B-');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (13,201,1,1,1,'A');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (17,201,1,1,1,'B');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (2,655,2,1,3,'D');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (18,710,1,1,4,'A');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (14,710,2,2,3,'C');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (16,222,2,2,2,'A');
INSERT INTO Takes(StudentID, Course_id, Section_id, semester, year, grade) VALUES (5,303,1,2,3,'D');
CREATE TABLE Teaches(
Ins_id INTEGER NOT NULL,
Course_id INTEGER NOT NULL,
Section_id INTEGER NOT NULL,
semester INTEGER NOT NULL,
year INTEGER NOT NULL,
PRIMARY KEY(Ins_id,Course_id,Section_id,semester,year),
FOREIGN KEY(Ins_id) REFERENCES Instructor(InsID),
FOREIGN KEY(Course_id) REFERENCES Course(CourseID)
);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (8,201,1,1,1);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (1,201,1,1,2);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (18,202,2,1,2);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (18,202,1,1,1);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (6,211,1,2,3);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (7,213,1,2,1);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (3,222,2,2,2);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (12,303,1,2,3);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (5,506,2,1,2);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (10,511,1,1,1);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (11,518,1,2,2);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (19,655,2,1,3);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (19,655,1,2,4);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (17,710,1,1,4);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (17,710,2,2,3);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (8,722,2,1,4);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (14,702,1,2,4);
INSERT INTO Teaches(Ins_id, Course_id, Section_id, semester, year) VALUES (16,604,2,2,3);