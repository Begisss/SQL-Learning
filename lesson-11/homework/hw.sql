select e.name, d.departmentname from employees e
join departments d
on e.departmentid = d.departmentid
select c.classname, s.studentname from Students s
left join Classes c
on s.classid = c.classid
select c.FirstName, c.CustomerID,o.OrderID, o.OrderDate from Orders o
right join Customers c
on o.customerid = c.CustomerID
select p.ProductID,
    p.ProductName,
    s.SaleID,
    s.SaleAmount from Products p
 full outer join Sales s
 on p.ProductID = s.ProductID
select e.name, m.name as managername from employees e
left join employees m
on e.managerid = m.employeeid
select c.ColorName,s.SizeName from Colors c
cross join sizes s
select m.Title,m.ReleaseYear,a.Name from movies m
left join Actors a
on m.MovieID = a.MovieID
where ReleaseYear > 2015
select o.OrderDate, c.CustomerName, od.ProductID from Orders o
join  Customers c on o.CustomerID = c.CustomerID
join OrderDetails od on o.OrderID = od.OrderID;
 select p.productname, sum(s.Quantity * p.Price) as TotalRevenue  from sales s
 join products p 
 on s.ProductID = p.ProductID
group by p.ProductName;
