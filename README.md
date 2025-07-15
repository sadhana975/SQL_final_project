OBJECTIVE:

The objective of this project is to develop a robust and scalable SQL-based system to manage student academic records, including grades, GPA, and CGPA, using MySQL Workbench.

TOOLS USED:
MySQL Workbench – for database creation, querying, and management

DATA BASE DESIGN
1. Database
A dedicated database named result_processing_system was created to manage and organize all academic data.

2. Tables
Students: Stores student personal and academic details like name, department, batch, and email.

Courses: Contains course-specific data such as name, credits, and semester offered.

Semesters: Tracks semester-wise academic details for each student.

Grades: Holds the marks, grade letters, and grade points earned by students in various courses across semesters.

DATA ENTRY:
Sample data was inserted into each table to simulate a real academic environment.

Grades include mappings of students to their course performance along with numeric and letter grades.

KEY FEATURES AND QUERIES:
🔹 GPA Calculation (Per Semester)
A view was created to calculate the GPA for each student for every semester.

GPA is computed using the formula:

ini
Copy
Edit
GPA = SUM(grade_point × course_credits) / SUM(course_credits)
🔹 CGPA Calculation (Cumulative)
A query was used to calculate the CGPA for each student across all semesters.

CGPA uses the same weighted average logic as GPA but spans all semesters.

OUTPUT REPORTS
GPA View: Displays each student's semester-wise GPA.

CGPA Summary: Provides an overall CGPA for every student in the database.

ADDITIONAL FUNCTONALITIES:
Trigger-based automatic GPA update on grade insert.

Procedures for bulk result uploads.

Grade distribution analytics per course.

Semester-wise pass/fail report.

📌 Notes
All tables are normalized to avoid data redundancy.

Foreign key constraints ensure referential integrity between tables.

The system is easily scalable to accommodate additional departments, courses, or grading schemes.

