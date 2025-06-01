SELECT customer_id,customer_name,order_date,total_amount,
SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_sales
FROM sales_data
ORDER BY customer_id, order_date;
SELECT product_category,COUNT(*) AS number_of_orders FROM sales_data
GROUP BY product_category
ORDER BY number_of_orders DESC;
SELECT product_category,max(total_amount) AS maxtotal FROM sales_data
GROUP BY product_category
ORDER BY maxtotal DESC;
SELECT product_category,min(total_amount) AS mintotal FROM sales_data
GROUP BY product_category
ORDER BY mintotal 
select   order_date,
    customer_id,
    customer_name,
    total_amount, AVG(TOTAL_AMOUNT) OVER (ORDER BY ORDER_DATE ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS hhh
 from sales_data
SELECT region, SUM(TOTAL_AMOUNT)  AS TOTALSALES FROM sales_data
GROUP BY region
ORDER BY region
SELECT customer_id,customer_name,
SUM(total_amount) AS total_purchase,
RANK() OVER (ORDER BY SUM(total_amount) DESC) AS purchase_rank
FROM sales_data
GROUP BY customer_id, customer_name
ORDER BY purchase_rank;
select customer_id,customer_name,order_date,total_amount, 
LAG(total_amount) over (partition by customer_id order by order_date ) as prvamount,
total_amount - LAG(total_amount) over (partition by customer_id order by order_date ) as differ
from sales_data
SELECT * FROM (
SELECT product_category,product_name,unit_price,
RANK() OVER (PARTITION BY product_category ORDER BY unit_price DESC) AS price_rank
FROM sales_data) AS ranked
WHERE price_rank <= 3;
SELECT region,order_date,total_amount,
SUM(total_amount) OVER (PARTITION BY region ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sales
FROM sales_data
ORDER BY region, order_date;
SELECT product_category,order_date,total_amount,
SUM(total_amount) OVER (PARTITION BY product_category ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_revenue
FROM sales_data
ORDER BY product_category, order_date;
CREATE TABLE sonlar (ID INT);
INSERT INTO sonlar (ID) VALUES (1), (2), (3), (4), (5);
SELECT ID, SUM(ID) OVER (ORDER BY ID ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) as Sum_Previous FROM sonlar;
SELECT value, SUM(value) OVER (ORDER BY value ROWS BETWEEN UNBOUNDED PRECEDING AND current row) as cum_sum from OneColumn
select id,vals,ROW_NUMBER() over (order by id) as rn from Row_Nums
SELECT customer_id,customer_name FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;
SELECT customer_id,customer_name,region,SUM(total_amount) AS total_spent FROM sales_data
GROUP BY customer_id, customer_name, region
HAVING SUM(total_amount) > (SELECT AVG(region_total) FROM 
(SELECT region,SUM(total_amount) AS region_total FROM sales_data
GROUP BY region) AS regional_avg);
select  customer_id,customer_name,region,SUM(total_amount) as total_spent,
dense_rank() over (	partition by region order by SUM(total_amount) desc) as spending_rank
from sales_data
group by customer_id, customer_name, region;
select customer_id,customer_name,order_date,total_amount, sum(total_amount) over 
(partition by customer_id order by order_date  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as cumul from sales_data
WITH Monthly AS (SELECT FORMAT(order_date, 'yyyy-MM') AS sale_month,
SUM(total_amount) AS total_sales FROM sales_data
GROUP BY FORMAT(order_date, 'yyyy-MM'))
SELECT sale_month,total_sales,
LAG(total_sales) OVER (ORDER BY sale_month) AS previous_month_sales,
ROUND(CASE WHEN LAG(total_sales) OVER (ORDER BY sale_month) = 0 THEN NULL
ELSE ((total_sales - LAG(total_sales) OVER (ORDER BY sale_month)) * 100.0) / LAG(total_sales) OVER (ORDER BY sale_month)END, 2) AS growth_rate_percent
FROM Monthly;
WITH customer_orders AS (SELECT customer_id,customer_name,order_date,total_amount,
LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS last_order_amount FROM sales_data)
SELECT * FROM customer_orders
WHERE total_amount > last_order_amount;
SELECT DISTINCT product_name, unit_price FROM sales_data
WHERE unit_price > (SELECT AVG(unit_price) FROM sales_data);
SELECT Id,Grp,Val1,Val2,
CASE WHEN ROW_NUMBER() OVER (PARTITION BY Grp ORDER BY Id) = 1 THEN SUM(Val1 + Val2) OVER (PARTITION BY Grp)
ELSE NULL END AS GroupTotal FROM MyData;
SELECT ID, SUM(Cost) AS TotalCost, SUM(DISTINCT Quantity) AS TotalQuantity FROM TheSumPuzzle
GROUP BY ID;
WITH AllSeats AS (SELECT MIN(SeatNumber) AS StartSeat, MAX(SeatNumber) AS EndSeat FROM Seats),
Numbers AS (SELECT TOP (SELECT EndSeat - StartSeat + 1 FROM AllSeats)
ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) + (SELECT StartSeat - 1 FROM AllSeats) AS SeatNumberFROM master.dbo.spt_values ),
MissingSeats AS (SELECT SeatNumberFROM Numbers
WHERE SeatNumber NOT IN (SELECT SeatNumber FROM Seats)),
Grouped AS (SELECT SeatNumber,SeatNumber - ROW_NUMBER() OVER (ORDER BY SeatNumber) AS grpFROM MissingSeats)
SELECT MIN(SeatNumber) AS [Gap Start], MAX(SeatNumber) AS [Gap End]FROM Grouped
GROUP BY grp
ORDER BY [Gap Start];
WITH Numbered AS (SELECTId,Vals,
ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Vals) AS rnFROM Row_Nums),
Grouped AS (SELECT Id,Vals, rn,
ROW_NUMBER() OVER (ORDER BY Id) AS grp_rn FROM Numbered)
SELECT Id,Vals,CASE WHEN rn = 1 THEN grp_rn * 2
ELSE grp_rn * 2 + rn - 2
END AS Changed FROM Grouped
ORDER BY Id, Changed;
