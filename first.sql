-- ==========================================
-- Final Project: University Course Management System
-- Database Setup, Schema & Queries (Safe Execution)
-- ==========================================

CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

-- ------------------------------------------
-- 1. TABLE CREATION (Preserves Existing Tables)
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    BirthDate DATE,
    EnrollmentDate DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT CHECK (Credits > 0),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- ------------------------------------------
-- 2. SAMPLE DATA INSERTION (Ignores Duplicates)
-- ------------------------------------------

INSERT IGNORE INTO Departments (DepartmentID, DepartmentName) VALUES 
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

INSERT IGNORE INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES 
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Mike', 'Brown', 'mike.brown@email.com', '2001-03-10', '2023-01-15'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2000-11-20', '2020-08-15'),
(5, 'Alex', 'Wilson', 'alex.wilson@email.com', '2002-07-04', '2023-08-20');

INSERT IGNORE INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES 
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 85000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 78000.00),
(3, 'Charlie', 'Green', 'charlie.green@univ.com', 1, 92000.00);

INSERT IGNORE INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES 
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Calculus I', 2, 4),
(104, 'Linear Algebra', 2, 3),
(105, 'General Physics', 3, 4);

INSERT IGNORE INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES 
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 1, 102, '2022-08-05'),
(4, 3, 101, '2023-01-15'),
(5, 4, 103, '2020-08-15'),
(6, 5, 101, '2023-08-20'),
(7, 2, 101, '2021-08-05');

-- ------------------------------------------
-- 3. PROJECT QUERIES
-- ------------------------------------------

-- Task 1: Perform CRUD Operations on all tables

-- CREATE
INSERT IGNORE INTO Students (FirstName, LastName, Email, BirthDate, EnrollmentDate) 
VALUES ('David', 'Miller', 'david.m@email.com', '2001-09-12', '2023-09-01');

-- READ
SELECT * FROM Students;

-- UPDATE
UPDATE Instructors 
SET Salary = 90000.00 
WHERE InstructorID = 1;

-- DELETE
DELETE FROM Enrollments 
WHERE EnrollmentID = 7;


-- Task 2: Retrieve students who enrolled after 2022
SELECT * 
FROM Students 
WHERE YEAR(EnrollmentDate) > 2022;


-- Task 3: Retrieve courses offered by the Mathematics department with a limit of 5 courses
SELECT c.* 
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;


-- Task 4: Get the number of students enrolled in each course, filtering for courses with more than 5 students
SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;


-- Task 5: Find students who are enrolled in both 'Introduction to SQL' and 'Data Structures'
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e1 ON s.StudentID = e1.StudentID
JOIN Courses c1 ON e1.CourseID = c1.CourseID AND c1.CourseName = 'Introduction to SQL'
JOIN Enrollments e2 ON s.StudentID = e2.StudentID
JOIN Courses c2 ON e2.CourseID = c2.CourseID AND c2.CourseName = 'Data Structures';


-- Task 6: Find students who are enrolled in either 'Introduction to SQL' or 'Data Structures'
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');


-- Task 7: Calculate the average number of credits for all courses
SELECT AVG(Credits) AS AverageCredits 
FROM Courses;


-- Task 8: Find the maximum salary of instructors in the Computer Science department
SELECT MAX(i.Salary) AS MaxCSInstructorSalary
FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';


-- Task 9: Count the number of students enrolled in each department
SELECT d.DepartmentName, COUNT(DISTINCT e.StudentID) AS EnrolledStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;


-- Task 10: INNER JOIN: Retrieve students and their corresponding courses
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;


-- Task 11: LEFT JOIN: Retrieve all students and their corresponding courses, if any
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;


-- Task 12: Subquery: Find students enrolled in courses that have more than 10 students
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
WHERE s.StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);


-- Task 13: Extract the year from the EnrollmentDate of students
SELECT StudentID, FirstName, LastName, YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;


-- Task 14: Concatenate the instructor's first and last name
SELECT InstructorID, CONCAT(FirstName, ' ', LastName) AS FullName, Email
FROM Instructors;


-- Task 15: Calculate the running total of students enrolled in courses
SELECT EnrollmentID, CourseID, EnrollmentDate,
       COUNT(StudentID) OVER (ORDER BY EnrollmentDate, EnrollmentID) AS RunningTotal
FROM Enrollments;


-- Task 16: Label students as 'Senior' or 'Junior' based on their year of enrollment
SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE 
           WHEN TIMESTAMPDIFF(YEAR, EnrollmentDate, CURDATE()) > 4 THEN 'Senior'
           ELSE 'Junior'
       END AS StudentStatus
FROM Students;