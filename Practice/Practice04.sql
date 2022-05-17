--문제1.
--평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
--(56건)
select count(first_name) "직원"    
from employees
where salary < (select avg(salary) --평균 급여 --> 6461.8317xxx~
                from employees);

--문제2. 
--평균급여 이상, 최대급여 이하의 월급을 받는 사원의
--직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차
--순으로 정렬하여 출력하세요
--(51건)
select employee_id 직원번호,
       first_name 이름,
       salary 급여,
       avg(salary) 평균급여,
       max(salary) 최대급여
from employees
where salary >= (select avg(salary)
                from employees) --평균급여)
and salary <= (select max(salary)
              from employees) --최대급여
group by employee_id, first_name, salary
order by avg(salary) asc, max(salary) asc;

--문제3.
--직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소
--를 알아보려고 한다.
--도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주
--(state_province), 나라아이디(country_id) 를 출력하세요
--(1건)
select l.location_id 도시아이디,
       l.street_address 거리명,
       l.postal_code 우편번호,
       l.city 도시명,
       l.state_province 주,
       l.country_id 나라아이디
from employees e, locations l, departments d
where e.department_id = d.department_id
    and d.location_id = l.location_id
    and (e.first_name, e.last_name) = (select e.first_name, --성, 이름이 Steven, King인 사람
                                              e.last_name
                                      from employees e, departments d
                                      where e.department_id = d.department_id
                                        and e.first_name = 'Steven'
                                        and e.last_name = 'King');
                                        
--문제4.
--job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로
--출력하세요 -ANY연산자 사용
select e.employee_id,
       e.first_name,
       e.salary
from employees e, jobs j
where e.job_id = j.job_id
    and salary <any

--문제4.
--job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로
--출력하세요 -ANY연산자 사용
--(74건)
select employee_id 사번,
       first_name || ' ' || last_name 이름,
       salary 급여
from employees
where salary < any(select e.salary
                    from jobs j, employees e
                    where j.job_id = e.job_id
                        and j.job_id = 'ST_MAN')
order by salary desc;
                        
--문제5. 
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여
--(salary) 부서번호(department_id)를 조회하세요
--단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
--조건절비교, 테이블조인 2가지 방법으로 작성하세요
--(11건)

--조건절 비교
select employee_id 직원번호,
       first_name 이름,
       salary 급여,
       department_id 부서번호
from employees
where (department_id, salary) in(select department_id,
                        max(salary)
                from employees
                group by department_id);

--테이블 조인
select e.employee_id 직원번호,
       e.first_name 이름,
       e.salary 급여,
       e.department_id 부서번호
from employees e,(select department_id,
                        max(salary) m
                  from employees
                  group by department_id) s
where e.salary = s.m
    and e.department_id = s.department_id;

--문제6.
--각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
--연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오
--(19건)
select j.job_title 업무명,
       sum(e.salary) 연봉총합
from employees e, jobs j 
where e.job_id = j.job_id
group by e.job_id, j.job_title
order by sum(e.salary) desc;

--문제7.
--자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름
--(first_name)과 급여(salary)을 조회하세요
--(38건)
select e.employee_id 직원번호,
       e.first_name 이름,
       e.salary 급여
from employees e, (select department_id,
                       avg(salary) sal
                from employees
                group by department_id) s
where e.salary > s.sal
    and e.department_id = s.department_id;

--문제8.
--직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력
--하세요
select rn,
       employee_id,
       first_name,
       salary,
       hire_date
from (select rownum rn,
             employee_id,
             first_name,
             salary,
             hire_date
      from (select employee_id,
                   first_name,
                   salary,
                   hire_date
            from employees 
            order by hire_date asc)
        )
where rn >= 11
and rn <= 15;





