select p.ProductName, s.SupplierName from products as P
cross join Suppliers as S
select d.DepartmentName, e.name   from departments as D 
cross join Employees as E
select s.suppliername, p.productname from products as p
join Suppliers as s
on p.SupplierID = s.SupplierID
 select  CONCAT_WS(' ', c.firstname, lastname) as Fullname, o.orderid from customers as C
 join orders as o
 on c.customerid = o.customerid
select s.Name, c.courseName from Students as s
cross join courses as c
 select p.productname , o.orderid from Products p
  join orders o
on p.ProductID = o.productid
  select e.name ,d.departmentname from Employees as e
  join Departments d
  on e.DepartmentID = d.DepartmentID
select s.StudentName,  e.CourseID from   Students s
join Enrollments e on s.StudentID = e.StudentID;
 select   o.OrderID,
    o.CustomerID,
    p.PaymentID,
    p.Amount,
    p.PaymentDate from Payments as p
 join orders as o
 on p.OrderID = o.orderid
 select o.orderid , p.ProductName  from orders as o
 join Products as p
 on o.productid = p.ProductID
 where p.Price > 100
 select e.name ,d.departmentname from Employees as e
 join Departments as d
 on e.DepartmentID <> d.DepartmentID

  SELECT  o.Quantity AS OrderedQuantity, p.StockQuantity FROM  Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE  o.Quantity > p.StockQuantity;
 select CONCAT_WS (' ', firstname, lastname) as fullname, s.productid from Customers as c
  join sales as s
  on c.CustomerID = s.CustomerID
  where s.SaleAmount >= 500
 select s.name , Courses.coursename from Students as s
  join enrollments
  on s.StudentID = enrollments.studentID
join Courses
on Courses.CourseID = enrollments.courseID
 select p.productname, s.suppliername from products as p
 join suppliers s
 on p.supplierid = s.supplierid
 where s.suppliername like '%tech%' 
select p.amount from payments as p
 join orders as o 
 on p.OrderID = o.orderid 
 where p.Amount < o.totalamount
 select e.name as [EmployeeName],e.Salary as [EmployeeSalary], m.name as [ManagerName], m.Salary as [ManagerSalary] from Employees as e
  join Employees as m
on m.EmployeeID = e.managerid 
where e.Salary > m.salary
 select p.productname, c.categoryname from Products as p
 join Categories as c
 on p.ProductID = c.CategoryID
 where c.CategoryName in ('Electronics', 'Furniture')
SELECT CONCAT_WS(' ', FirstName,LastName) as fullname,  s.SaleID,  s.ProductID,
s.CustomerID,  s.SaleDate, s.SaleAmount FROM  Sales s
JOIN   Customers c 
ON s.CustomerID = c.CustomerID
WHERE  c.Country = 'USA';
select o.OrderID,
    o.CustomerID,
    o.OrderDate,
    o.TotalAmount,
    c.Country from orders as o
 join Customers as c
 on o.customerid = c.CustomerID
 where c.Country = 'Germany' and o.totalamount > 100
SELECT e1.EmployeeID AS Employee1_ID, e1.Name AS Employee1_Name, 
       e2.EmployeeID AS Employee2_ID, e2.Name AS Employee2_Name
FROM Employees e1
JOIN Employees e2 ON e1.DepartmentID <> e2.DepartmentID
WHERE e1.EmployeeID < e2.EmployeeID;
SELECT p.PaymentID, p.Amount, o.Quantity, pr.Price, (o.Quantity * pr.Price) AS ExpectedAmount FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price);
 select s.name from Students as s
 left join enrollments as e
 on s.StudentID = e.studentID
 WHERE e.CourseID IS NULL;
SELECT 
    m.EmployeeID AS ManagerID,
    m.Name AS ManagerName,
    e.EmployeeID AS EmployeeID,
    e.Name AS EmployeeName,
    m.Salary AS ManagerSalary,
    e.Salary AS EmployeeSalary
FROM 
    Employees m
JOIN 
    Employees e ON m.EmployeeID = e.ManagerID
WHERE 
    m.Salary <= e.Salary;
SELECT 
    c.CustomerID,
    c.FirstName,
    o.OrderID
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN 
    Payments p ON o.OrderID = p.OrderID
WHERE 
    p.PaymentID IS NULL;
