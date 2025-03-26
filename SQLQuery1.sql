use master
go
CREATE DATABASE PRJ301_Project;
GO
USE PRJ301_Project;
GO

-- Bảng Role (Quyền hạn: sinh viên, giáo viên)
CREATE TABLE Role (
    Role_ID INT PRIMARY KEY,
    Role_Name NVARCHAR(50) NOT NULL
);
GO

-- Bảng Account (Lưu thông tin đăng nhập)
CREATE TABLE Account (
    Account_ID INT PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Role_ID INT NOT NULL,
    CONSTRAINT FK_Account_Role FOREIGN KEY (Role_ID) REFERENCES Role(Role_ID) ON DELETE CASCADE
);
GO

-- Bảng Department (Khoa)
CREATE TABLE Department (
    Department_ID NVARCHAR(50) PRIMARY KEY,
    Department_Name NVARCHAR(100) NOT NULL
);
GO

-- Bảng Class (Lớp học)
CREATE TABLE Class (
    Class_ID INT IDENTITY(1,1) PRIMARY KEY,
    Class_Name NVARCHAR(50) NOT NULL,
    Department_ID NVARCHAR(50),
    CONSTRAINT FK_Class_Department FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
);
GO

-- Bảng Student (Sinh viên)
CREATE TABLE Student (
    Student_ID NVARCHAR(20) PRIMARY KEY,
    Full_Name NVARCHAR(100) NOT NULL,
    BirthYear INT NOT NULL,
    Gender NVARCHAR(10) NOT NULL CHECK (Gender IN (N'Nam', N'Nữ')), -- Chỉ chấp nhận 'Nam' hoặc 'Nữ'
	Phone NVARCHAR(20) not null,
	Email NVARCHAR(20) not null,
	Address NVARCHAR(50) not null,
    Class_ID INT,
    Account_ID INT UNIQUE,
    CONSTRAINT FK_Student_Class FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID) ON DELETE CASCADE,
    CONSTRAINT FK_Student_Account FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID) ON DELETE CASCADE
);
GO

-- Bảng Teacher (Giáo viên)
CREATE TABLE Teacher (
    Teacher_ID NVARCHAR(20) PRIMARY KEY,
    Full_Name NVARCHAR(100) NOT NULL,
	BirthYear INT NOT NULL,
    Gender NVARCHAR(10) NOT NULL CHECK (Gender IN (N'Nam', N'Nữ')), -- Chỉ chấp nhận 'Nam' hoặc 'Nữ'
	Phone NVARCHAR(20) not null,
	Email NVARCHAR(20) not null,
	Address NVARCHAR(50) not null,
    Class_ID INT,
    Account_ID INT UNIQUE,
    CONSTRAINT FK_Teacher_Class FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID) ON DELETE CASCADE,
    CONSTRAINT FK_Teacher_Account FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID) ON DELETE CASCADE
);
GO

-- Bảng Credit (Số tín chỉ)
CREATE TABLE Credit (
    Credit_ID INT PRIMARY KEY,
    Credit_Value INT NOT NULL
);
GO

-- Bảng Subject (Môn học)
CREATE TABLE Subject (
    Subject_ID INT PRIMARY KEY,
    Subject_Name NVARCHAR(100) NOT NULL,
    Credit_ID INT NOT NULL,
    CONSTRAINT FK_Subject_Credit FOREIGN KEY (Credit_ID) REFERENCES Credit(Credit_ID) ON DELETE CASCADE
);
GO

-- Bảng Semester (Học kỳ)
CREATE TABLE Semester (
    Semester_ID INT PRIMARY KEY,
    Semester_Name NVARCHAR(50) NOT NULL
);
GO

-- Bảng Grade (Điểm số)
CREATE TABLE Grade (
    Grade_ID INT PRIMARY KEY,
    Mid_term FLOAT CHECK (Mid_term BETWEEN 0 AND 10), -- Điểm giữa kỳ từ 0 đến 10
    Final_Exam FLOAT CHECK (Final_Exam BETWEEN 0 AND 10), -- Điểm cuối kỳ từ 0 đến 10
    Total_Grade FLOAT CHECK (Total_Grade BETWEEN 0 AND 10), -- Tổng điểm từ 0 đến 10
    Student_ID NVARCHAR(20),
    Subject_ID INT,
    Semester_ID INT,
    CONSTRAINT FK_Grade_Student FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    CONSTRAINT FK_Grade_Subject FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID) ON DELETE CASCADE,
    CONSTRAINT FK_Grade_Semester FOREIGN KEY (Semester_ID) REFERENCES Semester(Semester_ID) ON DELETE CASCADE
);

GO

-- Bảng Subject_Teacher (Môn học do giáo viên giảng dạy)
CREATE TABLE Subject_Teacher (
    Subject_Teacher_ID INT PRIMARY KEY,
    Subject_ID INT,
    Teacher_ID NVARCHAR(20),
    CONSTRAINT FK_Subject_Teacher_Subject FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID) ON DELETE CASCADE,
    CONSTRAINT FK_Subject_Teacher_Teacher FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID) ON DELETE CASCADE
);
GO

--chèn dữ liệu

INSERT INTO Role (Role_ID, Role_Name) VALUES
(1, N'Admin'),
(2, N'Teacher'),
(3, N'Student');


INSERT INTO Account (Account_ID, Username, Email, Password, Role_ID) VALUES
(100, 'admin', 'admin@gmail.com', '123', 1),
(101,N'Thái An', 'an@gmail.com', '123', 3),
(102, N'Ngọc Hải', 'hai@gmail.com', '123', 3),
(103, N'Thu Huyền', 'huyen@gmail..com', '123', 3),
(104, N'Đình Tuân', 'tuan@gmail.com', '123', 3),
(105, N'Văn Đức', 'duc@gmail.com', '123', 3),
(106, N'Hải Hiệp', 'hiep@gmail.com', '123', 3),
(107, N'Phí Hi', 'hi@gmail.com', '123', 3),
(108, N'Linh Nhi', 'nhi@gmail.com', '123', 3),
(109, N'Phương Hằng', 'hang@gmail.com', '123', 3),
(110, N'Ngọc Trúc', 'ngoc@gmail.com', '123', 3),
(111, N'Ngọc Thọ', 'thopn3@gmail.com', '123', 2),
(112, N'Thiên Hoàng', 'hoang@gmail.com', '123', 2),
(113, N'Hải Hưng', 'hung@gmail.com', '123', 2),
(114, N'Ngọc Lan', 'lan@gmail.com', '123', 2),
(115, N'Hải Yến', 'yen@gmail.com', '123', 2);

INSERT INTO Department (Department_ID, Department_Name) VALUES
(1, N'Công nghệ thông tin'),
(2, N'Kinh tế'),
(3, N'Luật'),
(4, N'Y dược'),
(5, N'Môi trường'),
(6, N'Xây dựng'),
(7, N'Cơ khí'),
(8, N'Quản trị kinh doanh'),
(9, N'Địa chất'),
(10, N'Khoa học máy tính');

INSERT INTO Class ( Class_Name, Department_ID) VALUES
( N'Lớp CNTT 1', 1),
( N'Lớp CNTT 2', 1),
( N'Lớp Kinh tế 1', 2),
( N'Lớp Kinh tế 2', 2),
( N'Lớp Luật 1', 3),
( N'Lớp Luật 2', 3),
( N'Lớp Y dược 1', 4),
(N'Lớp Y dược 2', 4),
(N'Lớp Xây dựng 1', 6),
(N'Lớp Khoa học máy tính 1', 10);

INSERT INTO Student (Student_ID, Full_Name, BirthYear, Gender, Phone, Email, Address, Class_ID, Account_ID) VALUES
('S001', N'Phạm Thái An', 2002, N'Nam', '0987654321', 'an@gmail.com',N'Hà Nội', 1, 101),
('S002', N'Nguyễn Ngọc Hải', 2001, N'Nam', '0987654322', 'hai@gmail.com',N'Hà Nội', 2, 102),
('S003', N'Vương Thu Huyền', 2003, N'Nữ', '0987654323', 'huyen@gmail.com',N'Hà Nội', 3, 103),
('S004', N'Tạ Đình Tuân', 2002, N'Nam', '0987654324', 'tuan@gmail.com',N'Hà Nội', 4, 104),
('S005', N'Ngô Văn Đức', 2000, N'Nam', '0987654325', 'duc@gmail.com',N'Hà Nội', 5, 105),
('S006', N'Lê Hải Hiệp', 2001, N'Nam', '0987654326', 'hiep@gmail.com',N'Hà Nội', 6, 106),
('S007', N'Hoàng Phí Hi', 2002, N'Nam', '0987654327', 'hoang@gmail.com',N'Hà Nội', 7, 107),
('S008', N'Nguyễn Linh Nhi', 2003, N'Nữ', '0987654328', 'nhi@gmail.com',N'Hà Nội', 8, 108),
('S009', N'Lê Phương Hằng', 2000, N'Nữ', '0987654329', 'hang@gmail.com',N'Hà Nội', 9, 109),
('S010', N'Đinh Ngọc Trúc', 2001, N'Nữ', '0987654330', 'ngoc@gmail.com',N'Hà Nội', 10, 110);


INSERT INTO Teacher (Teacher_ID, Full_Name, BirthYear, Gender, Phone, Email, Address, Class_ID, Account_ID) VALUES
('T001', N'Phan Ngọc Thọ', 1985, N'Nam', '0987654341', 'thopn3@gmail.com',N'Hà Nội', 1, 111),
('T002', N'Lê Thiên Hoàng', 1987, N'Nam', '0987654342', 'hoang@gmail.com',N'Hà Nội', 2, 112),
('T003', N'Đinh Hải Hưng', 1980, N'Nam', '0987654343', 'hung@gmail.com',N'Hà Nội', 3, 113),
('T004', N'Nguyễn Ngọc Lan', 1979, N'Nữ', '0987654344', 'lan@gmail.com',N'Hà Nội', 4, 114),
('T005', N'Lê Hải Yến', 1983, N'Nữ', '0987654345', 'yen@gmail.com',N'Hà Nội', 5, 115);

INSERT INTO Credit (Credit_ID, Credit_Value) VALUES
(1, 3),
(2, 4),
(3, 2),
(4, 5),
(5, 3),
(6, 2),
(7, 3),
(8, 4),
(9, 3),
(10, 4);

INSERT INTO Subject (Subject_ID, Subject_Name, Credit_ID) VALUES
(101, N'Trí tuệ nhân tạo', 1),
(102, N'Lập trình Java', 2),
(103, N'Kế toán doanh nghiệp', 3),
(104, N'Luật thương mại', 4),
(105, N'Giải phẫu học', 5),
(106, N'Môi trường và con người', 6),
(107, N'Cơ khí động lực', 7),
(108, N'Quản trị nhân sự', 8),
(109, N'Địa chất cơ bản', 9),
(110, N'Lập trình web', 10);

INSERT INTO Semester (Semester_ID, Semester_Name) VALUES
(1, 'SPRING2024'),
(2, 'SUMMER2024'),
(3, 'FALL2024'),
(4, 'SPRING2025'),
(5, 'SUMMER2025'),
(6, 'FALL2025'),
(7, 'SPRING2026'),
(8, 'SUMMER2026'),
(9, 'FALL2026'),
(10,'SPRING2027');

INSERT INTO Grade (Grade_ID, Mid_term, Final_Exam, Total_Grade, Student_ID, Subject_ID, Semester_ID) VALUES
(1, 7.5, 8.0, 7.8, 'S001', 101, 1),
(2, 6.0, 7.5, 7.0, 'S002', 102, 1),
(3, 8.0, 9.0, 8.5, 'S003', 103, 2),
(4, 5.5, 6.5, 6.2, 'S004', 104, 2),
(5, 9.0, 9.5, 9.2, 'S005', 105, 3),
(6, 4.5, 5.5, 5.0, 'S006', 106, 3),
(7, 7.0, 7.5, 7.3, 'S007', 107, 4),
(8, 6.5, 7.0, 6.8, 'S008', 108, 4),
(9, 8.5, 9.0, 8.7, 'S009', 109, 5),
(10, 5.0, 6.0, 5.5, 'S010', 110, 5);

INSERT INTO Subject_Teacher (Subject_Teacher_ID, Subject_ID, Teacher_ID) VALUES
(1, 101, 'T001'),
(2, 102, 'T002'),
(3, 103, 'T003'),
(4, 104, 'T004'),
(5, 105, 'T005'),
(6, 106, 'T001'),
(7, 107, 'T002'),
(8, 108, 'T003'),
(9, 109, 'T004'),
(10, 110, 'T005');


