CREATE DATABASE IF NOT EXISTS library;
SHOW DATABASES;
USE library;


-- 1. Books Table (only 4 rows, one per class)
CREATE TABLE Books (
    class ENUM('Form 1', 'Form 2', 'Form 3', 'Form 4') PRIMARY KEY,
    Bio INT NOT NULL,
    Chem INT NOT NULL,
    History INT NOT NULL,
    Math INT NOT NULL,
    English INT NOT NULL,
    CRE INT NOT NULL
);

-- 2. Students Table
CREATE TABLE Students (
    admission_number INT PRIMARY KEY CHECK (admission_number > 0),
    student_name VARCHAR(100) NOT NULL,
    class ENUM('Form 1', 'Form 2', 'Form 3', 'Form 4') NOT NULL
);

-- 3. Computers Table
CREATE TABLE Computers (
    computer_id INT AUTO_INCREMENT PRIMARY KEY,
    computer_label VARCHAR(50) NOT NULL UNIQUE
);

-- 4. BorrowedBooks Table
CREATE TABLE BorrowedBooks (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    admission_number INT NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    class ENUM('Form 1', 'Form 2', 'Form 3', 'Form 4') NOT NULL,
    subject ENUM('Bio', 'Chem', 'History', 'Math', 'English', 'CRE') NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (admission_number) REFERENCES Students(admission_number)
);

-- 5. DailyVisits Table
CREATE TABLE DailyVisits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    visit_date DATE NOT NULL,
    time_entered TIME NOT NULL,
    time_out TIME,
    admission_number INT NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    class ENUM('Form 1', 'Form 2', 'Form 3', 'Form 4') NOT NULL,
    subject ENUM('Bio', 'Chem', 'History', 'Math', 'English', 'CRE'),
    hours_in_library DECIMAL(4,2),
    FOREIGN KEY (admission_number) REFERENCES Students(admission_number)
);



