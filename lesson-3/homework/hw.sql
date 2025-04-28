BULK INSERT is a command in SQL Server used to efficiently import large volumes of data from a file (like CSV or text) into a database table. 
It is faster than row-by-row inserts because it processes the data in bulk.
Purposes:
1.Quickly load large datasets into SQL Server.
2.Useful for ETL (Extract, Transform, Load) operations.
3.Supports various file formats with delimiters, can skip headers, etc.
CSV (Comma Separated Values)
TXT (Plain text with delimiters)
XML (Extensible Markup Language)
BCP format (Bulk Copy Program native format)
CREATE TABLE Products 
(ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2));
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 999.99),
(2, 'Smartphone', 599.50),
(3, 'Keyboard', 49.99);
CREATE TABLE students (ID INT, Name VARCHAR(50) NULL);
CREATE TABLE Steamusers (ID INT,Name VARCHAR(50) NOT NULL);
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
-- This query selects all products with a price greater than 500
SELECT * FROM Products WHERE Price > 500;
CREATE TABLE Categories ( CategoryID INT PRIMARY KEY,CategoryName VARCHAR(50) UNIQUE);
CREATE TABLE Employees (EmployeeID INT IDENTITY(1,1) PRIMARY KEY,   -- auto increments starting at 1, step 1
EmployeeName VARCHAR(100));
BULK INSERT Products FROM 'C:\Data\products.txt'
WITH ( FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2);
CREATE TABLE Products (product_id INT PRIMARY KEY,  product_name VARCHAR(100) NOT NULL,
category_id INT, FOREIGN KEY (category_id) REFERENCES Categories(category_id));
CREATE TABLE Employees (EmployeeID INT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50));
CREATE TABLE Products (ProductID INT PRIMARY KEY,ProductName VARCHAR(100) NOT NULL,CategoryName VARCHAR(50) UNIQUE);
PRIMARY KEY: Unique, non-nullable, one per table.
UNIQUE KEY: Unique, nullable (only one null), multiple allowed.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK (Price > 0);
ALTER TABLE Products
ADD Stock INT NOT NULL;
SELECT  ProductID,ProductName, ISNULL(Stock, 0) AS Stock FROM  Products;
-- When creating a table
CREATE TABLE Orders ( order_id INT PRIMARY KEY,  customer_id INT FOREIGN KEY REFERENCES Customers(customer_id));
-- Adding later
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);
17.CREATE TABLE Customers (CustomerID INT PRIMARY KEY,   CustomerName VARCHAR(100) NOT NULL, 
  Age INT CHECK (Age >= 18) );
18.CREATE TABLE students (studentID INT IDENTITY(100,10) PRIMARY KEY, studentName VARCHAR(100));
CREATE TABLE OrderDetails 
   (OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID));
SELECT  ProductID,ProductName, ISNULL(Stock, 0) AS Stock
FROM  Products;
-- If the Stock column has NULL for some products, the output will show 0 instead of NULL for those products.
SELECT CustomerID, COALESCE(Email, Phone, 'No contact method provided') AS PreferredContact
FROM  Customers;
-- If Email is NULL and Phone is '123-456-7890', the output will show '123-456-7890'.
-- If both Email and Phone are NULL, the output will show 'No contact method provided'.
CREATE TABLE Employees 
    (EmpID INT PRIMARY KEY,          -- Primary Key on EmpID
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,     -- Unique Key on Email
    HireDate DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL);
-- Create the parent table Orders
CREATE TABLE Orders
    (OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT NOT NULL);
-- Create the child table OrderDetails with a FOREIGN KEY
CREATE TABLE OrderDetails 
    (OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE);
