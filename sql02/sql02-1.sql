--1번문제 
/*
 * 각 사원에 대해서 사번, 이름, 부서명, 매니저의 이름을 조회하세요
 */
 select em.employee_id, 
        em.first_name, 
        de.department_name, 
        man.first_name
 from employees em, employees man, departments de
 where em.manager_id = de.manager_id;
 
--2번문제
/*
 * 지역에 속한 나라들을 지역이름, 나라이름으로 출력하되 지역이름, 나라이름 순서대로 내림차순으로 정렬하세요
 */
select re.region_name, co.country_name
from countries co, regions re 
where co.region_id = re.region_id
order by re.region_name desc;

--3번문제
/*
 * 각 부서에 대해서 부서번호, 부서이름, 매니저의 이름, 
 * 위치한 도시, 나라의 이름 그리고 지역구분의 이름까지 전부 출력하세요
 */
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
/*
 * public Accountant의 직책으로 과거에 근무한적이 있는 모든 사원의 사번과
 * 이름을 출력하세요. 이름은 first_name과 last_name을 합쳐 출력합니다.
 */
select  em.employee_id, 
        em.first_name || em.last_name 
from job_history jo , jobs j ,employees em
where jo.job_id=j.job_id 
      and job_title='Public Accountant'
      and em.employee_id = jo.employee_id;
      
--5번 문제
/*
 * 직원들의 사번, 이름, 성과 부서이름을 조회하여
 * 성(last_name)순서로 오름차순 정렬하세요
 */
select em.employee_id, 
       em.first_name, 
       em.last_name, 
       de.department_name
from employees em , 
     departments de
where em.department_id = de.department_id
order by last_name asc;

--6번문제
/*
 * 자신의 매니저보다 채용일이 빠른 사원의 사번, 성, 채용일을 조회하세요
 */
select em.employee_id, 
	   em.last_name, 
	   em.hire_date, 
	   man.manager_id
from employees em, employees man
where man.hire_date > em.hire_date
      and em.manager_id = man.employee_id;


