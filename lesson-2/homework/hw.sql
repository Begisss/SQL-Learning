BASIC level 
Create table Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))
insert into employees values (1, 'Damir', 50000)
insert into employees values (2, 'Amir', 75000),
                             (3, 'Sultan', 92000)
select * from employees
update employees
set salary=65000
where empID=1
DELETE FROM Employees
WHERE EmpID = 2
DELETE = Only deletes the specific rows, table and structure remain.
TRUNCATE = Removes all data, but keeps the table structure.
DROP = Completely removes the table from the database
Alter table Employees
Alter column name Varchar(100)
alter table employees
add Department Varchar(50) 
Alter table Employees
Alter column Salary Float
create table departments (ID int primary key, name varchar(50))
Truncate table Employees
Intermediate-Level
insert into departments values (1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Operations');
Update  Employees
Set Department = 'Management'
Where Salary > 5000;
Delete from Employees;
ALTER TABLE Employees
DROP COLUMN Department
EXEC sp_rename 'Employees', 'StaffMembers';
drop table departments
ADVANCED LEVEL
Create  table Products  (ProductID INT Primary Key, ProductName VARCHAR(50), Category VARCHAR(50), Price DECIMAL)
alter table products
add constraint tekshir check (price >0)
alter table products 
add stockquantity int default 50
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES 
(9, 'Laptop', 'Electr', 1200.99, 50),
(2, 'Smartphone', 'Electro', 799.49, 100),
(3, 'Headphones', 'Electron', 199.99, 150),
(4, 'Monitor', 'Electronics', 350.00, 75),
(5, 'Keyboard', 'Accessories', 50.00, 200);
SELECT *
INTO Products_Backup
FROM Products;
EXEC sp_rename 'Products', 'Inventory';
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);



