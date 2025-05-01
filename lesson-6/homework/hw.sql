select distinct  least(col1, col2) as col_min,
greatest(col1, col2) AS col_max
from InputTbl;
select col1, col2 from InputTbl
group by col1, col2;
select * from section1
where id % 2 = 1;
select top 1 *
from section1
order by id 
select * from section1
where id = (select min(id) from section1);
select * from section1
where id = (select max(id) from section1);
select * from section1
where name like 'b%'
select * from ProductCodes
where code like'%[_]%'
