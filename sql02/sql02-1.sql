--1번문제 
 select em.employee_id, 
        em.first_name, 
        de.department_name, 
        man.first_name
 from employees em, employees man, departments de
 where em.manager_id = de.manager_id;
 
--2번문제
select re.region_name, co.country_name
from countries co, regions re 
where co.region_id = re.region_id
order by re.region_name desc;
--3번문제
select de.department_id, 
       de.department_name, 
       man.first_name, 
       lo.city,
       co.country_name, 
       re.region_name
from employees man, 
     departments de, 
     locations lo, 
     countries co , 
     regions re
where man.employee_id = de.manager_id 
      and de.location_id= lo.location_id 
      and lo.country_id = co.country_id 
      and co.region_id = re.region_id; 
      
--4번문제
select  em.employee_id, 
        em.first_name || em.last_name 
from job_history jo , jobs j ,employees em
where jo.job_id=j.job_id 
      and job_title='Public Accountant'
      and em.employee_id = jo.employee_id;
      
--5번 문제
select em.employee_id, 
       em.first_name, 
       em.last_name, 
       de.department_name
from employees em , 
     departments de
where em.department_id = de.department_id
order by last_name asc;

--6번문제



