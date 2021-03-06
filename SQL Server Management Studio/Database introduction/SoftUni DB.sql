SELECT * FROM Employees

SELECT * FROM Towns

INSERT INTO Towns([Name])
	VALUES
		('Sofia'),
		('Plovdiv'),
		('Varna'),
		('Burgas');

SELECT * FROM Departments

INSERT INTO Departments([Name])
	VALUES
		('Engineering'),
		('Sales'),
		('Marketing'),
		('Software Development'),
		('Quality Assurance');

SELECT * FROM Towns

SELECT * FROM Employees

SELECT * FROM Departments


INSERT INTO Employees([FirstName], 
						[MiddleName], 
						[LastName], 
						[JobTitle], 
						[DepartmentId], 
						[HireDate], 
						[Salary])
	VALUES
		('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '02/01/2013', 3500.00),
		('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '03/02/2004', 4000.00),
		('Maria', 'Petrova', 'Ivanova',	'Intern', 5, '08/28/2016', 525.25),
		('Georgi', 'Teziev', 'Ivanov',	'CEO', 2,	'12/09/2007',	3000.00),
		('Peter', 'Pan', 'Pan',	'Intern', 3, '08/28/2016', 599.88)


SELECT * FROM Towns
	ORDER BY [Name] ASC

SELECT * FROM Departments
	ORDER BY [Name] ASC

SELECT * FROM Employees
	ORDER BY [Salary] ASC

UPDATE Employees
SET Salary += Salary * (10 / 100);

SELECT Salary FROM Employees