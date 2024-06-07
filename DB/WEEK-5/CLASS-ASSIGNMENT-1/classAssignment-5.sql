CREATE DATABASE classwork5;
use classwork5;

create table STUDENTS(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    age INT,
    department VARCHAR(150),
    gpa FLOAT(1),
    birth_city VARCHAR(150),
    KEY(birth_city)
);

insert into STUDENTS(name, surname, age, department, gpa, birth_city)
VALUES
('Mazahir', 'Mammadov', 19, 'Information Security', 92, 'Moscow'),
('Asmar', 'Shikhamirli', 19, 'Information Security', 92, 'Gakh'),
('Asmar', 'Hajizada', 19, 'Information Security', 93, 'Gazakh'),
('Artoghrul', 'Yusifli', 18, 'Information Security', 73, 'Shaki'),
('Nihat', 'Aliyev', 18, 'Information Security', 81, 'Shaki'),
('Ipak', 'Mammadli', 21, 'Computer Engineering', 95, 'Ordubad'),
('Javahir', 'Mammadli', 23, 'Computer Engineering', 97, 'Ordubad'),
('Malak', 'Susanli', 21, 'Computer Engineering', 53, 'Ordubad'),
('Eshgin', 'Hasanov', 19, 'Information Security', 73, 'Tovuz'),
('Isgandar', 'Isgandarov',19, 'Information Security', 99, 'Baku'),
('Nilufar', 'Seyidli',19, 'Economics', 100, 'Sumgayit'),
('Elmir', 'Yusifli',20, 'Economics', 55, 'Baku'),
('Fuad', 'Hajiyev',19, 'Economics', 89, 'Sumgayit'),
('Javidan', 'Zeynalov',19, 'Chemical Engineering', 100, 'Moscow'),
('Mehin', 'Huseyn',19, 'Chemical Engineering', 65, 'Baku'),
('Farman', 'Ahmadov',19, 'Chemical Engineering', 99, 'Ganja'),
('Azer', 'Verdiyev',19, 'Chemical Engineering',82, 'Ganja'),
('Asiman', 'Hamzayev',18, 'Mathematics', 79, 'Ismayilli');

-- TASK1
select CONCAT(name,' ',surname) as 'Name/Surname', age, birth_city 
from students;

-- TASK2
select CONCAT(SUBSTRING(surname, 1, 1), '.', name, ', ', age) as 'Surname/Name/Age', 
birth_city from students;

-- TASK3
select GROUP_CONCAT(SUBSTRING(surname, 1, 1), '.', name, '-', age) as 'Surname/Name/Age', 
birth_city from students 
group by birth_city;

-- TASK4
select GROUP_CONCAT(SUBSTRING(surname, 1, 1), '.', name, '-', age) as 'Surname/Name/Age', 
department from students 
group by department;

-- TASK5
select MIN(gpa) as 'minimum gpa', MAX(gpa) as 'maxiumum gpa', AVG(gpa) as 'average gpa' from students;

-- TASK6
select CONCAT(name,' ', surname) as student, gpa 
from students 
where gpa > (select AVG(gpa) from students);

-- TASK7
select count(*) as 'count', department 
from students 
group by department;

-- TASK8
select ROUND(AVG(gpa), 2) as 'average gpa by city', birth_city 
from students 
group by birth_city;

-- TASK9
select CONCAT(name, ' ', surname), department, 
case 
    when gpa > 90 then 'A'
    when gpa > 80 then 'B'
    when gpa > 70 then 'C'
    when gpa > 60 then 'D'
    else 'F'
end
as 'GRADE' 
from students;