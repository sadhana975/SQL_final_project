-- CREATING DATABASE 
DROP DATABASE IF EXISTS result_processing_system ;

CREATE DATABASE result_processing_system;
USE result_Processing_system;


-- 2. Create Tables
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    batch YEAR,
    email VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    semester INT
);

CREATE TABLE Semesters (
    semester_id INT PRIMARY KEY,
    student_id INT,
    semester_no INT,
    year YEAR,
    FOREIGN KEY (student_id)
        REFERENCES Students (student_id)
);

CREATE TABLE Grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    semester_id INT,
    marks INT,
    grade_letter CHAR(2),
    grade_point DECIMAL(3 , 2 ),
    FOREIGN KEY (student_id)
        REFERENCES Students (student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses (course_id),
    FOREIGN KEY (semester_id)
        REFERENCES Semesters (semester_id)
);

-- 3. INSERTING VALUES INTO TABLE
INSERT INTO Students VALUES
(1, 'Sadhana', 'MSDs', 2022, 'sadhana2gmail.com'),
(2, 'Suresh', 'MSCs', 2022, 'suresh@gmail.com'),
(3, 'Lavanya', 'MECs', 2022, 'lavanya@gmail.com');

SELECT 
    *
FROM
    students;

INSERT INTO Courses VALUES
(101, 'Statistics', 4, 1),
(102, 'Mathematics', 3, 1),
(103, 'Computer science', 3, 2),
(104, 'Electronics', 4, 2);
SELECT * FROM courses;
describe semesters;

INSERT INTO Semesters VALUES
(201, 1, 1, 2023),
(202, 2, 1, 2023),
(203, 3, 1, 2023),
(204, 1, 2, 2024),
(205, 2, 2, 2024),
(206, 3, 2, 2024);

alter table grades
modify grade_point decimal (5,3);
describe grades;

INSERT INTO Grades (student_id, course_id, semester_id, marks, grade_letter, grade_point) VALUES
(1, 101, 201, 85, 'A', 9),
(1, 102, 201, 92, 'A+', 10),
(2, 101, 202, 78, 'B+', 8),
(2, 102, 202, 69, 'C', 6),
(3, 101, 203, 90, 'A+', 10),
(3, 102, 203, 88, 'A', 9),
(1, 103, 204, 87, 'A', 9),
(1, 104, 204, 78, 'B+', 8),
(2, 103, 205, 91, 'A+', 10),
(2, 104, 205, 82, 'A', 9),
(3, 103, 206, 85, 'A', 9),
(3, 104, 206, 90, 'A+', 10);

SELECT *
FROM grades;

-- GPA AND PASS/FAIL STATISTICS

-- 4. GPA per semester
CREATE VIEW GPA_View AS
SELECT g.student_id, g.semester_id,
       ROUND(SUM(g.grade_point * c.credits) / SUM(c.credits), 2) AS GPA
FROM Grades g
JOIN Courses c ON g.course_id = c.course_id
GROUP BY g.student_id, g.semester_id;

-- 5. CGPA per student
SELECT g.student_id,
       ROUND(SUM(g.grade_point * c.credits) / SUM(c.credits), 2) AS CGPA
FROM Grades g
JOIN Courses c ON g.course_id = c.course_id
GROUP BY g.student_id;




