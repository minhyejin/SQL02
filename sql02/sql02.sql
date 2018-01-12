
--1번 문제
/*직원중에 최고임금과 최저임금을 "최고임금,최저임금"프로젝션 타이틀로 함께 출력해보세요. 두임금의 차이는 얼마인가요? 
 * "최고임금-최저임금"이란 타이틀로 함께 출력해보세요 
 */
select max(salary) "최고임금",
       min(salary) "최저임금", 
       max(salary)-min(salary)
 from employees;
--2번문제
--마지막으로 신입사원이 들어온날이 언제입니까? 년 월 일로 표현 
select to_char(max(hire_date),'YYYY"년"MM"월"DD"일"')
from employees;
--3번 문제
/*
 * 부서별로 평균임금, 최고임금, 최저임금을 부서와 함께 출력하고 
 * 정렬순서는 평균임금, 최고임금, 최저임금의 내림차순입니다. 
 */
select department_id, 
       round(avg(salary),2)"평균임금", 
       max(salary)"최대연봉", 
       min(salary)"최소연봉"
from employees
group by department_id
order by department_id desc;
--4번문제
/*
 * 업무별로 평균임금, 최고임금, 최저임금을 업무와 함께 출력하고 정렬순서는
 * 평균연봉, 최고임금, 최저임금의 내림차순입니다. 
 */
select job_id, max(salary), min(salary)
from  employees
group by job_id
order by job_id desc;
--5번문제
--가장 오래 근속한 직원의 입사일은 언제입니까? 년월일로 출력하세요
 select max(to_char(hire_date,'YYYY"년"MM"월"DD"일"'))
 from employees;
--6번문제
/*
 * 평균임금과 최저임금의 차이가 2000미만인 부서, 평균임금, 최저임금 그리고 평균임금-최저임금을 내림차순으로 정렬해서 출력하세요
 */
select department_id, 
       round(avg(salary),2),
       min(salary), 
       round(avg(salary)-min(salary),2)
from employees
group by department_id
having avg(salary)-min(salary) <2000
order by avg(salary)-min(salary) desc;
--7번문제
/*
 * 업무별로 최고임금과 최저임금의 차이를 출력해보세요.
 * 차이를 확인할 수 있도록 내림차순으로 정렬하세요 
 */
select job_id, max(salary), min(salary), max(salary)-min(salary) "차이"
from employees
group by job_id
order by max(salary)-min(salary) desc;

 
 

