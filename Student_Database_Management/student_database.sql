-- Drop the schema if it exists and create a new one
DROP SCHEMA IF EXISTS student_management;
CREATE SCHEMA student_management;
USE student_management;
-- User Login Table
DROP TABLE IF EXISTS student_management.user_login;
CREATE TABLE student_management.user_login (
    user_id VARCHAR(50) PRIMARY KEY,
    user_password VARCHAR(255) NOT NULL, -- Typically, passwords should be hashed
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    sign_up_on DATE NOT NULL,
    email_id VARCHAR(255) UNIQUE NOT NULL
);

-- Parent Details Table
DROP TABLE IF EXISTS student_management.parent_details;
CREATE TABLE student_management.parent_details (
    parent_id VARCHAR(50) PRIMARY KEY,
    father_first_name VARCHAR(100),
    father_last_name VARCHAR(100),
    father_email_id VARCHAR(255) UNIQUE,
    father_mobile VARCHAR(15),
    father_occupation VARCHAR(100),
    mother_first_name VARCHAR(100),
    mother_last_name VARCHAR(100),
    mother_email_id VARCHAR(255) UNIQUE,
    mother_mobile VARCHAR(15),
    mother_occupation VARCHAR(100)
);

-- Teachers Table
DROP TABLE IF EXISTS student_management.teachers;
CREATE TABLE student_management.teachers (
    teacher_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email_id VARCHAR(255) UNIQUE NOT NULL,
    contact VARCHAR(15),
    registration_date DATE NOT NULL,
    registration_id VARCHAR(50) UNIQUE NOT NULL
);

-- Class Details Table
DROP TABLE IF EXISTS student_management.class_details;
CREATE TABLE student_management.class_details (
    class_id VARCHAR(50) PRIMARY KEY,
    class_teacher VARCHAR(50),
    class_year VARCHAR(10) NOT NULL,
    FOREIGN KEY (class_teacher) REFERENCES student_management.teachers (teacher_id)
);

-- Student Details Table
DROP TABLE IF EXISTS student_management.student_details;
CREATE TABLE student_management.student_details (
    student_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    class_id VARCHAR(50),
    roll_no VARCHAR(50) UNIQUE,
    email_id VARCHAR(255) UNIQUE NOT NULL,
    parent_id VARCHAR(50),
    registration_date DATE NOT NULL,
    registration_id VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (class_id) REFERENCES student_management.class_details (class_id),
    FOREIGN KEY (parent_id) REFERENCES student_management.parent_details (parent_id)
);

-- Subject Table
DROP TABLE IF EXISTS student_management.subject;
CREATE TABLE student_management.subject (
    subject_id VARCHAR(50) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    class_year VARCHAR(10) NOT NULL,
    subject_head VARCHAR(50),
    FOREIGN KEY (subject_head) REFERENCES student_management.teachers (teacher_id)
);

-- Subject Tutors Table
DROP TABLE IF EXISTS student_management.subject_tutors;
CREATE TABLE student_management.subject_tutors (
    row_id SERIAL PRIMARY KEY,
    subject_id VARCHAR(50),
    teacher_id VARCHAR(50),
    class_id VARCHAR(50),
    FOREIGN KEY (subject_id) REFERENCES student_management.subject (subject_id),
    FOREIGN KEY (teacher_id) REFERENCES student_management.teachers (teacher_id),
    FOREIGN KEY (class_id) REFERENCES student_management.class_details (class_id)
);