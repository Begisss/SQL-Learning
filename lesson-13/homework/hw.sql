select  CONCAT(EMPLOYEE_ID, '-', first_name, ' ', last_name) as employee_info from employees;
update employees
set phone_number = replace(phone_number, '124', '999');
select first_name as [First Name],
       LEN(first_name) as [Name Length]
from employees
where first_name like 'A%' or first_name like 'J%' or first_name like 'M%'
order by first_name;
select manager_id, sum(SALARY) as total_salary from Employees
group by MANAGER_ID 
select year1, GREATEST(Max1, Max2, Max3) as highest_value from TestMax
select * from cinema
where id % 2 = 1
  and description != 'boring';
select  from SingleOrder
order by case when Id = 0 then 1 else 0 end, Id;
select coalesce(ssn,passportid, itin) from person 
select left(fullname, CHARINDEX(' ', FullName) - 1) as Firstname,
SUBSTRING(FullName,CHARINDEX(' ', FullName) + 1, 
CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1) - CHARINDEX(' ', FullName) - 1) as Middlename,
RIGHT(FullName, LEN(FullName) - CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1)) as Lastname from Student
select customerID, count(distinct DeliveryState) from Orders
where DeliveryState in ('TX', 'CA')
group by CustomerID
having count(distinct DeliveryState) = 2
select String, STRING_AGG(SequenceNumber, ', ') as concatenated_values
from DMLTable
group by String;
select * from employees
where LEN(LOWER(first_name + last_name)) - LEN(REPLACE(LOWER(first_name + last_name), 'a', '')) >= 3;
select department_id,
COUNT(*) as total_employees,COUNT(case when DATEDIFF(YEAR, hire_date, GETDATE()) > 3 then 1 end) * 100.0 / COUNT(*) as percentage_over_3_years from employees
group by department_id;
WITH RankedExperience AS (
    SELECT
        JobDescription,
        SpacemanID,
        MissionCount,
        ROW_NUMBER() OVER (PARTITION BY JobDescription ORDER BY MissionCount DESC) AS MostExperiencedRank,
        ROW_NUMBER() OVER (PARTITION BY JobDescription ORDER BY MissionCount ASC) AS LeastExperiencedRank
    FROM Personal)
SELECT JobDescription, SpacemanID, MissionCount, 'Most Experienced' AS ExperienceType
FROM RankedExperience
WHERE MostExperiencedRank = 1
UNION ALL
SELECT JobDescription, SpacemanID, MissionCount, 'Least Experienced' AS ExperienceType
FROM RankedExperience
WHERE LeastExperiencedRank = 1;





select  StudentID,FullName,Grade,
sum(grade) over (order by StudentID) as Cumulativegrades from Students;
select Equation, case Equation
        WHEN '123' THEN 123
        WHEN '1+2+3' THEN 1+2+3
        WHEN '1+2-3' THEN 1+2-3
        WHEN '1+23' THEN 1+23
        WHEN '1-2+3' THEN 1-2+3
        WHEN '1-2-3' THEN 1-2-3
        WHEN '1-23' THEN 1-23
        WHEN '12+3' THEN 12+3
        WHEN '12-3' THEN 12-3
    end as TotalSum
from Equations;

select * from Student
where birthday in (select birthday from Student
group by birthday
having count(*) > 1);
select least(PlayerA, PlayerB) as Player1, greatest(PlayerA, PlayerB) as Player2,
sum(Score) as TotalScore from  PlayerScores
group by least(PlayerA, PlayerB),greatest(PlayerA, PlayerB)
order by Player1, Player2;


