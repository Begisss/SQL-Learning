select p.firstName,p.lastName, ad.city,ad.city  from Person p
  left join Address ad
  on p.personId = ad.personId
select e.name from Employeer E
join Employeer M
on e.managerId = m.id
where e.salary > m.salary
select email from Person
group by email
having count(*) > 1;
select distinct g.ParentName from girls g
 left join boys b
 on b.ParentName = g.ParentName
 where b.ParentName is null
	select C1.Item as 'Item Cart 1',C2.Item as 'Item Cart 2'from Cart1 C1
full join Cart2 C2 on C1.Item = C2.Item
order by 
case when C1.Item is null then 1 else 0 end, 
C1.Item,
C2.Item;
select c.name from Customers c
left join orders o
on c.id = o.customerId
where o.id is null
select  s.student_id, s.student_name,sub.subject_name, count(e.subject_name) as attendedexams from Studentz s
	cross join Subjects sub
	left join  Examinations e
	on s.student_id = e.student_id and sub.subject_name = e.subject_name
	group by  s.student_id, s.student_name, sub.subject_name
	order by s.student_id, s.student_name, sub.subject_name
