-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 07:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `AttendanceID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `AttendanceDate` date NOT NULL,
  `AttendanceStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`AttendanceID`, `StudentID`, `ClassID`, `AttendanceDate`, `AttendanceStatus`) VALUES
(3, 29, 3, '2023-06-22', 'Absent'),
(10, 29, 3, '2023-06-07', 'present');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `ClassID` int(11) NOT NULL,
  `ClassName` varchar(255) NOT NULL,
  `Year` varchar(10) NOT NULL,
  `TeacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`ClassID`, `ClassName`, `Year`, `TeacherID`) VALUES
(3, 'Object Oriented', '2023', 10);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `GradeID` int(11) NOT NULL,
  `SubjectID` varchar(225) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `Grade` varchar(10) NOT NULL,
  `GradeDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`GradeID`, `SubjectID`, `StudentID`, `Grade`, `GradeDate`) VALUES
(205, 'gsg', 29, 'A+', '2023-06-22');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `UserType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`UserID`, `Username`, `Password`, `UserType`) VALUES
(28, 'jhghj', 'vhjv', 'teacher'),
(29, 'Shahwaiz Ali', '6548635', 'teacher'),
(33, 'Ahmed Ali', '12345678', 'teacher'),
(35, 'Muhammad Faizan', '12345678', 'admin'),
(36, 'v ', 'dfav', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ContactNumber` varchar(20) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `GuardianName` varchar(255) NOT NULL,
  `GuardianContact` varchar(20) NOT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `AdmissionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `FullName`, `DateOfBirth`, `Gender`, `Address`, `ContactNumber`, `Email`, `GuardianName`, `GuardianContact`, `ClassID`, `AdmissionDate`) VALUES
(29, 'Muhammad Faizan', '2023-06-02', 'female', 'abc,Nazimabad', '+925498461312', 'faizan.raza.kk@gmail.com', 'Azad Ali', '56230336', 3, '2023-06-12'),
(30, 'Muhammad Faizan', '2023-06-01', 'male', 'ssuet', '+926465498465', 'faizan.raza.kk@gmail.com', 'Raza', '6454', 3, '2023-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `SubjectID` varchar(11) NOT NULL,
  `SubjectName` varchar(255) NOT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `TeacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`SubjectID`, `SubjectName`, `ClassID`, `TeacherID`) VALUES
('gsg', 'sb', 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `TeacherID` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `DateOfBirth` date NOT NULL,
  `PreferSubject` varchar(225) NOT NULL,
  `ExperienceYears` int(37) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `ContactNumber` varchar(20) NOT NULL,
  `LastQualification` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`TeacherID`, `FullName`, `Gender`, `DateOfBirth`, `PreferSubject`, `ExperienceYears`, `Email`, `ContactNumber`, `LastQualification`) VALUES
(10, 'hj', 'Male', '2023-06-08', 'bn', 2, 'mnb', 'b n', 'bkj'),
(12, 'hsdh', 'Female', '2023-06-08', 'mf', 4, 'vf', 'av', 'va');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `attendance_ibfk_2` (`ClassID`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`GradeID`),
  ADD KEY `SubjectID` (`SubjectID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `student_ibfk_1` (`ClassID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SubjectID`),
  ADD KEY `TeacherID` (`TeacherID`),
  ADD KEY `subject_ibfk_1` (`ClassID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`TeacherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `GradeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `TeacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `student` (`ClassID`) ON DELETE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`TeacherID`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`),
  ADD CONSTRAINT `grade_ibfk_3` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`) ON DELETE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`TeacherID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
