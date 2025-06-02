SELECT Id,FORMAT(Dt, 'MM') AS Month FROM Dates;
-- Step 1: Find max Vals per (Id, rID)
WITH MaxVals AS 
(SELECT Id, rID, MAX(Vals) AS MaxVal FROM MyTabel
GROUP BY Id, rID)
SELECT SUM(MaxVal) AS SumOfMaxVals FROM MaxVals;
SELECT DISTINCT Id FROM MyTabel;
SELECT Id, Vals FROM TestFixLengths
WHERE (Vals IS NULL OR Vals = '') OR LEN(Vals) BETWEEN 6 AND 10;
WITH MaxVals AS 
(SELECT ID,MAX(Vals) AS MaxVal FROM TestMaximum
GROUP BY ID)
SELECT t.ID, t.Item, t.Vals FROM TestMaximum t
JOIN MaxVals m ON t.ID = m.ID AND t.Vals = m.MaxVal;
WITH MaxPerGroup AS 
(SELECT Id, DetailedNumber, MAX(Vals) AS MaxVal FROM SumOfMax
GROUP BY Id, DetailedNumber)
SELECT Id,SUM(MaxVal) AS SumOfMaxVals FROM MaxPerGroup
GROUP BY Id;
SELECT Id,a,b,
CASE WHEN a - b = 0 THEN ''
ELSE CAST(a - b AS VARCHAR)
END AS Diff FROM TheZeroPuzzle;
SELECT SUM(QuantitySold * UnitPrice) AS TotalRevenue FROM Sales;
SELECT AVG(UnitPrice) AS AverageUnitPrice FROM Sales;
SELECT COUNT(*) AS TotalTransactions FROM Sales;
SELECT MAX(QuantitySold) AS MaxUnitsSold FROM Sales;
SELECT Category, SUM(QuantitySold) AS TotalUnitsSold FROM Sales
GROUP BY Category;
SELECT Region, SUM(QuantitySold * UnitPrice) AS TotalRevenue FROM Sales
GROUP BY Region;
SELECT TOP 1 Product, SUM(QuantitySold * UnitPrice) AS TotalRevenue FROM Sales
GROUP BY Product
ORDER BY TotalRevenue DESC;
SELECT SaleDate,Product,QuantitySold * UnitPrice AS Revenue,
SUM(QuantitySold * UnitPrice) OVER (ORDER BY SaleDate) AS RunningTotalRevenue FROM Sales
ORDER BY SaleDate;
SELECT Category,SUM(QuantitySold * UnitPrice) AS CategoryRevenue,
CAST(SUM(QuantitySold * UnitPrice) * 100.0 / 
SUM(SUM(QuantitySold * UnitPrice)) OVER () AS DECIMAL(5,2)) AS PercentageContribution FROM Sales
GROUP BY Category;
SELECT S.SaleID,S.Product,S.Category,S.QuantitySold,S.UnitPrice,S.SaleDate,S.Region,S.CustomerID,C.CustomerName FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID;
SELECT C.CustomerID,C.CustomerName FROM Customers C
LEFT JOIN Sales S ON C.CustomerID = S.CustomerID
WHERE S.SaleID IS NULL;
SELECT C.CustomerID,C.CustomerName,
SUM(S.QuantitySold * S.UnitPrice) AS TotalRevenue FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CustomerName;
SELECT TOP 1 C.CustomerID,C.CustomerName,
SUM(S.QuantitySold * S.UnitPrice) AS TotalRevenue FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CustomerName
ORDER BY TotalRevenue DESC;
SELECT C.CustomerID,C.CustomerName,
COUNT(S.SaleID) AS NumberOfSales FROM Customers C
LEFT JOIN Sales S ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerID, C.CustomerName;
SELECT DISTINCT P.ProductID, P.ProductName, P.Category FROM Products P
JOIN Sales S ON P.ProductName = S.Product;
SELECT TOP 1 * FROM Products
ORDER BY SellingPrice DESC;
SELECT P.* FROM Products P
JOIN (SELECT Category, AVG(SellingPrice) AS AvgSellingPrice FROM Products
GROUP BY Category) AS AvgCat
ON P.Category = AvgCat.Category
WHERE P.SellingPrice > AvgCat.AvgSellingPrice;
