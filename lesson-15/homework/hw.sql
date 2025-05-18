select * from employees
where salary = (select min(salary) from employees);
select * from products
where price > (select avg(price) from products);
select d.department_name,em.name from departments d
left join employee em
on d.id = em.department_id 
where d.id = 1
select c.name,o.order_id from customers c
join orders o
on c.customer_id=o.customer_id
select p.* from products p
where p.price = (select max(price) from products
where category_id = p.category_id);
select e.* from employees e
join (select top 1 department_id from employees
group by department_id
order by avg(salary) desc) as top_dept 
on e.department_id = top_dept.department_id;
 select  e.* from employees e
where e.salary > (select AVG(salary) from employees
 where department_id = e.department_id);
select g.* from grades g
where g.grade = (select MAX(grade) from grades
where student_id = g.student_id);
with RankedProducts as 
(select *,DENSE_RANK() over (partition by category_id order by price desc) as price_rank from product)
select id, product_name, price, category_id from RankedProducts
where price_rank = 3;
select e.id,e.name,e.salary,e.department_id from employeess e
where e.salary >= (select AVG(salary) from employeess)
and e.salary <= (select MAX(salary) from employeess 
where department_id = e.department_id)
order by e.department_id, e.salary desc;

