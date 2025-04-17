SELECT ProductID, ProductName AS Name, Price, Category, StockQuantity FROM Products;
SELECT * FROM Customers AS Client;
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;
SELECT DISTINCT CustomerName, Country
FROM Customers;
SELECT ProductID, ProductName, Price
CASE 
 WHEN Price > 1000 THEN 'High'
 ELSE 'Low'
 END AS PriceCategory
FROM Products;
SELECT ProductID, ProductName, StockQuantity,
 IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;
select *, iif (price >= 1000 ,'Expensive', 'Affordable') as result from Products
Select * from employees where age < 25 or salary > 60000 
If exists (Select * from Employees where DepartmentName = 'HR' or EmployeeID = 5)
begin
    update Employees
    set salary = salary * 1.10
    where DepartmentName = 'HR' or EmployeeID = 5;
end
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;
SELECT *,
       CASE 
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS SaleCategory
FROM Sales;
SELECT  CustomerID,Quantity,
CASE  WHEN Quantity > 3 THEN '3%'         
WHEN Quantity BETWEEN 1 AND 3 THEN '5%' 
ELSE '7%'                            
END AS DiscountPercentage
FROM Orders;
