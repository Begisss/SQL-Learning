WITH Numbers AS 
(SELECT 1 AS Num
UNION ALL
SELECT Num + 1 FROM Numbers
WHERE Num < 1000)
SELECT * FROM Numbers;
SELECT E.EmployeeID, E.FirstName, E.LastName, SalesSummary.TotalSales FROM Employees E
JOIN (SELECT EmployeeID, SUM(SalesAmount) AS TotalSales FROM Sales
GROUP BY EmployeeID) AS SalesSummary 
ON E.EmployeeID = SalesSummary.EmployeeID;
WITH AvgSalaryCTE AS 
(SELECT AVG(Salary) AS AvgSalary FROM Employees)
SELECT AvgSalary FROM AvgSalaryCTE;
SELECT P.ProductName,MaxSales.MaxSaleAmount AS HighestSale
FROM (SELECT ProductID,MAX(SalesAmount) AS MaxSaleAmount FROM Sales
GROUP BY ProductID) AS MaxSales
JOIN Products P ON P.ProductID = MaxSales.ProductID;
WITH DoubleNums AS (SELECT 1 AS Num
UNION ALL
SELECT Num * 2 FROM DoubleNums
WHERE Num * 2 < 1000000)
SELECT * FROM DoubleNums;
WITH SalesCount AS 
(SELECT EmployeeID, COUNT(*) AS TotalSales FROM Sales
GROUP BY EmployeeID)
SELECT E.FirstName, E.LastName FROM Employees E
JOIN SalesCount S ON E.EmployeeID = S.EmployeeID
WHERE S.TotalSales > 5;
WITH ProductSales AS 
(SELECT ProductID, SUM(SalesAmount) AS TotalSalesAmount FROM Sales
GROUP BY ProductID)
SELECT P.ProductName, PS.TotalSalesAmount FROM Products P
JOIN ProductSales PS ON P.ProductID = PS.ProductID
WHERE PS.TotalSalesAmount > 500;
WITH AvgSalary AS 
(SELECT AVG(Salary) AS AverageSalary FROM Employees)
SELECT EmployeeID, FirstName, LastName, Salary FROM Employees, AvgSalary
WHERE Salary > AvgSalary.AverageSalary;
SELECT TOP 5 E.FirstName, E.LastName, OrderCounts.TotalOrders FROM Employees E
JOIN (SELECT EmployeeID, COUNT(*) AS TotalOrders FROM Sales
GROUP BY EmployeeID) AS OrderCounts 
ON E.EmployeeID = OrderCounts.EmployeeID
ORDER BY OrderCounts.TotalOrders DESC;
SELECT P.CategoryID, SUM(SalesByProduct.TotalSales) AS CategorySales FROM Products P
JOIN (SELECT ProductID, SUM(SalesAmount) AS TotalSales FROM Sales
GROUP BY ProductID) AS SalesByProduct 
ON P.ProductID = SalesByProduct.ProductID
GROUP BY P.CategoryID;
WITH FactorialCTE (Number, Fact) AS (
SELECT Number, CAST(1 AS BIGINT) AS Fact FROM Numbers1
WHERE Number = 0 OR Number = 1
UNION ALL
SELECT N.Number, F.Fact * N.Number FROM Numbers1 N
JOIN FactorialCTE F ON N.Number = F.Number - 1)
SELECT Number, MAX(Fact) AS Factorial FROM FactorialCTE
GROUP BY Number
ORDER BY Number;
WITH SplitString AS 
(SELECT Id, 1 AS Position, SUBSTRING(String, 1, 1) AS Char FROM Example
WHERE LEN(String) > 0
UNION ALL
SELECT Id, Position + 1, SUBSTRING(String, Position + 1, 1) FROM SplitString
WHERE Position + 1 <= LEN((SELECT String FROM Example WHERE Example.Id = SplitString.Id)))
SELECT * FROM SplitString
ORDER BY Id, Position;
WITH MonthlySales AS 
(SELECT FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
SUM(SalesAmount) AS TotalSales FROM Sales
GROUP BY FORMAT(SaleDate, 'yyyy-MM')),
SalesDiff AS 
(SELECT SaleMonth,TotalSales,
LAG(TotalSales) OVER (ORDER BY SaleMonth) AS PrevMonthSales,
TotalSales - LAG(TotalSales) OVER (ORDER BY SaleMonth) AS SalesDifference FROM MonthlySales)
SELECT * FROM SalesDiff;
SELECT E.FirstName, E.LastName, Quarterly.EmployeeID, Quarterly.Quarter, Quarterly.TotalSales FROM Employees E
JOIN (SELECT EmployeeID,DATEPART(QUARTER, SaleDate) AS Quarter,
SUM(SalesAmount) AS TotalSales FROM Sales
GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
HAVING SUM(SalesAmount) > 45000) AS Quarterly
ON E.EmployeeID = Quarterly.EmployeeID;
WITH FibonacciCTE (n, Fibonacci) AS 
(SELECT 1 AS n, 0 AS Fibonacci
UNION ALL
SELECT 2, 1
UNION ALL
SELECT n + 1, prev.Fibonacci + curr.Fibonacci FROM FibonacciCTE curr
JOIN FibonacciCTE prev ON curr.n = prev.n + 1
WHERE curr.n < 20 )
SELECT * FROM FibonacciCTE;
SELECT * FROM FindSameCharacters
WHERE LEN(Vals) > 1
AND Vals IS NOT NULL
AND LEN(REPLACE(Vals, LEFT(Vals, 1), '')) = 0;
WITH NumBuilder AS 
(SELECT 1 AS n, CAST('1' AS VARCHAR(100)) AS NumStr
UNION ALL
SELECT n + 1, NumStr + CAST(n + 1 AS VARCHAR) FROM NumBuilder
WHERE n + 1 <= 5)
SELECT * FROM NumBuilder;
SELECT E.FirstName, E.LastName, SalesSummary.TotalSales FROM Employees E
JOIN (SELECT EmployeeID, SUM(SalesAmount) AS TotalSales FROM Sales
WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
GROUP BY EmployeeID) AS SalesSummary ON E.EmployeeID = SalesSummary.EmployeeID
ORDER BY SalesSummary.TotalSales DESC;
WITH DigitsExtracted AS (
SELECT PawanName,Pawan_slug_name,
LEFT(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name)) AS Prefix,
RIGHT(Pawan_slug_name, LEN(Pawan_slug_name) - CHARINDEX('-', Pawan_slug_name)) AS DigitsOnly FROM RemoveDuplicateIntsFromNames),
CleanedDigits AS 
(SELECT PawanName,Prefix,DigitsOnly,
(SELECT STRING_AGG(d, '') FROM 
(SELECT d FROM 
(SELECT d, COUNT(*) OVER (PARTITION BY d) AS cnt FROM 
(SELECT SUBSTRING(DigitsOnly, v.number, 1) AS d FROM master..spt_values v
WHERE v.type = 'P' AND v.number BETWEEN 1 AND LEN(DigitsOnly)) AS x) AS y
WHERE cnt > 1) AS z) AS Cleaned FROM DigitsExtracted)
SELECT PawanName,Prefix + ISNULL(Cleaned, '') AS Cleaned_slug_name FROM CleanedDigits;












