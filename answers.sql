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


INSERT INTO Books (class, Bio, Chem, History, Math, English, CRE) VALUES
('Form 1', 10, 8, 7, 12, 9, 6),
('Form 2', 7, 9, 8, 11, 10, 7),
('Form 3', 6, 7, 9, 10, 8, 8),
('Form 4', 8, 6, 10, 9, 7, 9);


INSERT INTO Students (admission_number, student_name, class) VALUES
(1001, 'Alice Kimani', 'Form 1'),
(1002, 'Brian Otieno', 'Form 2'),
(1003, 'Cynthia Wambui', 'Form 3'),
(1004, 'David Mwangi', 'Form 4'),
(1005, 'Evelyn Njeri', 'Form 1'),
(1006, 'Felix Kiptoo', 'Form 2'),
(1007, 'Grace Muthoni', 'Form 3'),
(1008, 'Henry Maina', 'Form 4'),
(1009, 'Irene Achieng', 'Form 1'),
(1010, 'James Ouma', 'Form 2'),
(1011, 'Kevin Kariuki', 'Form 3'),
(1012, 'Linda Chebet', 'Form 4'),
(1013, 'Mary Wanjiku', 'Form 1'),
(1014, 'Nancy Njeri', 'Form 2'),
(1015, 'Oscar Mutua', 'Form 3'),
(1016, 'Pauline Wambua', 'Form 4'),
(1017, 'Quincy Kiplangat', 'Form 1'),
(1018, 'Rose Nyambura', 'Form 2'),
(1019, 'Samuel Kimani', 'Form 3'),
(1020, 'Teresa Nduta', 'Form 4');



INSERT INTO Computers (computer_label) VALUES
('Comp-01'), ('Comp-02'), ('Comp-03'), ('Comp-04'), ('Comp-05'),
('Comp-06'), ('Comp-07'), ('Comp-08'), ('Comp-09'), ('Comp-10'),
('Comp-11'), ('Comp-12'), ('Comp-13'), ('Comp-14'), ('Comp-15'),
('Comp-16'), ('Comp-17'), ('Comp-18'), ('Comp-19'), ('Comp-20');



INSERT INTO BorrowedBooks (admission_number, student_name, class, subject, borrow_date, due_date, return_date) VALUES
(1001, 'Alice Kimani', 'Form 1', 'Bio', '2025-05-01', '2025-05-15', '2025-05-10'),
(1002, 'Brian Otieno', 'Form 2', 'Chem', '2025-05-02', '2025-05-16', NULL),
(1003, 'Cynthia Wambui', 'Form 3', 'History', '2025-05-03', '2025-05-17', NULL),
(1004, 'David Mwangi', 'Form 4', 'Math', '2025-05-04', '2025-05-18', '2025-05-12'),
(1005, 'Evelyn Njeri', 'Form 1', 'English', '2025-05-05', '2025-05-19', NULL),
(1006, 'Felix Kiptoo', 'Form 2', 'CRE', '2025-05-06', '2025-05-20', NULL),
(1007, 'Grace Muthoni', 'Form 3', 'Bio', '2025-05-07', '2025-05-21', '2025-05-15'),
(1008, 'Henry Maina', 'Form 4', 'Chem', '2025-05-08', '2025-05-22', NULL),
(1009, 'Irene Achieng', 'Form 1', 'History', '2025-05-09', '2025-05-23', NULL),
(1010, 'James Ouma', 'Form 2', 'Math', '2025-05-10', '2025-05-24', NULL),
(1011, 'Kevin Kariuki', 'Form 3', 'English', '2025-05-11', '2025-05-25', NULL),
(1012, 'Linda Chebet', 'Form 4', 'CRE', '2025-05-12', '2025-05-26', NULL),
(1013, 'Mary Wanjiku', 'Form 1', 'Bio', '2025-05-13', '2025-05-27', NULL),
(1014, 'Nancy Njeri', 'Form 2', 'Chem', '2025-05-14', '2025-05-28', NULL),
(1015, 'Oscar Mutua', 'Form 3', 'History', '2025-05-15', '2025-05-29', NULL),
(1016, 'Pauline Wambua', 'Form 4', 'Math', '2025-05-16', '2025-05-30', NULL),
(1017, 'Quincy Kiplangat', 'Form 1', 'English', '2025-05-17', '2025-05-31', NULL),
(1018, 'Rose Nyambura', 'Form 2', 'CRE', '2025-05-18', '2025-06-01', NULL),
(1019, 'Samuel Kimani', 'Form 3', 'Bio', '2025-05-19', '2025-06-02', NULL),
(1020, 'Teresa Nduta', 'Form 4', 'Math', '2025-05-20', '2025-06-03', NULL);




INSERT INTO DailyVisits (visit_date, time_entered, time_out, admission_number, student_name, class, subject, hours_in_library) VALUES
('2025-05-01', '08:00:00', '09:00:00', 1001, 'Alice Kimani', 'Form 1', 'Bio', 1.00),
('2025-05-01', '09:10:00', '10:00:00', 1002, 'Brian Otieno', 'Form 2', 'Chem', 0.83),
('2025-05-01', '10:15:00', '11:15:00', 1003, 'Cynthia Wambui', 'Form 3', 'History', 1.00),
('2025-05-01', '11:20:00', '12:00:00', 1004, 'David Mwangi', 'Form 4', 'Math', 0.67),
('2025-05-01', '12:05:00', '13:00:00', 1005, 'Evelyn Njeri', 'Form 1', 'English', 0.92),
('2025-05-01', '13:10:00', '14:00:00', 1006, 'Felix Kiptoo', 'Form 2', 'CRE', 0.83),
('2025-05-01', '14:05:00', '15:00:00', 1007, 'Grace Muthoni', 'Form 3', 'Bio', 0.92),
('2025-05-01', '15:10:00', '16:00:00', 1008, 'Henry Maina', 'Form 4', 'Chem', 0.83),
('2025-05-01', '16:05:00', '17:00:00', 1009, 'Irene Achieng', 'Form 1', 'History', 0.92),
('2025-05-02', '08:00:00', '09:00:00', 1010, 'James Ouma', 'Form 2', 'Math', 1.00),
('2025-05-02', '09:10:00', '10:00:00', 1011, 'Kevin Kariuki', 'Form 3', 'English', 0.83),
('2025-05-02', '10:15:00', '11:15:00', 1012, 'Linda Chebet', 'Form 4', 'CRE', 1.00),
('2025-05-02', '11:20:00', '12:00:00', 1013, 'Mary Wanjiku', 'Form 1', 'Bio', 0.67),
('2025-05-02', '12:05:00', '13:00:00', 1014, 'Nancy Njeri', 'Form 2', 'Chem', 0.92),
('2025-05-02', '13:10:00', '14:00:00', 1015, 'Oscar Mutua', 'Form 3', 'History', 0.83),
('2025-05-02', '14:05:00', '15:00:00', 1016, 'Pauline Wambua', 'Form 4', 'Math', 0.92),
('2025-05-02', '15:10:00', '16:00:00', 1017, 'Quincy Kiplangat', 'Form 1', 'English', 0.83),
('2025-05-02', '16:05:00', '17:00:00', 1018, 'Rose Nyambura', 'Form 2', 'CRE', 0.92),
('2025-05-03', '08:00:00', '09:00:00', 1019, 'Samuel Kimani', 'Form 3', 'Bio', 1.00),
('2025-05-03', '09:10:00', '10:00:00', 1020, 'Teresa Nduta', 'Form 4', 'Math', 0.83);




