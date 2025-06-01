select *, ROW_NUMBER() over (order by saledate) as rn from ProductSales
select ProductName, SUM(Quantity) as TotalQuantity, DENSE_RANK() over (order by SUM(Quantity) desc) as ProductRank from ProductSales
group by ProductName;
select * from ( select *, ROW_NUMBER() over (partition by CustomerID order bySaleAmount desc) as SaleRank from ProductSales) as RankedSales
where SaleRank = 1;
select  SaleID, ProductName, SaleDate,  SaleAmount, LEAD(SaleAmount) over (order by SaleDate) as NextSaleAmount from  ProductSales;
select  SaleID, ProductName, SaleDate,  SaleAmount, LAG(SaleAmount) over (order by SaleDate) as PreviousSaleAmount from  ProductSales;
select * from
(select SaleID,ProductName, SaleDate, SaleAmount,
LAG(SaleAmount) over (order by SaleDate) as PreviousSaleAmount from ProductSales) as Sub
where  SaleAmount > PreviousSaleAmount;
Select SaleID,ProductName,SaleDate,SaleAmount,
LAG(SaleAmount) over (partition by ProductName order by SaleDate) as PreviousSaleAmount,
SaleAmount - LAG(SaleAmount) over (partition by ProductName order by SaleDate) as AmountDifference from ProductSales;
Select SaleID,ProductName,SaleDate,SaleAmount,
LEAD(SaleAmount) OVER (ORDER BY SaleDate) as NextSaleAmount,
CASE WHEN SaleAmount = 0 THEN NULL
ELSE ROUND(((LEAD(SaleAmount) OVER (ORDER BY SaleDate) - SaleAmount) / SaleAmount) * 100, 2)
END AS PercentageChange FROM ProductSales;
SELECT SaleID,ProductName,SaleDate,SaleAmount,
LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PreviousSaleAmount,
CASE WHEN LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) = 0 THEN NULL
ELSE ROUND(SaleAmount * 1.0 / LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate), 2)
END AS SaleAmountRatio FROM ProductSales;
Select SaleID,ProductName,SaleDate,SaleAmount,
FIRST_VALUE(SaleAmount) over (partition by ProductName order by SaleDate) as FirstSaleAmount,
SaleAmount - FIRST_VALUE(SaleAmount) over (partition by ProductName order by SaleDate) as DifferenceFromFirstSale from ProductSales;
select * from
(select SaleID,ProductName, SaleDate, SaleAmount,
LAG(SaleAmount) over (partition by ProductName order by SaleDate) as PreviousSaleAmount from ProductSales) as Sub
where  SaleAmount > PreviousSaleAmount;
Select SaleID,ProductName,SaleDate,SaleAmount,
SUM(SaleAmount) over (order by SaleDate) as ClosingBalance from ProductSales;
Select SaleID,ProductName,SaleDate,SaleAmount,
ROUND(AVG(SaleAmount) over (order by SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) as avgmove3
from ProductSales;
Select SaleID,ProductName,SaleDate,SaleAmount,
ROUND(AVG(SaleAmount) over (order by SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) as avgmove3,
SaleAmount - ROUND(AVG(SaleAmount) over (order by SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) as diff
from ProductSales;
WITH SalaryRanks AS 
(SELECT  EmployeeID, Name, Department, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank FROM Employees1)
SELECT * FROM SalaryRanks
WHERE SalaryRank IN (SELECT SalaryRank FROM SalaryRanks
GROUP BY SalaryRank
HAVING COUNT(*) > 1);
SELECT * FROM (
SELECT EmployeeID,Name,Department,Salary,
DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank FROM Employees1) AS Ranked
WHERE SalaryRank <= 2
ORDER BY Department, SalaryRank;
SELECT * FROM (
SELECT EmployeeID,Name,Department,Salary,
ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary) AS SalaryRank FROM Employees1) AS Ranked
WHERE SalaryRank = 1;
SELECT EmployeeID,Name,Department,Salary,
SUM(salary) OVER (PARTITION BY Department ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as RunTotal FROM  Employees1
SELECT  EmployeeID,Name,Department,Salary,
SUM(salary) OVER (PARTITION BY Department ) AS totalsalary FROM Employees1
SELECT  EmployeeID,Name,Department,Salary,
avg(salary) OVER (PARTITION BY Department ) AS avgsalary FROM Employees1
SELECT EmployeeID,Name,Department,Salary,
avg(salary) OVER (PARTITION BY Department ) AS avgsalary,
Salary - avg(salary) OVER (PARTITION BY Department ) as diff FROM Employees1
SELECT EmployeeID,Name,Department,Salary,
AVG(Salary) OVER (ORDER BY EmployeeID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MovingAvgSalary
FROM Employees1;
SELECT SUM(Salary) AS SumLast3Hired FROM 
(SELECT Salary,ROW_NUMBER() OVER (ORDER BY HireDate DESC) AS rn
FROM Employees1) AS Ranked
WHERE rn <= 3;
