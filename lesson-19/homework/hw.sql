create proc GetEmployeeBonusReport
as
begin
create table #EmployeeBonus (EmployeeID INT,FullName NVARCHAR(101),Department NVARCHAR(50),Salary DECIMAL(10,2),BonusAmount DECIMAL(10,2));
insert into #EmployeeBonus (EmployeeID, FullName, Department, Salary, BonusAmount)
select e.EmployeeID,e.FirstName + ' ' + e.LastName as FullName, e.Department, e.Salary, e.Salary * db.BonusPercentage / 100 as BonusAmount from Employees e
join  DepartmentBonus db on e.Department = db.Department;
select * from #EmployeeBonus;
end
exec GetEmployeeBonusReport;

Create proc UpdateDepartmentSalaries
@Department nvarchar(50),
@IncreasePercentage decimal(5,2)
as
begin
update Employees
set Salary = Salary + (Salary * @IncreasePercentage / 100)
where Department = @Department;
select EmployeeID,FirstName,LastName,Department,Salary fromM Employees
where Department = @Department;
end;

merge into products_current pc
  using products_new pn
  on pc.productid = pn.productid
  when matched then 
  update set      
  pc.productname = pn.productname,
    pc.price = pn.price
  when not matched by target then
  insert (productid, productname, price)
  values (pn.productid, pn.productname, pn.price)
  when not matched by source 
  then delete
  select * from Products_Current;
select t.id,
case when t.p_id IS NULL THEN 'Root'
     when t.id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
else 'Inner'
end as type from Tree t
order by t.id;

select * from employees
where salary = (select min(salary) from employees)
create procedure GetProductSalesSummary
@ProductID INT
as
begin
select p.ProductName,
sum(s.Quantity) as TotalQuantitySold, 
sum(s.Quantity * p.Price) as TotalSalesAmount,
min(s.SaleDate) as FirstSaleDate,
max(s.SaleDate) as LastSaleDate from Products p
left join Sales s on p.ProductID = s.ProductID
where p.ProductID = @ProductID
group by p.ProductName;
end;
exec GetProductSalesSummary @ProductID = 1;
