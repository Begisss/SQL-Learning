select min (price) from products 
 select max(salary) from employees
select count(*) as result
from customers;
select (count(distinct Category)) from Products
select sum(saleamount) as Totalsalesamount from sales
where ProductID = 7
 select avg(age) as averageage from Employees
select departmentname, count(*) as totalnumerofemployees
from Employees
group by departmentname
select category, max(price) as [max], min(price) as [min] from products
group by category
select customerid, sum(saleamount) as totalsum from sales
group by customerid
select departmentname , count (*) as employee
from employees
group by departmentname 
having count (*) > 5
 Select  Category, 
Sum(SaleAmount) as TotalSales, Avg(SaleAmount) as AverageSales
from Sales
group by Category;
select departmentname , count (*) as employee
from employees
where departmentname = 'HR'
group by departmentname 
 select departmentname, max(salary) as highsalary, min(salary) as lowsalary from Employees
 group by DepartmentName
 select departmentname, avg(salary)  as avgsalary from Employees
 group by DepartmentName
select departmentname, avg(salary) as averagesalary, count (*) as employee
 from Employees
 group by departmentname
select category , avg(price) as avgprice
 from products
 group by category
 having avg(price) > 400 
select year(SaleDate) as SaleYear, 
       SUM(SaleAmount) as TotalSales
from Sales
group by year(SaleDate);
select CustomerID, count(OrderID) as OrderCount
from orders
group by CustomerID
having count(OrderID) >= 3;
 select departmentname, sum(salary) as totalsalaryexpense
 from employees
 group by departmentname
 having sum(salary)>500000
select category , avg(sales) as avgsales
 from products
 group by category
 having avg(sales) > 200
select customerid, sum(saleamount) as totalsales
from sales
group by customerid
having sum(saleamount) > 1500
select departmentname, sum(salary) as totalsalary, avg(salary)as avgsalary
from employees
group by departmentname
having avg(salary)> 65000
select CustomerID,
max(OrderValue) as MaxOrderValue,
min(OrderValue) as MinOrderValue
from Orders
group by CustomerID
having max(OrderValue) >= 50;
select 
month(SaleDate) as SaleMonth,
sum(SaleAmount) as TotalSales,
count(distinct ProductID) as ProductsSold
from Sales
group by month(SaleDate)
having count(distinct ProductID) > 8;
select
year(OrderDate) as OrderYear,
min(Quantity) as MinQuantity,
max(Quantity) as MaxQuantity
from Orders
group by year(OrderDate);

