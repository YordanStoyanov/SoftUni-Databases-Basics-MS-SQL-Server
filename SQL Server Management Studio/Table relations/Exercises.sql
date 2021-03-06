CREATE DATABASE EntityRelationsDemo

USE [EntityRelationsDemo]

CREATE TABLE Passports(
	PassportID INT PRIMARY KEY,
	PassportNumber NVARCHAR(30) NOT NULL
)

SELECT * FROM Passports

CREATE TABLE Persons(
	PersonId INT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	Salary DECIMAL(7, 2) NOT NULL,
	PassportID INT NOT NULL FOREIGN KEY REFERENCES Passports(PassportID) UNIQUE
)

SELECT * FROM Persons

INSERT INTO Passports(PassportID, PassportNumber)
VALUES
	(101, 'N34FG21B'),
	(102, 'K65LO4R7'),
	(103, 'ZE657QP2')

INSERT INTO Persons(PersonId, FirstName, Salary, PassportID)
VALUES
	(1, 'Roberto', 43300.00, 102),
	(2, 'Tom', 56100.00, 103),
	(3, 'Yana', 60200.00, 101)

SELECT * FROM Persons

SELECT * FROM Passports

CREATE TABLE Manufacturers(
	ManufacturerID INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	EstablishedOn DATE NOT NULL
)

CREATE TABLE Models(
	ModelID INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers(ManufacturerID, [Name], EstablishedOn)
	VALUES
		(1, 'BMW', '07/03/1916'),
		(2, 'Tesla', '01/01/2003'),
		(3, 'Lada', '01/05/1966')

INSERT INTO Models(ModelID, [Name], ManufacturerID)
	VALUES
		 (101, 'X1', 1)
		,(102, 'i6', 1)
		,(103, 'Model S', 2)
		,(104, 'Model X', 2)
		,(105, 'Model 3', 2)
		,(106, 'Nova', 3)

CREATE TABLE Exams(
	ExamID INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE StudentsExams(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	ExamID INT FOREIGN KEY REFERENCES Exams(ExamID)
)

INSERT INTO Students(StudentID, [Name])
	VALUES
		(1, 'Mila'),
		(2, 'Toni'),
		(3, 'Ron')

INSERT INTO Exams(ExamID, [Name])
	VALUES
		(101, 'SpringMVC'),
		(102, 'Neo4j'),
		(103, 'Oracle 11g')

INSERT INTO StudentsExams(StudentID, ExamID)
	VALUES
		(1, 101),
		(1,	102),
		(2,	101),
		(3,	103),
		(2,	102),
		(2,	103)

SELECT * FROM Students

SELECT * FROM Exams

SELECT * FROM StudentsExams

CREATE TABLE Cities(
	CityID INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50)
)

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	Birthday DATE NOT NULL,
	CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY NOT NULL,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE Itemtypes(
	ItemTypeID INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Item(
	ItemID INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	ItemTypeID INT FOREIGN KEY REFERENCES Itemtypes(ItemTypeID)
)

CREATE TABLE OrderItems(
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
	ItemID INT FOREIGN KEY REFERENCES Item(ItemID)
)