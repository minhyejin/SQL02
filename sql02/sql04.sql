--1번문제

select e.first_name ||' '|| last_name as name ,
       e.salary, 
       de.department_name, 
       e.hire_date
from employees e, departments de
where hire_date in (select max(hire_date) 
                    from employees)
      and e.department_id = de.department_id;  

--2번문제

select e.employee_id, 
       e.first_name, 
       e.last_name, 
       j.job_title, 
       e.salary
from employees e , jobs j  
where e.job_id = j.job_id 
      and (salary) > all (select max(avg(salary))
                          from employees 
                          group by e.department_id)
order by salary desc;

--3번문제
select d.department_name
from (select department_id, avg(salary)savg 
      from employees 
      group by department_id)s ,
     (select max(avg(salary))smax 
      from employees 
      group by department_id)m, 
      departments d
where s.savg = m.smax 
      and s.department_id = d.department_id; 

--4번문제
   
 select region_name
from (select r.region_name, avg(salary)avg1
      from employees e, 
           departments d,
           locations l, 
           countries c,
           regions r
      where e.department_id = d.department_id 
            and d.location_id = l.location_id 
            and l.country_id = c.country_id
            and c.region_id = r.region_id  
      group by r.region_name)s,
      (select max(avg1)avg2
      from(select avg(salary)avg1
      from employees e, 
           departments d,
           locations l, 
           countries c,
           regions r
      where e.department_id = d.department_id 
            and d.location_id = l.location_id 
            and l.country_id = c.country_id
            and c.region_id = r.region_id  
      group by r.region_id))m
where s.avg1 = m.avg2;

--5번 문제 

select j1.job_title
from (select em.job_id, 
             avg(em.salary)avg1 
      from employees em 
      group by em.job_id)s1,
     (select max(avg(em.salary))max1 
      from employees em, jobs j
      where em.job_id =j.job_id
      group by j.job_id)s2, jobs j1
where s1.job_id = j1.job_id and s1.avg1 = s2.max1;
      