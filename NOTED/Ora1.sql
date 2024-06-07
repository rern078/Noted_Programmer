SELECT department_id,department_name 
FROM departments;

SELECT * 
FROM employees;

SELECT last_name,commission_pct,salary*commission_pct+salary AS Total_Salary
FROM employees;

SELECT department_id AS ID,department_name 
FROM departments;

SELECT last_name,salary,salary*12 AS Total 
FROM employees;

SELECT employee_id,last_name,job_id,department_id
FROM employees
WHERE department_id=90;

SELECT last_name,salary,hire_date
FROM employees 
WHERE last_name='King';

SELECT last_name,salary,hire_date
FROM employees 
WHERE hire_date='09-JUL-98'; --DD-MON-RR

SELECT last_name,salary,hire_date
FROM employees 
WHERE hire_date<>'09-JUL-98';--^=,<>,!=

SELECT last_name,salary,hire_date
FROM employees 
WHERE salary BETWEEN 6000 AND 9000;

SELECT last_name,salary,hire_date
FROM employees 
WHERE hire_date BETWEEN '09-JUL-98' AND '31-dec-98';

SELECT last_name,salary,hire_date
FROM employees 
WHERE hire_date LIKE '09-JUL-98';

SELECT last_name,employee_id,hire_date
FROM employees 
WHERE employee_id IN (100,200,300);

SELECT last_name,salary,hire_date
FROM employees 
WHERE last_name='K';

SELECT last_name,salary,hire_date
FROM employees 
WHERE last_name LIKE 'Z%_Y';

SELECT last_name,salary,hire_date
FROM employees 
WHERE last_name LIKE '__o%';

SELECT last_name, job_id
FROM employees
WHERE job_id LIKE 'SA\_%' ESCAPE '\';

SELECT last_name,employee_id
FROM employees 
WHERE employee_id NOT IN(206,100,200);


--2
SELECT last_name,job_id,salary
FROM employees
WHERE last_name LIKE 'Z_%_y';

--3
SELECT last_name,job_id
FROM employees
WHERE job_id LIKE 'AD\_%' ESCAPE '\';

--4
SELECT unique department_id,job_id
FROM employees;

--5
SELECT last_name,job_id,hire_date,salary
FROM employees 
WHERE hire_date LIKE '%-%-98' or hire_date LIKE'%-%-00';

SELECT last_name,salary,hire_date
FROM employees 
WHERE hire_date BETWEEN '%-%-98' AND '%-%-00';

--6
SELECT last_name,manager_id
FROM employees 
WHERE manager_id IS NULL;

--7
SELECT last_name,job_id 
FROM employees
WHERE job_id not in('IT_PROG','ST_CLERK','SA_REP');

--8
SELECT last_name,job_id,hire_date,department_id,salary
FROM employees
WHERE job_id='IT_PROG' AND salary>6500 OR job_id='AD_VP';

--9
SELECT last_name,job_id,salary
FROM employees
WHERE last_name LIKE '%a%n%' OR last_name  LIKE '%n%a%';

--10
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';

-- --11
-- SELECT first_name || q'{,it's assigned Manager ID:}' || manager_id AS "Department and Manager" 
-- FROM employees;

--1
SELECT *
FROM employees ;
DESC employees;

SELECT last_name, job_id,salary 
FROM employees
WHERE job_id='AD_REPS'
AND salary>15000
OR job_id='SA_REP';
/*
CREATE TABLE sr1_khmer(
    id NUMBER(5)
    )
 */  

SELECT last_name,salary,department_id
FROM employees
ORDER BY salary ASC;

SELECT last_name,department_id,salary
FROM employees
ORDER BY department_id ASC,salary DESC;
--Major sort key: department_id
--Minor sort key: salary

SELECT last_name,salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 2 ROW WITH TIES;


SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
FETCH FIRST 5 ROW ONLY;

SELECT last_name,salary
FROM employees
ORDER BY salary DESC
OFFSET 3 ROWS
FETCH NEXT 2 ROW ONLY;

SELECT employee_id,last_name,department_id,manager_id
FROM employees
WHERE department_id=90 AND manager_id=100;


SELECT employee_id,last_name,department_id,manager_id
FROM employees
WHERE department_id=90 OR manager_id=100;

SELECT employee_id,last_name,salary
FROM employees
WHERE employee_id IN(100,205,500);

SELECT last_name,job_id,salary
FROM employees
WHERE job_id='SA_REP'
OR job_id='AD_PRES'
AND salary>15000;

SELECT last_name,salary,job_id,department_id
FROM employees
ORDER BY salary DESC;

SELECT last_name,salary,commission_pct
FROM employees
ORDER BY commission_pct ASC NULLS FIRST;


SELECT last_name,job_id,salary
FROM employees
ORDER BY 2 DESC ,1 ASC;

--------------------------
SELECT last_name,salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 5 ROWS ONLY;

SELECT last_name,salary,department_id
FROM employees
ORDER BY department_id;


SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
FETCH FIRST 5 ROWS WITH TIES;

SELECT last_name,salary,department_id
FROM employees
ORDER By department_id
FETCH FIRST 15 PERCENT ROWS ONLY;


SELECT last_name,salary,department_id
FROM employees
ORDER By department_id
FETCH FIRST 15 PERCENT ROWS ONLY;

SELECT last_name,salary,department_id
FROM employees
ORDER By department_id
OFFSET 2 ROWS
FETCH NEXT 2 ROWS ONLY; 
--------------------------
SELECT  employee_id,last_name,salary
FROM employees
WHERE  salary>&Salary;

SELECT  employee_id,last_name,salary
FROM employees
WHERE last_name='&name';

DEFINE name=d
SELECT  employee_id,last_name,salary,&column
FROM employees
WHERE last_name LIKE '%&name%';

UNDEFINE column
SELECT last_name,salary,&&column
FROM employees
ORDER BY &column DESC;

SELECT last_name,salary,&&column
FROM employees;

--1
select last_name,job_id,hire_date,department_id,salary
from employees
order by last_name DESC;
--2
select department_id, last_name,salary *12 annsal,salary
from employees
order by annsal ASC;
--3
select last_name,job_id,hire_date,department_id,salary
from employees
order by department_id,salary DESC;
--4
--4.
SELECT last_name,salary,commission_pct
FROM employees
where  commission_pct  is not null
ORDER BY commission_pct ASC;

--5

SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';


SELECT  employee_id,last_name,salary
FROM employees
WHERE last_name LIKE '%&name%';

--6
SELECT last_name,hire_date,department_id,salary
FROM employees
ORDER BY salary
FETCH FIRST 5 ROWS WITH TIES;


SELECT employee_id,last_name,salary
FROM employees
WHERE employee_id IN(100,205,500);

SELECT last_name,job_id,salary
FROM employees
WHERE job_id='SA_REP'
OR job_id='AD_PRES'
AND salary>15000;

----------

--9
SELECT last_name,job_id,hire_date,department_id,salary
FROM employees
WHERE &COLUMN;
--8
SELECT last_name,job_id,hire_date,department_id,salary
FROM employees
WHERE department_id='&name';

--8
SELECT  employee_id,last_name,salary
FROM employees
WHERE last_name='&name';

--26/08/21

SELECT last_name,LOWER(last_name),UPPER(last_name),INITCAP(last_name)
FROM employees 
WHERE UPPER(last_name)=UPPER('King');

SELECT first_name,last_name,CONCAT(CONCAT(first_name,' '),last_name)
FROM employees;

SELECT first_name,last_name,first_name || ' '|| last_name
FROM employees;

SELECT last_name,SUBSTR(last_name,3,2),SUBSTR(last_name,3),
    SUBSTR(last_name,-3,2),SUBSTR(last_name,12)
FROM employees;

--3
SELECT last_name ,LENGTH('last_name') 
FROM employees
where LENGTH('last_name')>=5;

SELECT last_name ,LENGTH(last_name)
FROM employees
WHERE LENGTH(last_name)=5;

SELECT last_name,INSTR(last_name,' ')
FROM employees;
WHERE INSTR(last_name,' ')>0;

SELECT last_name,salary--,LPAD(salary,7,'$'
FROM employees;

SELECT  last_name,job_id,REPLACE(job_id,'_','-')
FROM employees;

SELECT last_name,UPPER(last_name),TRIM('R' FROM UPPER
(last_name))
FROM employees;

--7
SELECT last_name,LOWER(last_name),UPPER(last_name),INITCAP(last_name)
FROM employees;
--8
SELECT last_name,SUBSTR(last_name,1,4),SUBSTR(last_name,-4,4)   
FROM employees;
--5
SELECT  last_name,job_id,REPLACE(job_id,'_','-')
FROM employees;
--6
SELECT last_name,TRIM('y' FROM last_name)
FROM employees;

--3

SELECT last_name ,LENGTH('last_name') 
FROM employees
WHERE LENGTH('last_name')>=5;
--4
SELECT last_name,salary,RPAD(salary,7,'$'
FROM employees;

SELECT last_name ,LENGTH('last_name') 
FROM employees
WHERE LENGTH('last_name')>=5;

SELECT last_name,substr(last_name,1,1)from employees 
WHERE substr(last_name,1,1)in('A','B','C','D','F');

SELECT last_name,substr(last_name,-2)
FROM employees 
WHERE substr(last_name,-2)IN('as','ng','ey','ns');

SELECT last_name,salary,instr(last_name,'a'),instr(last_name,' ')
FROM employees;

SELECT last_name,salary,instr(last_name,'a')
FROM employees
WHERE instr(last_name,'a')>=6;

SELECT last_name,salary,ipad(salary,10,'$')
FROM employees;

SELECT last_name,salary,RPAD(salary,10,'$')
FROM employees;

SELECT last_name,job_id,REPLACE(job_id,'_','-')
FROM employees;

SELECT 124.34545, ROUND(124.34545,3)
FROM dual;

SELECT 5,52,5/2,TRUNC(5/2),MOD(5,2)
FROM dual;

SELECT last_name,hire_date
FROM employees 
ORDER BY hire_date ASC;

SELECT TO_CHAR(sysdate ,'DD-MON-RR hh24:mi:ss')
FROM dual;

SELECT TO_CHAR(sysdate +5*7+5/24+5/60/24,'DD-MON-RR hh24:mi:ss')
FROM dual;

SELECT last_name,hire_date,sysdate,(sysdate-hire_date)/7
FROM employees;

SELECT sysdate,ADD_MONTHS(sysdate,5*12)
FROM dual;

SELECT last_name,sysdate,hire_date,MONTHS_BETWEEN(sysdate,hire_date)/12
FROM employees;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

SELECT last_name,sysdate,hire_date,ROUND(hire_date,'MONTH')
FROM employees;
/*
    year
    Month
    Week
    Day
    Hour
    Minute
    Second
    
    Specific Date ==>Date
    Duration ==>Number

    Day(+,-)
        Week(1Week=1*7Day)
        Hour(1Hour=1/24Day)
        Minute(1Minute=1/60Hour=1/60/24Day)
        Second(1Second=60Minute=1/60/60Hour=1/60/60/24Day)
        
        
        
     Month(ADD_MONTHS,MONTHS_BETWEEN)
        Year(1Year=1*12Month)
*/

--1
SELECT TO_CHAR(sysdate)
FROM dual;

SELECT TO_CHAR(sysdate +5*7+5/24+5/60/24,'DD-MON-RR hh24:mi:ss')
FROM dual;
--13
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--8
SELECT last_name,hire_date,sysdate,(sysdate-hire_date)/7
FROM employees;

--9
SELECT last_name,hire_date,hire_date+5
FROM employees;

SELECT last_name,hire_date,hire_date+2*7-- ,'DD-MON-RR'
from employees;

SELECT last_name,hire_date,add_months(hire_date,2)
from employees;

--9
SELECT last_name, sysdate, hire_date, months_between(sysdate,hire_date)
from employees;

--10
SELECT last_name, sysdate, hire_date, months_between(sysdate,hire_date)/12
from employees;
--6
SELECT last_name, hire_date, to_char(hire_date+2*7+2+2/24+2/60/24,'DD-MON-RR hh24:mi:ss')
FROM employees;

SELECT sysdate
FROM dual;

--5
SELECT last_name, hire_date, add_months(hire_date,2*12)
FROM employees;

11. 

SELECT last_name, sysdate, hire_date, 
TRUNC(months_between(sysdate,hire_date)/12),
MOD(months_between(sysdate,hire_date),12)
FROM employees;


--12
SELECT last_name, next_day(hire_date,'mon')
FROM employees;


SELECT last_name,sysdate,hire_date,next_day(hire_date,'MONTH')
FROM employees;




--Mid Term
--1
SELECT LOWER(last_name),UPPER(last_name),INPICAP(last_name)
FROM employees;

--2
SELECT last_name,SUBSTR(last_name,1,4),SUBSTR(last_name,-4,4)
FROM employees;

--3
SELECT last_name,SUBSTR(last_name,1,1)
FROM employees
WHERE SUBSTR(last_name,1,1)IN('A','B','C','D','E','F');

--4
SELECT last_name,SUBSTR(last_name,-2,2)
FROM employees;

--5
SELECT last_name,SUBSTR(last_name,-2,2)
FROM employees;
WHERE SUBSTR(last_name,-2,2)IN('as','ng');

--6
SELECT last_name || q'(earns)' || salary || q'(monthly but wants)' || 3*salary AS "Dream Salaries"
FROM employees;

SELECT CONCAT(CONCAT(CONCAT(CONCAT(last_name,q'(earns)'),salary,q'(monthly but wants)'),3*salary) AS"Dram Salaries"

--7
SELECT last_name, salary, INSTR(last_name, 'a'), INSTR(last_name, ' ')
FROM employees;

--8
SELECT last_name, salary, INSTR(last_name, 'a')
FROM employees
WHERE INSTR(last_name, 'a')>=3;

--9
SELECT last_name, salary, INSTR(last_name,' ')
FROM employees
WHERE INSTR(last_name,' ')>=1;

--10
SELECT last_name, LENGTH(last_name)
FROM employees
WHERE LENGTH(last_name)>=5;

--11
SELECT last_name,salary, LPAD(salary, 10,'$')
FROM employees;

--12
SELECT last_name, job_id, REPLACE(job_id, '_','-')
FROM employees;

--13
SELECT last_name,TRIM('y' FROM last_name)
FROM employees;

--14
SELECT last_name, salary, TRUNC(salary/3000) 
FROM employees;

--15
SELECT last_name, salary, MOD(salary,3000) 
FROM employees;

--16
SELECT SYSDATE
FORM DUAL;

--17
SELECT last_name, hire_date, hire_date +2*7+5
FROM employees;

--18
SELECT last_name, hire_date,hire_date+10/24 --Hour
FROM employees;

--19
SELECT last_name, hire_date,hire_date+20/60/24 --Minute
FROM employees;

--20
SELECT last_name, hire_date,hire_date+30/60/60/24 --Second
FROM employees;

--21
SELECT last_name, hire_date,(sysdate-hire_date)
FROM employees;

--22
SELECT last_name, hire_date, TRUNC((sysdate-hire_date)/7 ,0), MOD(sysdate-hire_date, 7)
FROM employees;

--23
SELECT last_name,hire_date,To_CHAR(hire_date+2*7+2+5/24+30/60/24, 'dd-mm-yyyy hh24:mi:ss')
FROM employees;

--26
SELECT last_name, hire_date, ADD_MONTHS(hire_date,2),ADD_MONTHS(hire_date,2*12) 
FROM employees;

--27
SELECT last_name, hire_date,ADD_MONTHS(hire_date, -2,*12)
FROM employees;

--28
SELECT  last_name, sysdate, hire_date , MONTHS_BETWEEN(sysdate, hire_date)
FROM employees;

--29
SELECT last_name, sysdate, hire_date, MONTHS_BETWEEN(sysdate, hire_date)/12
FROM employees;

--30
SELECT last_name, sysdate, hire_date, MONTHS_BETWEEN(sysdate,hire_date)/12, MOD(MONTHS_BETWEEN(sysdate,hire_date),12)
FROM employees;

/*

FUNCTION
-Single Row Function (1Row=1Result)
    -Character Function
    -Number Function
    -Date Function
    -Conversion Function
    -General Function
    
-Multiple Row Function (Many Rows=1Result)

Implicit=Automatic
Explicit=Manual

*/

CREATE TABLE sr1_implicit(
    id NUMBER(5),
    name VARCHAR(25),
    hire_date DATE
);
SELECT * 
FROM sr1_implicit;

DESC sr1_implicit;

INSERT INTO sr1_implicit
VALUES('4', 'MAO','3-AUG-21');


SELECT *
FROM sr1_implicit
WHERE id='3';

--FM -ZERO NUMBER IN FRONT
--YYYY FULL YEAR IN NUMBERS
--YEAR YEAR SPELLED OUT(IN ENGLISH)
--MM TWO-DIGIT VALUE FOR THE MONTH
--MONTH FULL NAME OF THE MONTH
--MON THREE-LETTER ABBREVIATION OF THE MONTH
--DY THREE-LETTER ABBREVIATION OF THE DAY OF THE WEEK
--DAY FULL NAME OF THE DAY OF THE WEEK
--DD NUMERIC DAY OF THE MONTH

SELECT last_name, hire_date, TO_CHAR(hire_date, 'YYYY-MON-DD "SPELL" YEAR MONTH DAY HH:MI:SS PM')  
FROM employees;

SELECT last_name, salary,TO_CHAR(salary, '000000') ||'RIEL' ,TO_CHAR(salary, 'L999,999,999.00')
FROM employees;

INSERT INTO sr1_implicit
VALUES(TO_NUMBER('6'),50, '1-AUG-21');

INSERT INTO sr1_implicit
VALUES(TO_NUMBER('10'),50, TO_DATE('05/21/2021','mm-dd-yyyy'));

--1
SELECT last_name, REPLACE(last_name,'o','a')
FROM employees;
--2
SELECT employee_id,last_name,salary *12 as annsal ,salary
FROM employees
ORDER BY annsal ASC;

--3
SELECT last_name,job_id,salary
FROM employees
WHERE salary>10000;

--5
SELECT last_name,sysdate, hire_date,Months_between(sysdate,hire_date)/12
FROM employees;
--6
SELECT last_name,hire_date,To_char(hire_date+2*7,'DAY DD,MONTH,YYYY')
FROM employees;

SELECT '$12,435.50',To_number('$12,435.50','$99,999.00')
FROM dual;

SELECT last_name, hire_date, department_id
FROM employees
WHERE hire_date NOT LIKE '%-%-00';

select 'Monday 16, December ,2019', to_date('Monday 16, December ,2019','DAY DD, MONTH, YYYY')
FROM dual;

SELECT last_name, hire_date, department_id
FROM employees
WHERE hire_date<'01-jan-00';

SELECT last_name, instr(last_name,'e')
FROM employees
WHERE instr(last_name,'e')=4;

SELECT sysdate, to_char(sysdate, '"Today is" day "of" month yyyy')
FROM dual;

--==================================
--29/09/2021
--==================================

SELECT last_name,salary ,NVL(commission_pct, 0), salary*NVL(commission_pct, 0),
    salary*NVL(commission_pct, 0)+salary
FROM employees;

SELECT last_name, commission_pct, NVL(TO_CHAR(commission_pct),'NO COM')
FROM employees; 

SELECT last_name, salary,commission_pct,NVL2(commission_pct,'COM+SAL','SAL'),
    NVL2(commission_pct, salary+salary*commission_pct, salary)
FROM employees;

SELECT first_name, last_name, LENGTH(first_name), LENGTH(last_name),
    NULLIF(LENGTH(first_name),LENGTH(last_name)),
    NVL2(NULLIF(LENGTH(first_name),LENGTH(last_name)),'DIFFERNT','THE SAME')
FROM employees;

SELECT last_name, commission_pct, manager_id, COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id),'NO COM AND ON MANAGER')
FROM employees;

SELECT last_name, job_id, salary,
    CASE job_id WHEN 'AD_PRES' THEN salary*1.10
                WHEN 'AD_VP'   THEN salary*1.15
                WHEN 'IT_PROG' THEN salary*1.20
                ELSE salary
    END AS "Revised Salary1",
    
    CASE        WHEN job_id='AD_PRES' THEN salary*1.10
                WHEN job_id='AD_VP'   THEN salary*1.15
                WHEN job_id='IT_PROG' THEN salary*1.20
                ELSE salary
    END AS "Revised Salary2"
FROM employees;

SELECT last_name, job_id, salary,
    CASE job_id WHEN 'AD_PRES' THEN salary*1.10
                WHEN 'AD_VP'   THEN salary*1.15
                WHEN 'IT_PROG' THEN salary*1.20
                ELSE salary
    END AS "Revised Salary3",
    DECODE(job_id , 'AD_PRES' , salary*1.10
                  , 'AD_VP'   , salary*1.15
                  , 'IT_PROG' , salary*1.20
                  , salary
    )AS "Revised Salary4"
FROM employees;

SELECT last_name, salary,salary/2000,TRUNC(salary/2000,0),
    DECODE(TRUNC(salary/2000,0) ,0,0.00
                                ,1,0.09
                                ,2,0.20
                                ,3,0.30
                                ,4,0.40
                                ,5,0.42
                                ,6,0.43
                                ,0.45
    )AS Tax_Rate1,
    CASE WHEN salary BETWEEN 0 AND 1999 THEN 0.00
         WHEN salary BETWEEN 2000 AND 3999 THEN 0.09
         WHEN salary BETWEEN 4000 AND 5999 THEN 0.20
         WHEN salary BETWEEN 6000 AND 7999 THEN 0.30
         WHEN salary BETWEEN 8000 AND 9999 THEN 0.40
         WHEN salary BETWEEN 10000 AND 11999 THEN 0.42
         WHEN salary BETWEEN 12000 AND 13999 THEN 0.43
         ELSE 0.45
    END AS Tax_Rate2
FROM employees;

--1
SELECT last_name, manager_id, manager_id
FROM employees;

SELECT last_name, commission_pct, manager_id, COALESCE(TO_CHAR(manager_id),'-1')
FROM employees;

--1
SELECT last_name, manager_id, NVL(manager_id,-1) Manager
FROM employees;

--2
SELECT last_name, manager_id, COALESCE(TO_CHAR(manager_id),'Top Manager') Manager
FROM employees;

--3
SELECT last_name, commission_pct,NVL2(commission_pct,'Yes','No') AS "Commission"
FROM employees;

--4
SELECT last_name, commission_pct, NVL2(commission_pct,
    salary*12+salary*12*commission_pct,salary*12) AS "AnSal"
FROM employees;

--5
SELECT last_name, LENGTH(first_name), LENGTH(last_name),NULLIF(LENGTH(first_name), 
    LENGTH(last_name))
FROM employees;

--6
SELECT last_name, LENGTH(first_name), LENGTH(last_name), 
    NVL(TO_CHAR(NULLIF(LENGTH(first_name), LENGTH(last_name))),'OK')
FROM employees;

--7
SELECT job_id, 
    DECODE(job_id,'AD_PRES' ,'A'
                 ,'ST_MAN'  ,'B'
                 ,'IT_PROG' ,'C'
                 ,'SA_REP'  ,'D'
                 ,'ST_CLERK','E'
                 ,'F'
     ) AS Grade
FROM jobs;

--8
SELECT last_name,salary,
        CASE WHEN salary<1000 THEN salary*1.09
             WHEN salary<2000 THEN salary*1.08
             WHEN salary<3000 THEN salary*1.07
             WHEN salary<4000 THEN salary*1.06
             ELSE salary*1.05
        END AS "Increase_Salary"
FROM employees;

--12/10/2021
--==============================================
SELECT SUM(salary), MIN(salary), MAX(salary), AVG(salary)
FROM employees;

SELECT last_name, salary, department_id
FROM employees
WHERE department_id=50;

SELECT SUM(salary), MIN(salary), MAX(salary), AVG(salary)
FROM employees
WHERE department_id=50;

SELECT MIN(last_name), MAX(hire_date)
FROM employees;

SELECT last_name 
FROM employees
WHERE hire_date='29-JAN-00';

SELECT last_name, manager_id
FROM employees;

SELECT COUNT(manager_id)
FROM employees;

SELECT COUNT(*)
FROM employees;

SELECT COUNT(DISTINCT manager_id) AS "Number Of Manager"
FROM employees;

SELECT SUM(commission_pct)
FROM employees;

SELECT AVG(NVl(commission_pct, 0))
FROM employees;

SELECT last_name, commission_pct, NVl(commission_pct, 0) 
FROM employees;

SELECT department_id, SUM(salary) AS Total
FROM employees
GROUP BY department_id;

SELECT SUM(salary) AS Total
FROM employees
WHERE department_id=50;

SELECT department_id, SUM(salary) AS Total
FROM employees
GROUP BY department_id;

SELECT department_id, job_id, SUM(salary) AS Total 
FROM employees
GROUP BY department_id, job_id;

SELECT manager_id, SUM(salary) AS Total        --SELECT
FROM employees                                 --FROM
WHERE manager_id IS NOT NULL                   --WHERE
GROUP BY manager_id                            --GROUP BY
HAVING SUM(salary)>10000                       --HAVING
ORDER BY manager_id ASC;                       --ORDER BY

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary)=19333.3333333333333333333333333333333333;

SELECT last_name, salary,TO_CHAR(salary, '000000') ||'RIEL' ,TO_CHAR(salary, 'L999,999,999.00')
FROM employees;

SELECT last_name,salary ,NVL(commission_pct, 0), salary*NVL(commission_pct, 0),
    TO_CHAR(salary*NVL(commission_pct, 0)+salary,'L99,999,999.00')
FROM employees;

--1
SELECT employee_id, last_name, salary, salary*NVL(commission_pct, 0)+salary
FROM employees;

--2
SELECT TO_CHAR(SUM(salary),'L99,999,999.00'), TO_CHAR(MIN(salary),'L99,999,999.00'), 
    TO_CHAR(MAX(salary),'L99,999,999.00')
FROM employees
WHERE department_id=60;

--3
SELECT department_id, TO_CHAR(SUM(salary),'L999,999,999.00'), TO_CHAR(MIN(salary),'L99,999,999.00'), 
    TO_CHAR(MAX(salary),'L99,999,999.00')
FROM employees
GROUP BY department_id;

--4
SELECT COUNT(DISTINCT job_id)
FROM employees;

--5
SELECT last_name,department_id
        ,TO_CHAR(DECODE(department_id ,50,1.05 *salary
                                      ,60,1.10 *salary
                                      ,70,1.12 *salary
                                      ,80,1.15 *salary
                                      ,1.20 *salary
        ),'$99,999,999.00') AS "Increase salary"
FROM employees;

--6
SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY job_id;



SELECT last_name, department_id,
        CASE WHEN department_id<50 THEN salary*1.05
             WHEN department_id<60 THEN salary*1.10
             WHEN department_id<70 THEN salary*1.12
             WHEN department_id<80 THEN salary*1.15
             ELSE department_id*1.20
        END AS "Increase_Salary"
FROM employees;

SELECT employee_id, last_name, department_id, department_name
FROM employees NATURAL JOIN departments;

SELECT department_id, department_name, location_id, city
FROM departments NATURAL JOIN locations;

SELECT employee_id, last_name, department_id, department_name
FROM employees JOIN departments
USING(department_id);

SELECT employee_id, last_name, department_id, department_name
FROM employees JOIN departments
ON employees;

--1
SELECT COUNT(*) AS "Number of departments"
FROM departments;
--2
SELECT location_id, COUNT(department_name)
FROM departments
GROUP BY location_id;
--3
SELECT department_id, department_name, location_id, city
FROM departments NATURAL JOIN locations;
--4
SELECT city, COUNT(department_name) "Number of departments"
FROM departments NATURAL JOIN locations
GROUP BY city;
--5
SELECT department_name, city, country_name
FROM departments NATURAL JOIN locations NATURAL JOIN country;
--6
SELECT department_id, department_name, location_id, city 
FROM departments NATURAL JOIN locations;
--7
SELECT department_id, department_name, location_id, city
FROM departments JOIN locations
USING (location_id);
--8
SELECT d.department_id, d.department_name, d.location_id, city, l.location_id
FROM departments d JOIN locations l
ON (l.location_id=d.location_id);
--9
SELECT department_id, department_name, city, country_name
FROM departments NATURAL JOIN locations NATURAL JOIN country;
--10
SELECT department_id, department_name, city, country_name
FROM departments JOIN locations
USING (location_id)
JOIN country
USING (country_id);
--11
SELECT d.department_id, d.department_name, l.city, c.country_name, l.country_id, c.country_id
FROM department d JOIN locations l
ON (l.location_id=d.location_id)
JOIN countries c
ON (l.country_id=c.country_id);

===========================================
SELECT department_id, department_name, location_id, city , state_province
FROM departments NATURAL JOIN locations;

SELECT employee_id, last_name, employees.manager_id, department_id, department_name, departments.manager_id
FROM employees JOIN departments
USING(department_id);

SELECT d.department_id, department_name, d.manager_id, employee_id, last_name, e.manager_id
FROM departments d JOIN employees e
ON d.manager_id=employee_id;

SELECT employee_id, last_name, manager_id 
FROM employees
ORDER BY employee_id;

SELECT e.last_name AS Employees, m.last_name AS Manager
FROM employees e JOIN employees m 
ON e.manager_id=m.employee_id
ORDER BY e.employee_id;

SELECT last_name, salary, grade_level
FROM employees JOIN job_grades
ON salary BETWEEN lowest_sal AND highest_sal;

SELECT * 
FROM job_grades;

SELECT employee_id, last_name, d.department_id, department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id=d.department_id;

SELECT employee_id, last_name, d.department_id, department_name
FROM employees e FULL JOIN departments d
ON e.department_id=d.department_id;

SELECT * 
FROM departments;

SELECT last_name, department_name
FROM employees JOIN departments
ON employees.department_id=departments.department_id;

SELECT last_name, department_name
FROM employees CROSS JOIN departments;

SELECT last_name, department_name
FROM employees, departments
WHERE employees.department_id=departments.department_id;




--1
SELECT department_id, department_name, city , state_province
FROM departments NATURAL JOIN locations;

--2
SELECT employee_id AS emp, last_name As department_name
FROM employees e 
JOIN departments d
ON d.department_id = e.department_id;

--3
SELECT d.department_id, d.department_name, e.last_name AS "Mgr"
FROM departments d JOIN employees e
ON d.manager_id=e.employee_id;

--4
SELECT e.employee_id AS emp_id, e.last_name AS Emp, e.manager_id AS mgr_id, m.last_name AS Mgr
FROM employees e JOIN employees m
ON e.manager_id=m.employee_id;

--5
SELECT employee_id, last_name, salary, grade_level
FROM employees JOIN job_grades
ON salary BETWEEN lowest_sal AND highest_sal;

--6
SELECT last_name, department_id, department_name 
FROM employees NATURAL JOIN departments;

--7
SELECT last_name, department_id, department_name 
FROM employees JOIN departments
USING (department_id) ;

--8
SELECT e.last_name, d.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id=d.department_id;

--9
SELECT e.last_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id=d.department_id;

--10
SELECT e.last_name, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id=d.department_id;

--11
SELECT e.last_name, d.department_id, d.department_name
FROM employees e 
FULL OUTER JOIN departments d
ON e.department_id=d.department_id;

=======================================================

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary>(SELECT salary 
              FROM employees
              WHERE last_name='Abel');

SELECT last_name, salary 
FROM employees
WHERE hire_date=(SELECT MIN(hire_date)
                 FROM employees);
                 
SELECT employee_id last_name, department_id, department_name
FROM  employees JOIN departments
USING (department_id)
WHERE department_name='IT';

SELECT employee_id last_name, department_id
FROM  employees
WHERE department_id=(SELECT department_id
                     FROM departments
                     WHERE department_name='IT');

SELECT department_id
FROM departments
WHERE department_name='IT';

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE (SELECT salary
    FROM employees
    WHERE last_name='Abel')<salary;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary>(SELECT salary
                FROM employees
                WHERE last_name='Abel');

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id=(SELECT job_id
                FROM employees
                WHERE last_name='Taylor')
AND salary>(SELECT salary
                FROM employees
                WHERE last_name='Taylor');

SELECT employee_id, last_name, job_id, manager_id, salary
FROM employees
WHERE salary=(SELECT MIN(salary)
                FROM employees);


--1
SELECT last_name, salary
FROM employees
WHERE salary=(SELECT MAX(salary)
                FROM employees);

--2
SELECT last_name, salary
FROM employees
WHERE salary=(SELECT MIN(salary)
                FROM employees);
    
--3
SELECT last_name, salary 
FROM employees
WHERE hire_date=(SELECT MIN(hire_date)
                 FROM employees);
 
--4
SELECT last_name, salary, hire_date
FROM employees
WHERE hire_date=(SELECT MAX(hire_date)
                 FROM employees);

--5
SELECT last_name, hire_date
FROM employees
WHERE hire_date=(SELECT hire_date
                 FROM employees
                 WHERE last_name='Gietz')
AND last_name <> 'Gietz';

--6
SELECT department_id,department_name
FROM departments
WHERE department_id NOT IN(SELECT department_id
                           FROM employees
                           WHERE department_id IS NOT NULL);



--5
SELECT last_name,salary ,
    TO_CHAR(salary*NVL(commission_pct, 0)+salary,'L99,999,999.00')
FROM employees;



--1
select count(unique job_id)
from employees;

--2
select e.last_name, l.city, d.department_name
from employees e join departments d
on e.department_id=d.department_id
join locations l on l.location_id=d.location_id;

--3
select to_char(sysdate , 'DAY, MONTH DD, YYYY')
from dual;

--4
select last_name, department_id, department_name
from employees join departments
using(department_id);

--5

--6
select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history;

--7
select department_id, min(salary)
from employees;

--8
select employee_id
from employees 
minus
select employee_id
from job_history;

--11
select last_name, salary, nvl(commission_pct,0)
from employees;

--12
select department_id,sum(salary),count(*) 
from employees 
group by department_id;

--10
select last_name, city, department_name
from employees join departments
using (department_id) join
locations using (location_id);

--9
select last_name, hire_date
from employees
where hire_date>(select hire_date
 from employees
 where last_name like 'Davies');
 
 --7
 select department_name, min(salary)
 from departments join employees
 using (department_id)
 group by department_name
 having department_name not like 'IT'
 and min(salary)<>2500
 order by department_name;
 

SELECT * 
FROM ora2.emp80_sr1; 

SELECT *
FROM ora2.emp_sr2;

CREATE SYNONYM ora1_esr1
FOR ora2.emp_sr1;

SELECT * FROM ora1_esr1;


--=====================================================
--4
GRANT SELECT 
ON employees
TO Nita;

--5
GRANT SELECT, UPDATE(Department_name, Department_ID)
ON Ora1.departments 
TO Nita
WITH GRANT option;

--6
GRANT SELECT, UPDATE(Department_name, Department_ID )
ON Ora1.departments
TO hr;

--7
SELECT *
FROM role_sys_privs;

--10
CREATE VIEW DEPT50
AS SELECT employee_id, last_name, department_id
FROM Ora1.employees
WHERE department_id=50
WITH CHECK OPTION;

GRANT SELECT, UPDATE(Salary,Manager_id, department_id)
ON Ora1.employees 
TO Nita;



 GRANT SELECT
on Ora1.Regions
to Nita
with GRANT option;



TRUNCATE TABLE sal_history;

TRUNCATE TABLE mgr_history;

SELECT * 
FROM sal_history;














