# 🎓 University Course Management System

A **MySQL-based University Course Management System** designed to manage students, instructors, departments, courses, and student enrollments.

This project demonstrates practical SQL and database concepts including **database design, table relationships, CRUD operations, joins, aggregate functions, subqueries, date functions, string functions, window functions, and conditional expressions**.

---

## 📌 Project Overview

The **University Course Management System** provides a structured relational database for managing academic information within a university.

The system contains five main entities:

* 👨‍🎓 Students
* 👨‍🏫 Instructors
* 🏢 Departments
* 📚 Courses
* 📝 Enrollments

The database is named **`university_db`**.

---

## 🎯 Objectives

The main objectives of this project are to:

* Create and manage a relational university database.
* Store student and instructor information.
* Organize courses according to departments.
* Manage student course enrollments.
* Demonstrate relationships using primary and foreign keys.
* Perform CRUD operations.
* Retrieve and analyze data using SQL queries.
* Demonstrate different types of SQL joins.
* Use aggregate functions such as `COUNT()`, `AVG()`, and `MAX()`.
* Implement subqueries and filtering.
* Use date and string functions.
* Demonstrate window functions and conditional logic.

---

## 🗄️ Database Structure

The project consists of the following tables:

### 1. Departments

Stores information about university departments.

| Column         | Data Type    | Description            |
| -------------- | ------------ | ---------------------- |
| DepartmentID   | INT          | Primary Key            |
| DepartmentName | VARCHAR(100) | Name of the department |

---

### 2. Students

Stores student information.

| Column         | Data Type    | Description          |
| -------------- | ------------ | -------------------- |
| StudentID      | INT          | Primary Key          |
| FirstName      | VARCHAR(50)  | Student's first name |
| LastName       | VARCHAR(50)  | Student's last name  |
| Email          | VARCHAR(100) | Unique email address |
| BirthDate      | DATE         | Student's birth date |
| EnrollmentDate | DATE         | Date of enrollment   |

The student email is defined as unique and required.

---

### 3. Instructors

Stores instructor information and their department assignments.

| Column       | Data Type     | Description             |
| ------------ | ------------- | ----------------------- |
| InstructorID | INT           | Primary Key             |
| FirstName    | VARCHAR(50)   | Instructor's first name |
| LastName     | VARCHAR(50)   | Instructor's last name  |
| Email        | VARCHAR(100)  | Unique email address    |
| DepartmentID | INT           | Foreign Key             |
| Salary       | DECIMAL(10,2) | Instructor salary       |

The `DepartmentID` references the `Departments` table.

---

### 4. Courses

Stores courses offered by university departments.

| Column       | Data Type    | Description       |
| ------------ | ------------ | ----------------- |
| CourseID     | INT          | Primary Key       |
| CourseName   | VARCHAR(100) | Course name       |
| DepartmentID | INT          | Foreign Key       |
| Credits      | INT          | Number of credits |

The project applies a constraint requiring course credits to be greater than zero.

---

### 5. Enrollments

Connects students with the courses they are enrolled in.

| Column         | Data Type | Description     |
| -------------- | --------- | --------------- |
| EnrollmentID   | INT       | Primary Key     |
| StudentID      | INT       | Foreign Key     |
| CourseID       | INT       | Foreign Key     |
| EnrollmentDate | DATE      | Enrollment date |

The table uses foreign keys to connect students and courses and uses cascading deletion for related enrollment records.

---

## 🔗 Database Relationships

The database follows a relational structure:

```text
Departments
    │
    ├───────────────┐
    │               │
    ▼               ▼
Instructors       Courses
                     │
                     ▼
                Enrollments
                     ▲
                     │
                  Students
```

### Relationships

* One **Department** can have multiple **Instructors**.
* One **Department** can offer multiple **Courses**.
* One **Student** can enroll in multiple **Courses**.
* One **Course** can have multiple **Students**.
* The `Enrollments` table acts as the relationship between **Students** and **Courses**.

---

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* Relational Database Management System (RDBMS)

---

## 📊 SQL Concepts Demonstrated

This project covers a wide range of SQL concepts.

### CRUD Operations

The project demonstrates:

* **CREATE** – inserting records
* **READ** – retrieving records
* **UPDATE** – modifying records
* **DELETE** – removing records

For example, the project inserts a new student, retrieves students, updates an instructor's salary, and deletes an enrollment.

### Filtering

Students enrolled after 2022 are retrieved using a date-based condition.

### JOIN Operations

The project demonstrates:

* `INNER JOIN`
* `LEFT JOIN`

These queries retrieve students together with their corresponding courses.

### Aggregate Functions

The project uses:

* `COUNT()`
* `AVG()`
* `MAX()`

Examples include calculating average course credits and finding the maximum salary of Computer Science instructors.

### GROUP BY & HAVING

The project groups enrollment records by course and filters groups using `HAVING`.

### Subqueries

Nested queries are used to identify students enrolled in courses with more than 10 students.

### Date Functions

The project uses `YEAR()` to extract the enrollment year.

### String Functions

`CONCAT()` is used to combine an instructor's first and last name into a full name.

### Window Functions

A running total of student enrollments is calculated using the `COUNT() OVER()` window function.

### CASE Expression

Students are categorized as **Senior** or **Junior** according to their enrollment duration.

---

## 📚 Sample Data

The database includes sample records for:

* **3 departments**

  * Computer Science
  * Mathematics
  * Physics

* **5 students**

* **3 instructors**

* **5 courses**

  * Introduction to SQL
  * Data Structures
  * Calculus I
  * Linear Algebra
  * General Physics

* **7 enrollment records**

---

## 🚀 How to Run the Project

### Step 1: Install MySQL

Install MySQL Server and a MySQL-compatible client such as:

* MySQL Workbench
* phpMyAdmin
* VS Code with a MySQL extension

### Step 2: Open the SQL File

Open the project SQL file:

```text
first(3).sql
```

### Step 3: Execute the Script

Run the complete SQL script in your MySQL environment.

The script automatically creates the database:

```sql
CREATE DATABASE IF NOT EXISTS university_db;
```

and selects it for use:

```sql
USE university_db;
```

### Step 4: Explore the Database

After execution, you can inspect:

```text
university_db
│
├── Departments
├── Students
├── Instructors
├── Courses
└── Enrollments
```

### Step 5: Execute Individual Queries

The SQL file contains **16 project tasks** covering different SQL concepts and query techniques.

---

## 📁 Project Structure

```text
University-Course-Management-System/
│
├── first(3).sql
└── README.md
```

---

## 💡 Key Learning Outcomes

Through this project, the following skills are demonstrated:

* Database creation
* Relational database design
* Primary and foreign keys
* Data integrity and constraints
* CRUD operations
* Data filtering
* Table joins
* Aggregate functions
* Grouping and filtering groups
* Subqueries
* Date functions
* String functions
* Window functions
* Conditional expressions
* SQL query writing and data analysis

---

## 🔍 Project Highlights

⭐ Relational database design
⭐ Five interconnected tables
⭐ Primary and foreign key relationships
⭐ Sample academic data
⭐ CRUD operations
⭐ INNER JOIN and LEFT JOIN
⭐ Aggregate functions
⭐ GROUP BY and HAVING
⭐ Nested subqueries
⭐ Date and string functions
⭐ Window functions
⭐ CASE expressions

---

## 👨‍💻 Author

**Prince Rabari**

This project was created as a practical SQL/database project to demonstrate fundamental and intermediate **MySQL and relational database concepts**.

---

## 📄 License

This project is intended for **educational and learning purposes**.

# Screenshots of the project is given below:
<img width="1366" height="768" alt="Screenshot (255)" src="https://github.com/user-attachments/assets/dfd7cc65-da5c-49dc-bb14-7ff49093b0f0" />
<img width="1366" height="768" alt="Screenshot (256)" src="https://github.com/user-attachments/assets/fa34598a-0b4b-4793-9d18-3c365e8a19ec" />
<img width="1366" height="768" alt="Screenshot (257)" src="https://github.com/user-attachments/assets/720c65fd-c8e3-4079-9e1e-8a0f63d8a37a" />
<img width="1366" height="768" alt="Screenshot (258)" src="https://github.com/user-attachments/assets/5504272c-e6ea-4014-bb69-31d63992680e" />
<img width="1366" height="768" alt="Screenshot (259)" src="https://github.com/user-attachments/assets/9dc63de9-3eaf-4f58-9507-0bcbfc672f5e" />

# Video of the project is given below:



https://github.com/user-attachments/assets/ec69c227-1adb-41a9-904b-3c00e42fac09





