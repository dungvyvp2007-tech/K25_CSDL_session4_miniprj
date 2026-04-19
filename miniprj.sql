create database	miniproject1;
use miniproject1;

create table student (
	studentID int primary key auto_increment,
    fullName varchar(100) not null,
    dateOfBirth datetime default current_timestamp,
    email varchar(100) not null unique
    
);

INSERT INTO student (fullName, dateOfBirth, email) 
VALUES 
('Nguyen Thanh Tung', '2002-05-15', 'tung@gmail.com'),
('Le Mai Anh', '2003-08-20', 'maianh@gmail.com'),
('Tran Trung Duc', '2001-12-10', 'duc@gmail.com'),
('Pham Ngoc Linh', '2002-03-25', 'linh@gmail.com'),
('Vu Hoang Nam', '2003-01-05', 'nam@gmail.com');

create table teacher(
	teacherID int primary key auto_increment,
    fullName varchar(100) not null,
    email varchar(100) not null unique
);

INSERT INTO teacher (fullName, email) 
VALUES 
('Nguyen Van A', 'vana@example.com'),
('Tran Thi B', 'thib@example.com'),
('Le Van C', 'vanc@example.com'),
('Pham Minh D', 'minhd@example.com'),
('Hoang Lan E', 'lane@example.com');

create table course(
	courseID int primary key auto_increment,
    courseName varchar(100) not null,
    descripion varchar(255),
    quantity int not null,
    teacherID int not null,
    foreign key(teacherID) references teacher(teacherID)
);

INSERT INTO course (courseName, descripion, quantity, teacherID) 
VALUES 
('Java Basic', 'Lap trinh Java co ban', 30, 1),
('Python for Data', 'Phan tich du lieu voi Python', 25, 2),
('Web Front-end', 'HTML, CSS, ReactJS', 20, 3),
('Database Design', 'Thiet ke SQL Server/MySQL', 35, 4),
('Mobile App', 'Lap trinh Flutter/React Native', 15, 5);

create table enrollment(
	enrollmentID int primary key auto_increment unique,
	studentID int not null,
    courseID int not null,
    enrollment_date date,
    foreign key (courseID) references course(courseID),
    foreign key (studentID) references student(studentID)
);

INSERT INTO enrollment (studentID, courseID, enrollment_date) 
VALUES 
(1, 1, '2024-01-10'),
(2, 2, '2024-01-11'),
(3, 3, '2024-01-12'),
(4, 4, '2024-01-13'),
(5, 5, '2024-01-14');

create table score(
	scoreID int primary key auto_increment,
	studentID int not null,
    courseID int not null unique,
    hackathonScore float check(hackathonScore >= 0 and hackathonScore <= 10),
    finalTestScore float check(finalTestScore >= 0 and finalTestScore <= 10),
    foreign key (studentID) references student(studentID),
    foreign key (courseID) references course(courseID)
);

INSERT INTO score (studentID, courseID, hackathonScore, finalTestScore)
VALUES 
(1, 1, 8.5, 9.0),
(2, 2, 7.0, 8.0),
(3, 3, 9.5, 8.5),
(4, 4, 6.5, 7.5),
(5, 5, 8.0, 8.0);

update student
set email = 'dung@gmail.com'
where studentID = 5;

update course
set descripion = 'Lap trinh Java Basic'
where courseID = 1;

update score
set finalTestScore = 6.7
where scoreID = 1;

delete from enrollment
where enrollmentID = 1;

DELETE FROM score 
WHERE studentID = 3 AND courseID = 1;

select * from student ;
select * from teacher;
select * from course;
select * from enrollment;
select * from score;
