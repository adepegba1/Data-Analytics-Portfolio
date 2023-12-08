CREATE DATABASE Pro_db;
USE pro_db;

-- Create Departments table: DepartmentID, Departmentname
CREATE TABLE departments(
DepartmentId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
DepartmentName VARCHAR(50));
-- INSERTING VALUES INTO DEPARTMENTS TABLES
INSERT INTO Departments(departmentName) VALUES
('Sales'), ('Marketing'), ('Finance'), ('Customer Services'), ('I.T');

-- Create Employees table :EmployeeID, FirstName, LastName,DepartmentID
CREATE TABLE employees(
EmployeeId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
FirstName VARCHAR(20),
LastName VARCHAR(20),
DepartmentId INT, FOREIGN KEY (departmentId) REFERENCES departments(departmentid));
-- INSERTING VALUES INTO EMPLOYEES
INSERT INTO employees (firstname, lastname, departmentId) VALUES
('Adewale', 'Bunmi', 2),
('James',  'Okafor', 2),
('Taiwo',  'Janet', 1),
('Yusuf',  'Jamiu', 1),
('Tunji',  'Dolapo', 3),
('Shina',  'Esther', 3),
('Boluwatife',  'Dara', 4); 

-- Create Projects table: ProjectID, ProjectName
CREATE TABLE projects(
projectId INT PRIMARY KEY AUTO_INCREMENT,
ProjectName VARCHAR(50));
-- INSERTING VALUES INTO TABLES
INSERT INTO projects(projectName) VALUES
('Greystone'), ('Apex League'), ('Super Alpha'), ('Firstcall Fund Raiser');

-- CREATE  Assignments table: AssignmentID, EmployeeID, DepartmentID, ProjectID
CREATE TABLE assignments(
AssignmentId INT PRIMARY KEY AUTO_INCREMENT,
EmployeeId INT, FOREIGN KEY(employeeid) REFERENCES employees(employeeId),
DepartmentId INT, FOREIGN KEY(departmentId) REFERENCES departments(departmentId),
ProjectId INT, FOREIGN KEY(projectId) REFERENCES projects(projectId));
-- INSERTING VALUES INTO ASSIGNMENTS
INSERT INTO assignments(employeeid, departmentid, projectid) VALUES
(2, 5, 1),
(3, 2, 3),
(4, 3, 2),
(5, 5, 1),
(7, 2, 3),
(2, 5, 2);

						-- QUESTIONS 
-- 1. Retrieve the full name of employees and the project name they are assigned to
SELECT CONCAT(firstName, ' ',lastName) AS full_name, projectName
FROM employees emp
INNER JOIN assignments ass
ON emp.employeeID = ass.employeeid
INNER JOIN projects pro
ON ass.projectId = pro.projectId;

-- 2. List all employees in the all department.
SELECT employeeid, CONCAT(firstName, ' ',lastName) as Full_name, departmentname
FROM employees emp
INNER JOIN departments depart
ON emp.departmentid = depart.departmentId
ORDER BY departmentname;
-- 3. Find the number of employees assigned to each project
SELECT pro.projectId, projectName, COUNT(ass.projectid) AS numbersofEmployees
FROM projects pro 
INNER JOIN assignments ass
ON pro.projectId = ass.projectid
GROUP BY projectId, projectName;

-- 4. List the employees who are not assigned to any project.
SELECT emp.employeeid, FirstName, Lastname, emp.Departmentid, ass.projectid
FROM employees emp
LEFT JOIN assignments ass
ON emp.employeeid = ass.employeeid
WHERE ass.projectid IS NULL;

-- 5. Get the department name for each employee and the project name they are working on.
SELECT dep.departmentname, emp.employeeID, CONCAT(firstName, ' ',lastName) as Full_name, pro.projectname
FROM assignments ass
INNER JOIN departments dep
ON dep.departmentid = ass.departmentid
INNER JOIN employees emp
ON emp.employeeid = ass.employeeid
INNER JOIN projects pro
ON pro.projectid = ass.projectid
ORDER BY 1, 4;
-- 6. Find the number of employees in each department who are working on ProjectID 2.
SELECT projectname, departmentname, COUNT(pro.projectid) AS NumberofEmployees
FROM projects pro
INNER JOIN assignments ass
ON pro.projectId = ass.projectid
INNER JOIN departments dep
ON dep.departmentid = ass.departmentid
WHERE pro.projectid = 2
GROUP BY projectname, departmentname;