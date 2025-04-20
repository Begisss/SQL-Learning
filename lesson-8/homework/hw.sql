select category,count(productname) as totalproduct
from products
group by category
 select  avg(price) as Avgelectronicsprice from products
 where category ='electronics'
select * from Customers
where City like 'L%';
select * from products
where productname like '%er'
select *from customers
where country like '%A'
select max(price) as highestprice
from products
select Productid,Productname,Stockquantity,
IIF(Stockquantity < 30, 'Low Stock', 'Sufficient') as Stockstatus
from Products
 select country, COUNT(*) as totalcustomers
 from customers
 group by country
select max(quantity) as [max] , min(quantity) as [min]
from orders
select distinct CustomerID
from orders
where year (OrderDate) = 2023
except
selecgt distinct CustomerID
from Invoices;
select ProductName
from Products
union all
select ProductName
from Products_Discounted;
select ProductName
from Products
union 
select ProductName
from Products_Discounted;
select year(OrderDate) as OrderYear, 
      avg(Orderid) as AvgOrderAmount
from Orders
group by year (OrderDate)
select ProductName,
case
when Price < 100 then 'Low'
when Price between 100 and500 then 'Mid' 
when Price > 500 then 'High'
end as PriceGroup
from Products;
select distinct city
 from customers
 order by city asc
select productid,sum(saleamount) as totalsales
from sales
group by productid
select ProductName from products
where productname like '%oo%'
select ProductID
from Products
intersect
select  ProductID
from Products_Discounted;
select top 3 customerid ,
       sum(TotalAmount) as TotalSpent
from Invoices
group by CustomerID
order by TotalSpent desc
 select ProductID, ProductName
from Products
except
select ProductID, ProductName
from Products_Discounted
SELECT 
    p.ProductName,
    COUNT(s.SaleID) AS TimesSold
FROM 
    Products p
INNER JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductName;
 select top 5 productid , max(quantity) as highquantity
 from orders
 group by productid
 order by highquantity desc

