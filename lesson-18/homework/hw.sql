create table #MonthlySales
(ProductID int, TotalQuantity int, TotalRevenue decimal(10,2))
insert into #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
select s.ProductID, 
sum(s.Quantity) as TotalQuantity,
sum(s.Quantity * p.Price) as TotalRevenue from Sales s
join Products p
on p.ProductID = s.ProductID
where  MONTH(s.SaleDate) = MONTH(GETDATE()) and
    YEAR(s.SaleDate) = YEAR(GETDATE())
group by s.ProductID
select * from #MonthlySales;
Create view PSS
as
select p.ProductID,p.ProductName,p.Category, sum(s.Quantity) as totalsalesquantity from Products p
join sales s
on p.ProductID = s.ProductID
group by p.ProductID,p.ProductName,p.Category
select * from pss
Create function  fn_GetTotalRevenueForProduct (@ProductID int)
  returns table
  as
  return
  (select sum(s.Quantity * p.Price) as TotalRevenue from Sales s
  join Products p 
  on s.ProductID = p.ProductID
  where p.ProductID = @ProductID)
  select * from  fn_GetTotalRevenueForProduct (1);
Create function  fn_GetSalesByCategory(@Category VARCHAR(50))
  returns table
  as
  return
  (select p.productname,
  sum(s.quantity) as totalquantity,
  sum(s.Quantity * p.Price) as TotalRevenue from Sales s
  join Products p 
  on s.ProductID = p.ProductID
  where p.Category = @Category
  group by p.ProductName)
  select * from  fn_GetSalesByCategory ('electronics')
create function dbo.fn_IsPrime (@Number INT)
returns varchar(3)
as
begin
DECLARE @i INT = 2;
DECLARE @IsPrime BIT = 1;
if @Number is null or @Number < 2
return 'No';
while @i <= sqrt(@Number)
begin
if @Number % @i = 0
begin
set @IsPrime = 0;
break;
end
set @i += 1;
end
return case when @IsPrime = 1 then 'Yes' else 'No' end;
end;
create function fn_GetNumbersBetween(@Start int, @End int)
returns @Result table (Number int)
as
begin
with Numberscte as 
(select @Start as Number
union all
select Number + 1from Numberscte
where Number + 1 <= @End)
insert into @Result
select Number from Numberscte;
return
end;.
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
RETURN
(SELECT DISTINCT Salary FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET N - 1 );
END
with cte as
(select requester_id as [all] from RequestAccepted 
union all
select accepter_ID from RequestAccepted), 
cte2 as
(select top 1 with ties [all], count([all]) as cnt from cte
group by [all]
order by count([all]) desc), 
cte3 as
(select * from cte2)
select * from cte3
create view vw_CustomerOrderSummary
as
select
c.customer_id,                  
c.name,                       
count(o.order_id) as total_orders,     
sum(o.amount) as total_amount,        
max(o.order_date) as last_order_date from Customers c
left join Orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name;
select * from vw_CustomerOrderSummary
select RowNumber, max(TestCase) over 
(order by RowNumber
rows between unbounded preceding and current row) as Workflow from Gaps;

