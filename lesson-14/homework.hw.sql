select *, substring(name, 1, CHARINDEX(',', name) - 1) as first_name,
      substring(name, CHARINDEX(',', name) + 1, len(name)) as last_name
      from TestMultipleColumns
select * from TestPercent
where strs like '%[%]%'
SELECT s.Id,value as Part
from Splitter s
CROSS APPLY STRING_SPLIT(s.Vals, '.') as split;
select translate('1234ABC123456XYZ1234567890ADS', '0123456789', 'XXXXXXXXXX') as ReplacedString;
select * from testDots
where len(Vals) - len(replace(Vals, '.', '')) > 2;
select texts,LEN(texts) - LEN(REPLACE(texts, ' ', '')) as SpaceCount
from CountSpaces;
select 
    e.EmployeeID,
    e.Name as EmployeeName,
    e.Salary as EmployeeSalary,
    m.Name as ManagerName,
    m.Salary as ManagerSalary
from Employee e
join Employee m on  e.ManagerID = m.EmployeeID
where e.Salary > m.Salary;
  select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE,datediff(year, HIRE_DATE, getdate()) as YearsOfService from employees
  where  datediff(year, HIRE_DATE, getdate()) > 10  
  and datediff(year, HIRE_DATE, getdate()) < 15
select
    REPLACE(TRANSLATE('rtcfvty34redt', '0123456789', '          '), ' ', '') as CharactersOnly,
    REPLACE(TRANSLATE('rtcfvty34redt', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', REPLICATE(' ', 52)), ' ', '') as IntegersOnly;
select w1.Id from weather w1
join weather w2 on DATEDIFF(day, w2.RecordDate, w1.RecordDate) = 1
where w1.Temperature > w2.Temperature
order by w1.RecordDate;
select  player_id,
min(event_date) as first_login
from Activity
group by player_id;
selecct 
    substring(
        fruit_list,
        CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) + 1,
        CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) + 1) - 
        CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) - 1) as third_fruit from fruits;
CREATE TABLE CharacterTable (
    Position INT,
    Character CHAR(1)
);

WITH RECURSIVE SplitString AS (
    SELECT 
        1 AS Position,
        SUBSTRING('sdgfhsdgfhs@121313131', 1, 1) AS Character
    UNION ALL
    SELECT 
        Position + 1,
        SUBSTRING('sdgfhsdgfhs@121313131', Position + 1, 1)
    FROM SplitString
    WHERE Position < LEN('sdgfhsdgfhs@121313131')
)
INSERT INTO CharacterTable (Position, Character)
SELECT Position, Character FROM SplitString;
SELECT * FROM CharacterTable ORDER BY Position;
select p1.id,
case when p1.code = 0 then p2.code  
else p1.code 
end as final_codefrom p1
join p2 
on p1.id = p2.id;
select 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) as YearsWithCompany,
    CASE 
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 6 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 11 AND 20 THEN 'Senior'
      else 'Veteran'
    end as EmploymentStage
from Employees;
select  Id,vals,
    left(vals, 
         PATINDEX('%[^0-9]%', VALS + 'X') - 1
    ) as LeadingInteger
from GetIntegers
where vals is not null
      and PATINDEX('%[0-9]%', VALS) = 1;  
SELECT *,CHARINDEX(',', Vals) FROM MultipleVals

;WITH CTE AS(
SELECT *,PATINDEX('%,%', Vals)AS COMMA_IND
		,SUBSTRING(VALS,1,PATINDEX('%,%', Vals)-1) AS TILL_1ST_COMMA
FROM MultipleVals
), CTE1 AS(
--SUBSTRING (COLUMN,START_POS,LENGTH)
SELECT *,
--		COL,	START				,  LENGTH
SUBSTRING(VALS, --START
				CHARINDEX(',', Vals)+1,--LENGTH
				CHARINDEX(',', VALS, CHARINDEX(',', Vals)+1) - (CHARINDEX(',', Vals)+1)) AS SECOND_PIECE
				,CHARINDEX(',', VALS, CHARINDEX(',', Vals)+1) AS SECOND_COMMA
FROM CTE
), FINALL AS (
SELECT ID,Vals,TILL_1ST_COMMA,SECOND_PIECE,SUBSTRING(VALS,SECOND_COMMA+1,LEN(VALS)) AS REMAINING_PART,
SECOND_PIECE + ',' +  TILL_1ST_COMMA AS START
FROM CTE1
)
SELECT ID,Vals,START + ',' + REMAINING_PART AS OUTPUTT FROM FINALL
--SECOND_COMMA-FIRST_COMMA
INSERT INTO MultipleVals VALUES(3, 'FG,RTY,DFG,SDFG')
--a,b,c
SELECT * FROM MultipleVals
select  a.player_id,a.device_id as first_login_device from Activity a
join (select player_id, min(event_date) as first_login_date from Activity
group by player_id) 
first on a.player_id = first.player_id and a.event_date = first.first_login_date;

