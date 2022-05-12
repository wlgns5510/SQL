/*****************************
select 문
    select 절
    froma 절
    where 절
    order by 절
*****************************/

--모든 컬럼 조회하기
select *
from employees;

select *
from departments;

--원하는 컬럼만 조회하기
select employee_id, 
       first_name, 
       last_name
from employees;

--예제)
--사원의 이름과 전화번호 입사일 연봉을 출력하세요
select first_name, 
        phone_number, 
        hire_date,  
        salary
from employees;
--사원의 이름과 성 급여, 전화번호, 이메일, 입사일을 출력하세요
select first_name,
       last_name,
       salary,
       phone_number,
       email,
       hire_date      
from employees;
--출력할때 컬럼명 별명 사용하기
--사원의 이름과 전화번호 입사일 급여 로 표시되도록 출력하세요
select first_name "이름",
       phone_number "전화번호",
       hire_date "입사일",
       salary "급여"
from employees;
--사원의 사원번호 이름 성 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
select first_name as 이름,
       last_name  성,
       salary 급여,
       phone_number 전화번호,
       email 이메일,
       hire_date 입사일      
from employees;

--연결연산자(커럼 붙이기)
select first_name,
       last_name
from employees;

select first_name||' '||last_name
from employees;

select first_name || ' hire date is ' || hire_date "입 사 일"
from employees;

--산술 연산자
select first_name, 
       salary,
       salary*12,
       (salary+300)*12
from employees;

select job_id
from employees;

select first_name || '-' || last_name 성명,
       salary 급여,
       salary*12 연봉,
       salary*12+5000 연봉2,
       phone_number
from employees;

/* where절 */
select first_name
from employees
where department_id = 10;

--연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
select first_name,
       salary
from employees
where salary >=15000;
--07/01/01일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name,
       hire_date
from employees
where hire_date>='07/01/01';
--이름이 Lex인 직원의 연봉을 출력하세요
select salary 연봉
from employees
where first_name = 'Lex';

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where salary <=14000
or salary >=17000;
--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name,
       hire_date
from employees
where hire_date>='04/01/01'
and hire_date<='05/12/31';

--IN 연산자로 여러 조건을 검사하기
select first_name,
       last_name,
       salary
from employees
where first_name in ('Neena', 'Lex', 'John');
--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name,
       salary
from employees
where salary in (2100, 3100, 4100, 5100);

--Like연산자로 비슷한것들 모두 찾기
select first_name,
       last_name,
       salary
from employees
where first_name like 'L%';

select first_name,
       last_name,
       salary
from employees
where first_name like 'L___';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where first_name like '%am%';
--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where first_name like '_a%';
--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%';
--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '__a_';

--값이 없는 부분 출력
select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where commission_pct is null;

--값이 있는 부분 출력
select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where commission_pct is not null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name 이름,
       salary*commission_pct "연봉커미션 비율"
from employees
where commission_pct is not null;
--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name,
       salary,
       commission_pct
from employees
where  manager_id is null
and commission_pct is null;

--order by 절을 사용해 보기 좋게 정렬하기
select first_name, salary
from employees
order by salary desc; --내림차순

select first_name, salary
from employees
order by salary asc; --오름차순

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id 부서번호,
       salary 급여,
       first_name 이름
from employees 
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name
from employees
where salary >=10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터
--부서번호 급여 이름을 출력하세요
select department_id 부서번호,
       salary 급여,
       first_name 이름
from employees
order by department_id asc, salary desc; --앞에가 동률일때 뒤의 정렬


/*
단일행 함수
*/
--문자함수 - INITCAO(컬럼명) -앞글자가 대문자로
select email,
       initcap(email),
       department_id
from employees
where department_id = 100;

--문자함수 - lower(모두 소문자), upper(모두 대문자)
select email,
       lower(email),
       upper(email),
       department_id
from employees
where department_id = 100;

--문자함수 -SUBSTR(컬럼명, 시작위치, 글자수)
select first_name,
      substr(first_name,1,3), -- 앞에서1번부터 3개 
       substr(first_name,-3,2)-- 뒤에서 3번부터 2개 
from employees
where department_id = 100;

--문자함수 - LPAD(컬럼명, 자리수, '채울문자') / RPAD(컬럼명, 자리수, '채울문자')
select first_name,
       lpad(first_name, 10, '*'), --왼쪽채움
       rpad(first_name,10,'*')    --오른쪽채움
from employees;

--문자함수 -REPLACE (컬럼명, 문자1, 문자2)
select first_name,
       replace(first_name, 'a','*'), -- 문자1을 문자2로 교체
       replace(first_name,substr(first_name,2,3),'***')
from employees
where department_id=100;

select substr('900214-1234234',8,1)
from dual;

--숫자함수 -ROUND(숫자, 출력을 원하는 자리수) 반올림
select round(123.353, 2)r2,
       round(123.456, 0)r0,
       round(123.456, -1)"r-1"
from dual;

--숫자함수 -TRUNC(숫자, 출력을 원하는 자리수) 그냥버림
select trunc(123.346,2)r2,
       trunc(123.456,0)r0
from dual;

--날짜함수 - SYSDATE()
select sysdate --현재날짜
from dual;

select months_between(sysdate,hire_date)
from employees
where department_id = 110;

--TO_CHAR(숫자, '출력모양') 숫자형->문자형으로 변환하기
select first_name,
       to_char(salary*12, '$0999999.00') --원하는 모양으로 출력가능
from employees
where department_id = 110;

--변환함수 - TO_CHAR(날짜, '출력모양') 날짜->문자형으로 변환하기
select sysdate,
       to_char(sysdate, 'yyyy'),
       to_char(sysdate, 'yy'),
       to_char(sysdate, 'mm'),
       to_char(sysdate, 'month'),
       to_char(sysdate, 'day'),
       to_char(sysdate, 'hh24'),
       to_char(sysdate, 'mi'),
       to_char(sysdate, 'ss'),
       to_char(sysdate, 'yyyy-mm-dd')
       
from dual;
