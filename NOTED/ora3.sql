SELECT * 
FROM departments;

DELETE departments
WHERE department_id IN (70,71,72,73);

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(70,'Public Relation', 200, 1400);

INSERT INTO departments
VALUES(71,'Public Relation1', 200, 1400);

INSERT INTO departments(department_id, department_name)
VALUES(72,'Public Relation2');

INSERT INTO departments
VALUES(73,'Public Relation3', Null, Null);

SELECT *
FROM employees;

CREATE TABLE emp_chamrern AS
SELECT employee_id, last_name, salary, hire_date
FROM employees
WHERE salary>10000;

SELECT *
FROM emp_chamrern;

INSERT INTO emp_chamrern
VALUES(1,'MAO', 15000, SYSDATE);

INSERT INTO emp_chamrern
VALUES(2,'MATEO', 15000, '10-NOV-22');

INSERT INTO emp_chamrern
VALUES(3,'MATETARANE', 12000, TO_DATE('10-10-23', 'DD,MM,RR'));

INSERT INTO emp_chamrern
VALUES(&employee_id,'&last_name', &salary, TO_DATE('&hire_date', 'DD,MM,RR'));

SELECT * 
FROM employees;

SELECT * 
FROM emp_chamrern;

INSERT INTO emp_chamrern(employee_id, last_name, salary, hire_date)
SELECT employee_id, last_name, salary, hire_date
FROM employees
WHERE salary>7000;

SELECT *
FROM staff;

--1
DROP TABLE staff;

--2
CREATE TABLE staff(id number(5), 
            name varchar2(50), salary number(7,2), hire_date date);

--3
INSERT INTO staff(id, name, salary, hire_date)
SELECT employee_id, last_name, salary, hire_date
FROM employees
WHERE commission_pct IS NOT null;

--4
INSERT INTO staff(id, name, hire_date)
VALUES(1,'Panha',SYSDATE);

--5
INSERT INTO staff
VALUES(2,'Makara', 10000, TO_DATE('01-01-2020', 'DD,MM,RR'));

--6
UPDATE staff
SET salary = 12000
WHERE name='Makara';

--7

DELETE staff
WHERE id IN (SELECT employee_id
             FROM employees);

--8
SELECT *
FROM staff;


--====================================================================

--1
create table orders(order_id number(5), 
             customer_id number(5), 
             order_date date);                   
create table orderdetails(order_id number(5),
             product_name varchar2(100),
             qty number(5),
             price number(7,2));

--2
insert into orders
values(1,100,'03-FEB-18');

insert into orderdetails
values(1,'Coca',100,1.5);

insert into orderdetails
values(1,'Pepsi',200,2.3);

--3
select order_id o, customer_id o, order_date o, product_name od, 
       qty od, price od, qty*price as "total_price"
from orders o JOIN orderdetails od
USING (order_id);

--4
commit;

--5
insert into orders
values(2,101,'03-FEB-18');

insert into orderdetails
values(2,'Angkor',500,1.8);

insert into orderdetails
values(2,'Coca',200,1.5);

--6
select order_id o, customer_id o, order_date o, product_name od, 
       qty od, price od, qty*price as "total_price"
from orders o JOIN orderdetails od
USING (order_id);

--7
rollback;

--8
select order_id o, customer_id o, order_date o, product_name od, 
       qty od, price od, qty*price as "total_price"
from orders o JOIN orderdetails od
USING (order_id);

--9
select order_id o, customer_id o, order_date o, product_name od, 
       qty od, price od, qty*price as "total_price"
from orders o JOIN orderdetails od
USING (order_id)
FOR UPDATE;

--10
drop table orders;
drop table orderdetails;

 --=======================================================
CREATE TABLE product_sr1(
    pid NUMBER (5) PRIMARY KEY  --Column Level Constraint
);

DROP TABLE product_sr1;
CREATE TABLE product_sr1(
    pid NUMBER (5),
    PRIMARY KEY(pid) --Table Column Constraint
);

CREATE TABLE order_detail_sr2(
    oid NUMBER(5),
    pid NUMBER(5),
    qyt NUMBER(5),
    
    PRIMARY KEY(oid, pid)
);
DROP TABLE order_detail_sr2;
SELECT *
FROM order_detail_sr2;

INSERT INTO order_detail_sr2
VALUES(100,1,100);

SELECT * 
FROM order_detail_sr2;

CREATE TABLE emp_sr3(
    emp_id NUMBER(5),
    emp_name VARCHAR(25)NOT NULL, --Column Level
    gender CHAR(1) NOT NULL,
    email VARCHAR(25)  NOT NULL,
    salary NUMBER(7,2), 
    
    CONSTRAINT emp_sr3_emp_id_pk PRIMARY KEY(emp_id), --Talbe Level
    CONSTRAINT emp_sr3_email_uk UNIQUE(email),
    CONSTRAINT emp_sr3_Salary_ck CHECK(salary>=0)
);

CREATE TABLE emp_sr2(
    emp_id NUMBER(5) CONSTRAINT emp_sr2_emp_id_pk PRIMARY KEY,
    emp_name VARCHAR(25) NOT NULL,
    gender CHAR(1) NOT NULL,
    email VARCHAR(25) CONSTRAINT emp_sr2_email_uk UNIQUE NOT NULL,
    salary NUMBER(7,2) CONSTRAINT emp_sr2_Salary_ck CHECK(salary>=0)
);

DROP TABLE emp_sr2;

INSERT INTO emp_sr2
VALUES(2,'CHAMRERN','F','chamrern@gmail.com',3000);

SELECT *
FROM emp_sr2;

CREATE TABLE chamrern(
    id NUMBER(5),
    name VARCHAR(25) UNIQUE
);
INSERT INTO chamrern
VALUES(2,Null);

SELECT*
FROM chamrern;


DROP TABLE order_sr1;
SELECT *
FROM order_sr1;

CREATE TABLE order_sr1(
    oid NUMBER (5) PRIMARY KEY,
    oDate DATE,
    emp_id NUMBER (5)REFERENCES emp_sr2(emp_id) --Column Level
);


CREATE TABLE order_sr2(
    oid NUMBER (5) PRIMARY KEY,
    oDate DATE,
    emp_id NUMBER (5) REFERENCES emp_sr2(emp_id) --Column Level
);
SELECT *FROM order_sr2;
DROP TABLE order_sr2;
CREATE TABLE order_sr1(
    oid NUMBER (5) PRIMARY KEY,
    oDate DATE,
    employee_id NUMBER (5),
    
    FOREIGN KEY(employee_id)REFERENCES emp_sr2(emp_id) --Column Level
    ON DELETE SET NULL--CASCADE --RESTRICT
);

SELECT *
FROM emp_sr2; --Parent(Master)

SELECT *
FROM order_sr1;  --Child(Detail)

INSERT INTO order_sr1
VALUES(100,SYSDATE,3);

DELETE emp_sr2
WHERE emp_id=3; 

SELECT ROWNUM AS NO, last_name, salary
FROM employees
WHERE salary>1000;

CREATE TABLE employee_sr1 AS
SELECT * 
FROM employees;

CREATE TABLE employee_sr2 AS
SELECT employee_id, last_name, salary
FROM employees;

CREATE TABLE employee_sr3(ID, NAME, SALARY)AS
SELECT employee_id, last_name, salary
FROM employees;

SELECT *
FROM employee_sr3;

DELETE employee_sr3;

ROLLBACK;

ALTER TABLE employee_sr3
READ ONLY;

ALTER TABLE employee_sr3
READ WRITE;

DROP TABLE employee_sr3 PURGE; --DELETE NOT IN RECYCLEBIN

SELECT *
FROM recyclebin;

FLASHBACK TABLE employee_sr3
TO BEFORE DROP; --RECOVERY
SELECT * FROM products;
SELECT * FROM types;
DROP TABLE types;
DROP TABLE products;

--1
CREATE TABLE types(
    tid NUMBER(5)PRIMARY KEY,
    type_name VARCHAR(25) UNIQUE NOT NULL
);

CREATE TABLE products(
    pid NUMBER(5)PRIMARY KEY,
    product VARCHAR(25) NOT NULL,
    tid NUMBER(5) REFERENCES types(tid),
    price NUMBER(7,2)
);

--2
INSERT INTO types
VALUES(1,'Soft Drink');

INSERT INTO types
VALUES(2,null);

INSERT INTO products
VALUES(1,'Coca',1,1.5);

INSERT INTO products
VALUES(2,'Pepsi',2,2.3);

INSERT INTO products
VALUES(1,'Coca',1,2.3);

INSERT INTO products
VALUES(2,'Pepsi',1,2.3);

--3
DELETE products
WHERE  pid=2;

--4
DELETE types
WHERE  tid=1;

--5
SELECT pid, product,tid, type_name, price
FROM products JOIN types
USING (tid);

--6
DROP TABLE products;
DROP TABLE types;

--7
SELECT * 
FROM recyclebin;

--8
FLASHBACK TABLE types TO BEFORE DROP;
FLASHBACK TABLE products TO BEFORE DROP;

--9
DROP TABLE products PURGE;
DROP TABLE types PURGE;
