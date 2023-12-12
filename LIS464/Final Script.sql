CREATE TABLE Requisite (
ReqID INT AUTO_INCREMENT NOT NULL,
CourseID INT,
ReqCourseID INT,
ReqGPA DECIMAL(3,2) NULL DEFAULT 2.0,
ReqDateEstablished DATE NOT NULL,
PRIMARY KEY (ReqID),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
FOREIGN KEY (ReqCourseID) REFERENCES Course(CourseID),
INDEX Course (ReqID, CourseID, ReqCourseID, ReqDateEstablished)
);

CREATE TABLE Semester (
SemID INT AUTO_INCREMENT NOT NULL,
SemName CHAR(10) NOT NULL,
SemYEar YEAR NOT NULL,
SemStartDate DATE NULL, 
SemEndDate DATE NULL,
PRIMARY KEY (SemID) ,
INDEX Sem (SemID, SemName, SemYear)
);

CREATE TABLE Course (
CourseID INT AUTO_INCREMENT NOT NULL,
CourseName VARCHAR (75) NULL,
CourseDescription TEXT NULL, 
CreditHours TINYINT DEFAULT 3,
PRIMARY KEY (CourseID),
INDEX CourseIndex (CourseID)
);

CREATE TABLE Class (
ClassID INT AUTO_INCREMENT NOT NULL,
SemesterID INT NOT NULL,
ClassRegisterDate TIMESTAMP NULL,
ClassLocation VARCHAR (50) NULL,
CourseID INT NOT NULL,
LecturerID INT NULL,
PRIMARY KEY (ClassID),
FOREIGN KEY (SemesterID) REFERENCES Semester(SemID),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
FOREIGN KEY (LecturerID) REFERENCES Lecturer(LecturerID),
INDEX Info (ClassID, SemesterID, ClassRegisterDate, ClassLocation, CourseID, LecturerID)
);

CREATE TABLE StudentClasses (
StuClassID INT AUTO_INCREMENT NOT NULL,
StuID INT NOT NULL,
ClassID INT NOT NULL,
StuClassDate TIMESTAMP NOT NULL,
PRIMARY KEY (StuClassID),
FOREIGN KEY (StuID) REFERENCES Student(StuID),
FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
INDEX Stu (StuClassID, StuID, ClassID)
);

CREATE TABLE Lecturer (
LecturerID INT AUTO_INCREMENT NOT NULL,
LecLastName VARCHAR (25) NOT NULL,
LecFirstName VARCHAR (25) NOT NULL,
LecMiddleName VARCHAR (25) NULL,
LecEmail VARCHAR (50) NOT NULL,
LecWTel CHAR (10) NULL,
INDEX Lec (LecturerID, LecLastName, LecFirstName, LecEmail, LecWTel)
);

CREATE TABLE Student (
StuID INT AUTO_INCREMENT NOT NULL,
StuLastName VARCHAR(25) NOT NULL,
StuFirstName VARCHAR(25) NOT NULL,
StuMiddleName VARCHAR (25) NULL,
StuEmail VARCHAR (50) NOT NULL,
StuPhone CHAR(10) NULL,
StuStreet VARCHAR(100),
StuCity VARCHAR(25),
StuState CHAR(2),
StuZipCode CHAR(10),
PRIMARY KEY (StuID),
INDEX StudentIndex (StuID, StuLastName, StuFirstName, StuEmail, StuPhone, StuStreet, StuCity, StuState, StuZipCode)
);

ALTER TABLE StudentClasses
ADD CONSTRAINT FK_NewStuID
FOREIGN KEY (NewStuID)
REFERENCES Student (NewStuID);

ALTER TABLE Student
ADD PRIMARY KEY (NewStuID);