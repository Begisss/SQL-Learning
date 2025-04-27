select e.Name, e.Salary, d.DepartmentName from Employees e
join Departments d
on e.DepartmentID = d.DepartmentID
where salary > 50000
select c.FirstName,c.lastname, o.orderdate from Customers as c
join orders o
on c.CustomerID = o.customerid 
where year(o.orderdate) = 2023
select e.Name,d.DepartmentName from Employees e
left join Departments d
on e.DepartmentID = d.DepartmentID
select s.SupplierName, p.ProductName from Suppliers s
left join Products p
on s.SupplierID = p.SupplierID
select o.OrderID, o.OrderDate, p.PaymentDate, p.Amount  from orders o
 full outer join payments p
 on o.orderid = p.OrderID
select e.Name as [employeename], m.Name as [managername] from Employees as e
left join Employees as m
on m.EmployeeID = e.ManagerID
 SELECT   s.Name, c.CourseName FROM  Students s
JOIN  Enrollments e ON s.StudentID = e.StudentID
JOIN  Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101';
select c.firstname, c.LastName, quantity from Customers c
join orders o 
on c.CustomerID = o.customerid
where quantity > 3
SELECT  e.EmployeeName,d.departmentname
FROM   Employees e
JOIN   Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources';
select count(e.EmployeeID) as empcount, d.departmentname from Departments d
join Employees e 
on d.DepartmentID = e.DepartmentID
GROUP BY  d.DepartmentName
HAVING COUNT(e.EmployeeID) > 10;
SELECT  p.ProductName FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;
select count(quantity) as totalorders, c.FirstName from Customers as c
join orders o 
on c.CustomerID = o.customerid
group by c.FirstName
having count (quantity) >= 1
SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN  Departments d ON e.DepartmentID = d.DepartmentID;
select e1.name as Employee1, e2.name Employee2, e1.ManagerID from Employees as e1
join Employees e2
on e1.ManagerID = e2.ManagerID
WHERE  e1.EmployeeID < e2.EmployeeID
  AND e1.ManagerID IS NOT NULL;
select o.OrderID, o.OrderDate, c.firstname,c.lastname  from orders as o
left join Customers as c
on o.customerid = c.CustomerID
where YEAR(o.orderdate) = 2022
  select e.Name,e.Salary, d.DepartmentName  from Employees e
 join Departments d
 on e.DepartmentID = d.DepartmentID
 where d.DepartmentName = 'sales'
 and e.Salary > 60000
SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID;
select p.ProductID, p.ProductName from Products p
join orders o
on p.ProductID = o.productid 
where o.productid is null
select e1.name, e1.Salary from Employees e1
 join Employees e2
on e1.EmployeeID = e2.EmployeeID
where  e1.Salary > (SELECT AVG(Salary) FROM Employees);
select o.OrderID, o.OrderDate from orders o
left join Payments p
on o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL
    AND o.OrderDate < '2020-01-01';
select p.ProductID, p.ProductName from Products p
left join Categories c
on p.Category = c.CategoryID
where c.CategoryID is null
select e1.Name, e2.name, e1.ManagerID, e1.Salary from Employees e1
join Employees e2
on e1.ManagerID = e2.ManagerID AND e1.EmployeeID <> e2.EmployeeID
where e1.Salary > 60000	AND e2.Salary > 60000;
select e.Name, d.DepartmentName from Employees e
join Departments d
on e.DepartmentID = d.DepartmentID
where DepartmentName like 'M%'
 select s.SaleID, p.ProductName, s.SaleAmount from Products p
 join sales s
 on p.ProductID = s.ProductID
 where SaleAmount > 500
select s.StudentID, s.Name from Students s
JOIN  Enrollments e ON s.StudentID = e.StudentID
JOIN  Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName <>  'Math 101';
SELECT o.OrderID, o.OrderDate, p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
 select p.ProductID, p.ProductName, c.CategoryName from Products p
 join Categories c
 on p.Category = c.CategoryID
 where CategoryName in( 'Electronics' , 'Furniture')



