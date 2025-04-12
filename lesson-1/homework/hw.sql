EASY
Data refers to raw facts and figures that have not yet been processed or organized. These can include numbers, text, images, or any other type of information that can be recorded and stored. 
A database is an organized collection of data or a type of data store based on the use of a database management system (DBMS)
A relational database is a type of database that organizes data into rows and columns, which collectively form a table where the data points are related to each other.
A table is a basic structure in a relational database used to organize data into rows and columns. Each row represents a single record, and each column represents a field or attribute of the record.
MEDIUM
create database schoolDB; 
go
Create table Students (StudentID INT PRIMARY KEY, Name VARCHAR(50),  Age INT);
SQL Server: A database system that stores and manages data.
SSMS: A tool (graphical interface) used to work with SQL Server.
SQL: The language used to write queries and commands for the database.
DQL (Data Query Language)
Used to get data
Command: SELECT
DML (Data Manipulation Language)
Used to add, update, or delete data
Commands: INSERT, UPDATE, DELETE
DDL (Data Definition Language)
Used to create or change tables/structures
Commands: CREATE, ALTER, DROP
DCL (Data Control Language)
Used to control access
Commands: GRANT, REVOKE
TCL (Transaction Control Language)
Used to manage transactions
Commands: COMMIT, ROLLBACK, SAVEPOINT
INSERT INTO Students (StudentID, Name, Age) VALUES
(1, 'Begis', 26),
(2, 'Elbek', 27),
(3, 'Azamat', 19);
