--문제1
select first_name 이름,
       salary 월급,
       phone_number 전화번호,
       hire_date 입사일      
from employees
order by hire_date asc;

--문제2
select job_title,
       max_salary
from jobs
order by max_salary desc;

--문제3
select first_name 이름,
       manager_id "매니저 아이디",
       commission_pct "커미션 비율",
       salary 월급    
from employees
where salary>=3000
and commission_pct is null;

--문제4
select job_title,
       max_salary
from jobs
where max_salary>=1000
order by max_salary desc;

--문제5
select first_name,
       salary,
       nvl(commission_pct,0)
from employees
where salary <14000
and salary >=10000
order by salary desc;

--문제6
select first_name 이름,
       salary 월급,
       to_char(hire_date, 'yyyy-mm') 입사일,
       department_id 부서번호
from employees
where department_id = 10
or department_id = 90
or department_id = 100;

--문제7
select first_name 이름,
       salary 월급
from employees
where first_name like '%S%'
or first_name like '%s%';

--문제8
select department_name
from departments
order by length(department_name) desc;

--문제9
select upper(country_name)
from countries
order by country_name asc;

--문제10
select first_name 이름,
       salary 월급,
       replace(phone_number, '.','-')  "전화 번호",
       hire_date 입사일
from employees
where hire_date < '03/12/31';