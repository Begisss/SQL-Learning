select top 5 *from Employees
select distinct productname from Products
select * from Products
where Price > 100;
select  * from customers
where firstname like 'a%';
 select * from Products
 order by price asc
  select *  from Employees
  where   departmentname='hr' and Salary >= 60000
select  ISNULL(Email, 'noemail@example.com') as Email
from Employees;
select * from Products
where price between 50 and 100
 select distinct category ,productname  from products
 order by ProductName desc
select top 10 * from Products
order by price desc
select coalesce(FirstName, LastName) as Name
from Employees;
select distinct category,price from Products
select *  from Employees
  where   departmentname='marketing' and age between 30 and 40
select * from Employees
order by Salary desc
offset 10 rows fetch next 10 rows only
 select * from Products
 where Price <= 1000 and StockQuantity > 50
 order by StockQuantity asc
select * from Products
where ProductName like '%e%'
 select * from Employees
 where DepartmentName in ( 'HR', 'IT' , 'Finance')
select * from customers
order by city asc, postalcode desc
select top (10) ProductID, SUM(SalesAmount) as TotalSales
from Sales
group by ProductID
order by SaleAmount desc;
select FirstName + ' ' + LastName as FullName
from Employees;
 select distinct Category, ProductName, Price from Products
 where price > 50
select ProductName, Price
from Products
where Price < (select avg(Price) * 0.1 from Products);
select * from Employees
where Age < 30 and Department in ('HR', 'IT');
select * from customers where Email like '@%gmail.com'
select * from Employees
where Salary > all (select Salary from Employees
where Department = 'Sales');
select * from Orders
where order_date between current_date - interval '180 days' and current date
