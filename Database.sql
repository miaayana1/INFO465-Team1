CREATE DATABASE IF NOT EXISTS course_registration;
USE course_registration;
-- Course Registration Database Schema
-- Based on your ER diagram

-- Use the database
USE course_registration;

-- Create Department table
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    department_code VARCHAR(10) NOT NULL UNIQUE
);

-- Create Role table
CREATE TABLE Role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- Create Course table
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    credits INT DEFAULT 3,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create User table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Create Session table
CREATE TABLE Session (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    instructor_id INT,
    semester VARCHAR(20),
    year INT,
    modality VARCHAR(20) DEFAULT 'In-Person',
    max_capacity INT DEFAULT 30,
    current_enrollment INT DEFAULT 0,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES User(user_id)
);

-- Create Enrollment table (junction table)
CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    session_id INT,
    enrolled_on DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (session_id) REFERENCES Session(session_id),
    UNIQUE(user_id, session_id) -- Prevent duplicate enrollments
);