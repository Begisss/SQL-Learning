select distinct s.CustomerName from #Sales s
where exists
(select 1 from #Sales sub
where sub.CustomerName = s.CustomerName
and sub.SaleDate >= '2024-03-01'
and sub.SaleDate < '2024-04-01');
select  Product from 
(select Product, sum(Quantity * Price) as TotalRevenue from #Sales
group by Product) as ProductRevenue
where TotalRevenue = (select max(TotalRev) from
(select sum(Quantity * Price) as TotalRev from #Sales
group by Product) as RevenuePerProduct);
select max(SaleAmount) as SecondHighestSaleAmount from
(select Quantity * Price as SaleAmountFROM #Sales) as SaleAmounts
where SaleAmount < (select max(Quantity * Price) from #Sales);
select SaleMonth, sum(TotalQuantity) as TotalQuantityPerMonth from 
(select format(SaleDate, 'yyyy-MM') as SaleMonth,Quantity as TotalQuantity from #Sales) as MonthlySales
group by SaleMonth
order by SaleMonth;
select distinct s1.CustomerName from #Sales s1
where exists (select 1 from #Sales s2
where s2.Product = s1.Product
and s2.CustomerName <> s1.CustomerName);
select Name, Fruit, count(*) as FruitCount from Fruits
group by Name, Fruit
order by Name, Fruit;
select ParentId as OlderPerson, ChildID as YoungerPerson from Family;
select CustomerID, OrderID, DeliveryState, Amount from #Orders o1
where DeliveryState = 'TX'
and EXISTS (select 1 from #Orders o2
where o2.CustomerID = o1.CustomerID
and o2.DeliveryState = 'CA')
order by CustomerID, OrderID;
update #residents
set address = address + ' name=' + fullname
where address not like '%name=%
WITH RecursiveRoutes AS 
(SELECT CAST(DepartureCity + ' -> ' + ArrivalCity AS VARCHAR(MAX)) AS RoutePath,DepartureCity,ArrivalCity,Cost FROM #Routes
WHERE DepartureCity = 'Tashkent'
UNION ALL
SELECT  CAST(rr.RoutePath + ' -> ' + r.ArrivalCity AS VARCHAR(MAX)),rr.DepartureCity,r.ArrivalCity,rr.Cost + r.Cost FROM RecursiveRoutes rr
JOIN #Routes r ON rr.ArrivalCity = r.DepartureCity
WHERE rr.ArrivalCity <> 'Khorezm')
SELECT * FROM RecursiveRoutes
WHERE ArrivalCity = 'Khorezm';
SELECT ID,Vals,
COUNT(CASE WHEN Vals = 'Product' THEN 1 END) OVER (ORDER BY ID ROWS UNBOUNDED PRECEDING) AS ProductGroup FROM #RankingPuzzle
ORDER BY ID;
select EmployeeName,  SalesAmount from #EmployeeSales e
where SalesAmount > (select AVG(SalesAmount) from #EmployeeSales
where Department = e.Department);
select e.EmployeeID, e.EmployeeName, e.Department, e.SalesAmount, e.SalesMonth, e.SalesYear from #EmployeeSales e
where not exists (select 1 from #EmployeeSales s
where s.SalesMonth = e.SalesMonth
and s.SalesYear = e.SalesYear
and s.SalesAmount > e.SalesAmount);
-- Find employees who made sales in every distinct month/year in the data
select distinct e.EmployeeID, e.EmployeeName from #EmployeeSales e
where not exists 
(select 1 from (select distinct SalesMonth, SalesYear from #EmployeeSales) as AllMonths
where not exists (select 1 from #EmployeeSales es
where es.EmployeeID = e.EmployeeID
and es.SalesMonth = AllMonths.SalesMonth
and es.SalesYear = AllMonths.SalesYear));
select Name,  price from Products p
where price > (select AVG(Price)  from Products)
select Name,  Stock from Products p
where Stock < (select max(Stock)  from Products)
select Name from Products
where Category = (select Category from Products
where Name = 'Laptop');
select Name,  price from Products p
where price > (select min(Price) from Products
where Category = 'electronics')
select * from Products p
where Price > (select AVG(Price) from Products
where Category = p.Category);
select distinct ProductID from Orders;
select distinct p.Name from Orders o
join Products p on o.ProductID = p.ProductID
where o.Quantity > (select AVG(Quantity) from Orders);
select * from Products p
where not exists 
(select 1 from Orders o
where o.ProductID = p.ProductID);
select top 1 p.ProductID, p.Name, SUM(o.Quantity) as TotalQuantity from Orders o
join Products p on o.ProductID = p.ProductID
group by p.ProductID, p.Name
order by TotalQuantity desc;


 
