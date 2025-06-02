WITH AllCombinations AS 
(SELECT DISTINCT R.Region, D.Distributor FROM 
(SELECT DISTINCT Region FROM #RegionSales) R
CROSS JOIN (SELECT DISTINCT Distributor FROM #RegionSales) D)
SELECT A.Region,A.Distributor,
ISNULL(RS.Sales, 0) AS Sales FROM AllCombinations A
LEFT JOIN #RegionSales RS
ON A.Region = RS.Region AND A.Distributor = RS.Distributor
ORDER BY A.Distributor, 
CASE A.Region
WHEN 'North' THEN 1
WHEN 'South' THEN 2
WHEN 'East' THEN 3
WHEN 'West' THEN 4
END;
SELECT e.name AS ManagerName FROM Employee e
JOIN Employee r 
ON e.id = r.managerId
GROUP BY e.id, e.name
HAVING COUNT(r.id) >= 5;
SELECT p.product_name,SUM(o.unit) AS total_units FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;
SELECT CustomerID, Vendor FROM 
(SELECT CustomerID,Vendor,
COUNT(*) AS OrderCount,
RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk FROM Orders
GROUP BY CustomerID, Vendor) AS RankedOrders
WHERE rnk = 1;
DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @IsPrime BIT = 1;
IF @Check_Prime <= 1
SET @IsPrime = 0;
ELSE
BEGIN
WHILE @i * @i <= @Check_Prime
BEGIN
IF @Check_Prime % @i = 0
BEGIN
SET @IsPrime = 0;
BREAK;
END
SET @i = @i + 1;
END
END
IF @IsPrime = 1
PRINT 'This number is prime';
ELSE
PRINT 'This number is not prime';
WITH DeviceStats AS 
(SELECT Device_id,Locations,
COUNT(*) AS SignalCountPerLocation FROM Device
GROUP BY Device_id, Locations),
MaxLocation AS 
(SELECT Device_id,Locations AS MaxLocation,SignalCountPerLocation,
ROW_NUMBER() OVER (PARTITION BY Device_id ORDER BY SignalCountPerLocation DESC) AS rn FROM DeviceStats),
TotalSignals AS 
(SELECT Device_id,COUNT(DISTINCT Locations) AS LocationCount,
SUM(SignalCountPerLocation) AS TotalSignals FROM DeviceStats
GROUP BY Device_id)
SELECT t.Device_id,t.LocationCount,m.MaxLocation,t.TotalSignals FROM TotalSignals t
JOIN MaxLocation m ON t.Device_id = m.Device_id AND m.rn = 1;
SELECT EmpID, EmpName, Salary
FROM Employee e
WHERE Salary > (SELECT AVG(Salary) FROM Employee 
WHERE DeptID = e.DeptID);
WITH TodayWinningNumbers AS
(SELECT Number FROM (VALUES (25), (45), (78)) AS T(Number)),
TicketNumbers AS (
SELECT 'A23423' AS TicketID, 25 AS Number UNION ALL
SELECT 'A23423', 45 UNION ALL
SELECT 'A23423', 78 UNION ALL
SELECT 'B35643', 25 UNION ALL
SELECT 'B35643', 45 UNION ALL
SELECT 'B35643', 98 UNION ALL
SELECT 'C98787', 67 UNION ALL
SELECT 'C98787', 86 UNION ALL
SELECT 'C98787', 91),
MatchingCounts AS 
(SELECT TicketID,COUNT(DISTINCT tn.Number) AS MatchingCount FROM TicketNumbers tn
INNER JOIN TodayWinningNumbers twn ON tn.Number = twn.Number
GROUP BY TicketID),
TotalWinningNumbers AS (SELECT COUNT(*) AS TotalCount FROM TodayWinningNumbers)
SELECT SUM(CASE 
WHEN mc.MatchingCount = twn.TotalCount THEN 100 
WHEN mc.MatchingCount > 0 AND mc.MatchingCount < twn.TotalCount THEN 10 
ELSE 0 
END) AS TotalWinnings FROM MatchingCounts mc
CROSS JOIN TotalWinningNumbers twn;
WITH UserPlatform AS 
(SELECT Spend_date,User_id,
MAX(CASE WHEN Platform = 'Mobile' THEN 1 ELSE 0 END) AS HasMobile,
MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END) AS HasDesktop,
SUM(Amount) AS TotalAmount FROM Spending
GROUP BY Spend_date, User_id),
Aggregated AS 
(SELECT Spend_date,'Mobile' AS Platform,
SUM(CASE WHEN HasMobile = 1 AND HasDesktop = 0 THEN TotalAmount ELSE 0 END) AS Total_Amount,
COUNT(CASE WHEN HasMobile = 1 AND HasDesktop = 0 THEN 1 END) AS Total_users FROM UserPlatform
GROUP BY Spend_date
UNION ALL
SELECT Spend_date,'Desktop' AS Platform,
SUM(CASE WHEN HasMobile = 0 AND HasDesktop = 1 THEN TotalAmount ELSE 0 END) AS Total_Amount,
COUNT(CASE WHEN HasMobile = 0 AND HasDesktop = 1 THEN 1 END) AS Total_users FROM UserPlatform
GROUP BY Spend_date
UNION ALL
SELECT Spend_date,'Both' AS Platform,
SUM(CASE WHEN HasMobile = 1 AND HasDesktop = 1 THEN TotalAmount ELSE 0 END) AS Total_Amount,
COUNT(CASE WHEN HasMobile = 1 AND HasDesktop = 1 THEN 1 END) AS Total_users FROM UserPlatform
GROUP BY Spend_date)
SELECT ROW_NUMBER() OVER (ORDER BY Spend_date, 
CASE Platform 
WHEN 'Mobile' THEN 1
WHEN 'Desktop' THEN 2 
WHEN 'Both' THEN 3 
END) AS Row,
Spend_date,Platform,Total_Amount,Total_users FROM Aggregated
ORDER BY Spend_date, Row;
WITH RECURSIVE Expand AS 
(SELECT Product, Quantity, 1 AS current_qty FROM Grouped
WHERE Quantity > 0
UNION ALL
SELECT Product, Quantity, current_qty + 1 FROM Expand
WHERE current_qty + 1 <= Quantity)
SELECT Product, 1 AS Quantity FROM Expand
ORDER BY Product;





