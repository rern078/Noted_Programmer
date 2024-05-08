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

SELECT *
FROM employees;



--1
CREATE view v1 as
SELECT *
FROM employees
WHERE salary>6000;

--2
SELECT *
FROM user_views;

--3
INSERT INTO v1
VALUES(168,'tieng','chamrern','tieng_chamrern',0967797762,
        '05-JAN-22','IT_PROG',99999,0.99,100,90);

--4
DELETE FROM v1
WHERE employee_id=168;

COMMIT;

SELECT * FROM v1;

--5
UPDATE v1
SET salary=1000
WHERE employee_id=102;

--6
SELECT *
FROM v1
WHERE employee_id=102;

--7
ROLLBACK;

--8
CREATE OR REPLACE VIEW v1 as
SELECT *
FROM employees
WHERE salary>6000
WITH CHECK OPTION;

--9
UPDATE v1
SET salary=1000
WHERE employee_id=102;

--10
DROP view v1;

--04/01/2022

CREATE VIEW emp90_sr1 AS
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id=90;

SELECT employee_id, last_name, salary
FROM emp90_sr1;

UPDATE emp90_sr1
SET salary=1000
WHERE employee_id=101;

SELECT *
FROM employees;

CREATE VIEW emp80_sr1 AS
SELECT employee_id, last_name, salary, job_id, department_id
FROM employees
WHERE department_id=80;

GRANT SELECT 
ON emp80_sr1
TO Connection;

CREATE VIEW dept_salary_sr1 AS
SELECT department_name, SUM(salary) AS Total
FROM departments JOIN employees
USING(department_id)
WHERE department_name<>'IT'
GROUP BY department_name
HAVING SUM(salary)>=10000;

SELECT *
FROM dept_salary_sr1;

CREATE VIEW emp_vu3_sr1 AS
SELECT employee_id, first_name || ' ' || last_name AS Name, 
        salary*12 AS Ann_Salary
FROM employees
WHERE commission_pct IS NOT NULL;

CREATE VIEW emp_vu4_sr1 AS
SELECT ROWNUM AS No, employee_id, first_name || ' ' || last_name AS Name, 
        salary*12 AS Ann_Salary
FROM employees
WHERE commission_pct IS NOT NULL;

CREATE VIEW emp_vu6_sr1 AS
SELECT ROWNUM AS No, 'ID: ' || employee_id AS ID, first_name || ' ' || last_name AS Name, 
        salary*12 AS Ann_Salary
FROM employees
WHERE commission_pct IS NOT NULL;

DROP view emp_vu3_sr1;
SELECT *
FROM emp_vu6_sr1;

DESCRIBE emp_vu6_sr1;

CREATE VIEW dept10_sr1 AS 
SELECT * 
FROM employees
WHERE department_id=10;

CREATE VIEW dept20_sr1 AS 
SELECT * 
FROM employees
WHERE department_id=20;

CREATE VIEW dept50_sr1 AS 
SELECT * 
FROM employees
WHERE department_id=50; 

CREATE VIEW dept60_sr1 AS 
SELECT * 
FROM employees
WHERE department_id=60;

CREATE VIEW dept90_sr1 AS 
SELECT * 
FROM employees
WHERE department_id=90;

CREATE OR REPLACE VIEW emp_vu4_sr1 AS
SELECT ROWNUM AS No, employee_id, first_name || ' ' || 
        last_name AS Name, salary*12 AS Ann_Salary, job_id 
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT*
FROM emp_vu4_sr1;

SELECT * 
FROM user_views;

CREATE VIEW emp200_sr1 AS
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id>200;

SELECT *
FROM  emp200_sr1;

UPDATE emp200_sr1
SET employee_id=2
WHERE employee_id=202;

ROLLBACK;

--11-01-2022 ==========================================

SELECT *
FROM  user_tables;

SELECT *
FROM emp_sr2;

CREATE SEQUENCE emp_sr2_id_seq
START WITH 3
INCREMENT BY 2
NOCACHE
NOCYCLE;

INSERT INTO emp_sr2
VALUES(emp_sr2_id_seq);

INSERT INTO emp_sr2
VALUES(emp_sr2_id_seq.NEXTVAL, 'MATEO', 'M', 'mateo2003@gmail.com',
      6000);

SELECT emp_sr2_id_seq.NEXTVAL
FROM dual;

SELECT emp_sr2_id_seq.CURRVAL
FROM dual;

DROP TABLE emp_sr2 CASCADE CONSTRAINTS;

CREATE TABLE  emp_sr2(
    id NUMBER(5) DEFAULT emp_sr2_id_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR(25)
);

SELECT *
FROM emp_sr2;

INSERT INTO emp_sr2(name)
VALUES('MAO');

CREATE TABLE phone_sr2(
    emp_id NUMBER(5) DEFAULT emp_sr2_id_seq.CURRVAL REFERENCES emp_sr2(id),
    phone VARCHAR(25)
    
);

INSERT INTO phone_sr2(phone)
VALUES('080');

SELECT *
FROM phone_sr2;

INSERT INTO emp_sr2(name)
VALUES('TOLA');

INSERT INTO phone_sr2(phone)
VALUES('087');

INSERT INTO phone_sr2(phone)
VALUES('088');

SELECT *
FROM emp_sr2 JOIN phone_sr2
ON emp_sr2.id=phone_sr2.emp_id;

COMMIT;

ROLLBACK;

ALTER SEQUENCE emp_sr2_id_seq
INCREMENT BY 10
MAXVALUE 30;

SELECT *
FROM emp_sr2
WHERE name='TONA';

CREATE INDEX emp_sr2_name_idx
ON emp_sr2(name);

SELECT *
FROM esr2;

CREATE SYNONYM esr2
FOR emp_sr2;

GRANT SELECT 
ON emp_sr2
TO ora1;

--1
CREATE SEQUENCE group_sq
INCREMENT BY 10
START WITH 100
MAXVALUE 1000
NOCYCLE;

--2
CREATE TABLE Groups(
    GroupID NUMBER(10) DEFAULT group_sq.NEXTVAL PRIMARY KEY,
    GroupName VARCHAR(20) UNIQUE
);

--3
CREATE SEQUENCE studentS_sq
NOCYCLE;

--4
CREATE TABLE students(
    StuID NUMBER(10) DEFAULT studentS_sq.NEXTVAL PRIMARY KEY,
    StuName VARCHAR2(20),
    Gender CHAR(1) CHECK (Gender  IN('F','M')),
    GroupID NUMBER(10) DEFAULT group_sq.CURRVAL REFERENCES Groups(GroupID)
);

--5
CREATE INDEX stu_name_index 
ON students(StuName);

--6
INSERT INTO groups(GroupName)
VALUES('MIS01');

INSERT INTO students(StuName, Gender)
VALUES('Sokha','M');

INSERT INTO students(StuName, Gender)
VALUES('Bopha','F');

--7
SELECT *
FROM groups JOIN students
USING(GroupID);

--8
INSERT INTO groups(GroupName)
VALUES('MIS02');

INSERT INTO students(StuName, Gender)
VALUES('Rachana','M');

--9
SELECT *
FROM groups JOIN students
USING(GroupID);

--10
COMMIT;

--11
CREATE SYNONYM gr
FOR groups;

--12
CREATE SYNONYM ST
FOR students;

--13
SELECT *
FROM gr JOIN st
USING(GroupID);


--=====================================================
--18.01.2022

CREATE USER demo_sr2
IDENTIFIED BY demo
DEFAULT TABLESPACE users
QUOTA 10M ON users;

GRANT create session, create table, create view, create sequence,
      create any index, create synonym
TO demo_sr1;
--========================================
ALTER USER demo_sr1
IDENTIFIED BY demo123;

SELECT *
FROM ora1.employees;

UPDATE ora1.employees
SET salary=100
WHERE employee_id=100;

UPDATE ora1.employees
SET manager_id=101
WHERE  employee_id=100;

GRANT select 
ON ora1.employees
TO system;

SELECT *
FROM  user_sys_privs;

SELECT *
FROM user_role;

SELECT *
FROM role_sys_privs;

SELECT *
FROM user_sys_privs;

SELECT *
FROM user_sys_privs;

SELECT*
FROM user_tab_privs_recd;

--========================================
GRANT select 
ON employees
TO demo_sr1;

GRANT update(salary)
ON employees
TO demo_sr1;

SELECT *
FROM role_tab_privs;

SELECT *
FROM role_sys_privs;

SELECT *
FROM role_role_privs;

SELECT *
FROM user_tab_privs_made;

SELECT*
FROM user_col_privs_made;


--USER SYSTEM
--1
CREATE USER sp_test
IDENTIFIED BY test
DEFAULT TABLESPACE users
QUOTA 10M ON users;

--2
GRANT create session, create table, create view, create sequence, create synonym
to sp_test;

--USER ORAL2
--5
GRANT select 
ON departments
TO sp_test;

--6
GRANT update(department_name)
ON departments
TO sp_test;


--USER SP_TEST
--4
ALTER USER sp_test
IDENTIFIED by test123;

--7
select *
from ora1.departments;

--8
CREATE SYNONYM dept_ora2
FOR ora2.departments;

--9
update dept_ora2
set department_name='Cleaner'
where department_id=90;

--10
update dept_ora2
set manager_id=101
where department_id=90;

--11
ROLLBACK;



--MID TERM

--4
GRANT SELECT 
ON employees
TO Nita;

--5
GRANT SELECT, UPDATE(Department_name, Department_ID)
ON ora2.departments 
TO Nita
WITH GRANT option;

--6
GRANT SELECT, UPDATE(Department_name, Department_ID )
ON ora2.departments
TO hr;

--7
SELECT *
FROM role_sys_privs;


--==============================================================================

--15/02/2022

SELECT * 
FROM user_tables;


CREATE TABLE emp_sr1 AS
SELECT employee_id, last_name, salary
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM emp_sr1;

ALTER TABLE emp_sr1
ADD(department_id NUMBER(5));

DESCRIBE  emp_sr1;

ALTER TABLE emp_sr1
MODIFY (department_id NUMBER(10));

ALTER TABLE emp_sr1
MODIFY (department_id DEFAULT 90);

INSERT INTO emp_sr1(employee_id, last_name)
VALUES(1, 'CHAMRERN');

ALTER TABLE emp_sr1
DROP (department_id, salary);

ALTER TABLE emp_sr1
DROP COLUMN department_id;

ALTER TABLE emp_sr1
SET UNUSED (department_id, salary);

ALTER TABLE emp_sr1
SET UNUSED COLUMN department_id;

ALTER TABLE emp_sr1
DROP UNUSED COLUMNS;

SELECT *
FROM emp_sr1;

DROP TABLE emp1_sr1;

CREATE TABLE emp1_sr1(
    id NUMBER(5) CONSTRAINT emp1_sr1_id_pk PRIMARY KEY,
    name VARCHAR2(25) NOT NULL      --Column Level Constraint
);

CREATE TABLE emp1_sr1(
    id NUMBER(5),
    name VARCHAR2(25) NOT NULL,     --Table Level Constraint
    
    CONSTRAINT emp1_sr1_id_pk PRIMARY KEY(id) 
);

CREATE TABLE emp2_sr1(
    id NUMBER(5),
    name VARCHAR2(25)
);

ALTER TABLE emp2_sr1
ADD CONSTRAINT emp2_sr1_id_pk PRIMARY KEY(id);        --Table Level Constraint

ALTER TABLE emp2_sr1        --Column Level Constraint
MODIFY id CONSTRAINT emp2_sr1_id_pk PRIMARY KEY;

SELECT*
FROM emp2_sr1;

ALTER TABLE emp2_sr1
ADD (manager_id NUMBER(5));

ALTER TABLE emp2_sr1
MODIFY manager_id CONSTRAINT emp2_sr1_mid_fk
REFERENCES emp2_sr1(id);

ALTER TABLE emp2_sr1
DROP CONSTRAINT emp2_sr1_mid_fk;

ALTER TABLE emp2_sr1
ADD CONSTRAINT emp2_sr1_mid_fk
FOREIGN KEY(manager_id) 
REFERENCES emp2_sr1(id)

--ON DELETE RESTRICT
--ON DELETE CASCADE
ON DELETE SET NULL
;

SELECT *
FROM emp2_sr1;

INSERT INTO emp2_sr1
VALUES(1, 'CHAMRERN', NULL);

INSERT INTO emp2_sr1
VALUES(2, 'MAO', 1);

INSERT INTO emp2_sr1
VALUES(3, 'HONG', 2);

INSERT INTO emp2_sr1
VALUES(4, 'HENG', 1);

DELETE emp2_sr1
WHERE id=1;

SELECT *FROM customers;

--1-Create table customers(cid, cName, address)
CREATE TABLE customers(
    cid NUMBER(5),
    cName VARCHAR2(25),
    address VARCHAR(25)
);

--2Add column gender and column dob to customers
ALTER TABLE customers
ADD(Gender CHAR(10));

ALTER TABLE customers
ADD(dob DATE);

--3Add default value on column gender=Male
ALTER TABLE customers
MODIFY (Gender DEFAULT 'Male');

--4-Add primary key on customers(cid)
ALTER TABLE customers
ADD CONSTRAINT customer_cid_pk PRIMARY KEY(cid); 

--5Create table orders(oid, odate, cid)
CREATE TABLE orders(
    oid NUMBER(5),
    odate DATE,
    cid NUMBER(5)
);

--6-Add primary key on orders(oid)
ALTER TABLE orders
ADD CONSTRAINT orders_oid_pk PRIMARY KEY(oid); 

--7Add foreign key on orders(cid) reference to customers(cid) and use ON DELETE CASCADE option
ALTER TABLE orders
ADD CONSTRAINT orders_cid_fk
FOREIGN KEY(cid) 
REFERENCES customers(cid)
ON DELETE CASCADE;

--8Insert any one row to customers table
INSERT INTO customers
VALUES(1,'CHAMRERN','KPC','MALE',SYSDATE);

--9-Insert any one row to orders table
INSERT INTO orders
VALUES(1,SYSDATE,01);

--10-Drop column dob from customers
ALTER TABLE customers
DROP COLUMN dob;

--11-Drop column gender and column address (Using SET UNUSED and DROP UNUSED COLUMNS)
ALTER TABLE customers
SET UNUSED (Gender, address);

ALTER TABLE customers
DROP UNUSED COLUMNS;

--22/02/2022
--============================================================================

CREATE TABLE emp3_sr1(
    id NUMBER(5),
    name VARCHAR(25)
);

ALTER TABLE emp3_sr1
DROP CONSTRAINT emp3_sr1_id_pk; --DDL

ALTER TABLE emp3_sr1
ADD CONSTRAINT emp3_sr1_id_pk PRIMARY KEY(id);            --Table Level Con

ALTER TABLE emp3_sr1            --Column Level Con
MODIFY id CONSTRAINT emp3_sr1_id_pk PRIMARY KEY
INITIALLY IMMEDIATE       --can not modify(NOT deferrable)
DEFERRABLE 
--INITIALLY DEFERRED          --can modify
;

SET CONSTRAINT emp3_sr1_id_pk IMMEDIATE;

SET CONSTRAINT emp3_sr1_id_pk DEFERRED;

INSERT INTO emp3_sr1
VALUES(1, 'DARA');
--END

--START
INSERT INTO emp3_sr1
VALUES(1, 'MAO');

INSERT INTO emp3_sr1
VALUES(2, 'TOLA');

SELECT * 
FROM emp3_sr1;
--END

COMMIT;

SELECT *
FROM user_constraints
WHERE table_name='EMP3_SR1';

ALTER TABLE emp3_sr1
DROP CONSTRAINT EMP3_SR1_ID_PK;

ALTER TABLE emp3_sr1
DROP PRIMARY KEY;

ALTER TABLE emp3_sr1
ADD CONSTRAINT emp3_sr1_id_pk PRIMARY KEY(id);

SELECT *
FROM emp3_sr1;

ALTER TABLE emp3_sr1
ADD (manager_id NUMBER(5));

ALTER TABLE emp3_sr1
ADD CONSTRAINT emp3_sr1_mid_fk
FOREIGN KEY (manager_id)
REFERENCES emp3_sr1(id)
NOVALIDATE;

INSERT INTO emp3_sr1
VALUES(3, 'CHAMRERN',1);

INSERT INTO emp3_sr1
VALUES(4, 'HEANG',5);

ALTER TABLE emp3_sr1
DROP PRIMARY KEY CASCADE;

ALTER TABLE emp3_sr1
DROP COLUMN id
CASCADE CONSTRAINT;

CREATE TABLE emp4_sr1(
    id NUMBER(25),
    name VARCHAR2(25),
    
    CONSTRAINT emp4_sr1_id_name_uk UNIQUE(id,name)  --MultiColumn Constraint
);

INSERT INTO emp4_sr1
VALUES(2,'MAO');

SELECT*
FROM emp4_sr1;

ALTER TABLE emp4_sr1
DROP COLUMN name
CASCADE CONSTRAINT;

DROP TABLE emp5_sr1;

CREATE TABLE emp5_sr1(
    id NUMBER(25) CONSTRAINT emp5_sr1_id_pk PRIMARY KEY 
    USING INDEX(CREATE INDEX emp5_sr1_id_idx ON emp5_sr1(id)
    ),
    name VARCHAR2(25)  
);

CREATE INDEX emp5_sr1_id_idx
ON emp5_sr1(id);

SELECT *
FROM user_constraints
WHERE table_name='EMP5_SR1';

SELECT *
FROM user_indexes
WHERE table_name='EMP5_SR1';

DROP INDEX EMP5_SR1_ID_PK;

SELECT *
FROM emp5_sr1;

CREATE INDEX emp5_sr1_name_idx
ON emp5_sr1(LOWER(name));

SELECT *FROM emp5_sr1;

ALTER TABLE emp5_sr1
RENAME COLUMN name TO staff_name;

--1-Create table staff_new(sid Primary Key [Naming Index: staff_new_id_idx], sName, salary)

--1
CREATE TABLE staff_new(
    sid NUMBER(5) CONSTRAINT staff_new_id_idx PRIMARY KEY,
    sName VARCHAR2(25),
    salary NUMBER(7,2)
);
--2-Create index staff_new_name on sName column

CREATE INDEX staff_new_name 
ON staff_new(sName);

--3  3-Rename column sName to staff_name
ALTER TABLE staff_new
RENAME COLUMN sName TO staff_name;

--4Delete index staff_new_name 
DROP INDEX staff_new_name;

--5Delete table staff_new
DROP TABLE staff_new;

--6Recover table staff_new
FLASHBACK TABLE staff_new TO BEFORE DROP;

--7Delete primary key from table staff_new
ALTER TABLE staff_new
DROP PRIMARY KEY;

--8Add Primary key with INITIALLY DEFERRED to staff_new(sid)
ALTER TABLE staff_new
MODIFY sid NUMBER(5) PRIMARY KEY
INITIALLY DEFERRED;

--9Insert any one row with sid=5 to staff_new
INSERT INTO staff_new
VALUES(5, 'KAKA', 5000);

--10Insert another one row with sid=5 to staff_new
INSET INTO staff_new
VALUES(5, 'TOLA', 3000);


SELECT * FROM staff_new;
--11-Commit
COMMIT;

--12-Add column manager_id to staff_new
ALTER TABLE staff_new
DD (manager_id NUMBER(5));

--13-Add foreign key on staff_new(manager_id) reference to staff_new(sid)
ALTER TABLE staff_new
MODIFY manager_id REFERENCES staff_new(sid);

--14-Delete primary key from table staff_new
ALTER TABLE staff_new
DROP PRIMARY KEY CASCADE;

--01/03/2022
--==============================================================================
SELECT *
FROM user_tables;

DROP TABLE emp_sr1;

SELECT *
FROM recyclebin;

SELECT *
FROM "" ;

FLASHBACK TABLE emp_sr1 TO BEFORE DROP;

SELECT *
FROM emp_sr1;

SELECT *
FROM recyclebin;

DELETE emp_sr1
WHERE employee_id=100;

COMMIT;

ROLLBACK;

SELECT *
FROM v$database;
--9705288

SELECT * 
FROM emp_sr1;

DELETE emp_sr1;

COMMIT;

SELECT *
FROM emp_sr1;

FLASHBACK TABLE emp_sr1 TO SCN 9705288;

ALTER TABLE emp_sr1
ENABLE ROW MOVEMENT;

CREATE GLOBAL TEMPORARY TABLE temp1_sr(
    id NUMBER(5)
)
ON COMMIT DELETE ROWS
;

CREATE GLOBAL TEMPORARY TABLE temp2_sr(
    id NUMBER(5)
)
ON COMMIT PRESERVE ROWS
;

SELECT * FROM temp1_sr;

INSERT INTO temp1_sr
VALUES(1);

COMMIT;

CREATE SEQUENCE product_sr1_id_seqs;

CREATE TABLE product_sr1(
    pid NUMBER(5) DEFAULT product_sr1_id_seq.NEXTVAL PRIMARY KEY,
    PName VARCHAR2(25),
    qtyInStock NUMBER(5),
    price NUMBER(7,2)
);

SELECT*
FROM product_sr1;

INSERT INTO product_sr1(pName, qtyInStock, price)
VALUES('FANTA', 1200,25);


CREATE GLOBAL TEMPORARY TABLE cart_sr1(
    pid NUMBER(5),
    qty NUMBER(5)
) ON COMMIT DELETE ROWS;

SELECT *
FROM cart_sr1;

CREATE SEQUENCE order_sr1_id_seq
START WITH 10000;

CREATE TABLE order_sr1(
    oid NUMBER(5) DEFAULT order_sr1_id_seq.NEXTVAL PRIMARY KEY,
    oDate DATE DEFAULT sysdate,
    customer VARCHAR2(25)
);

CREATE TABLE order_detail_sr1(
    oid NUMBER(5)DEFAULT order_sr1_id_seq.CURRVAL
    REFERENCES order_sr1(oid),
    pid NUMBER(5) REFERENCES product_sr1(pid),
    qty NUMBER(5)
    
);
SELECT *FROM product_sr1;

SELECT *FROM cart_sr1;

SELECT *FROM order_sr1;

SELECT * FROM order_detail_sr1;

--TRANSACTION

INSERT INTO cart_sr1
VALUES(2,30);

SELECT pid, pName, qty, price, qty*price AS TOTAL
FROM cart_sr1 JOIN product_sr1
USING(pid);

UPDATE cart_sr1
SET qty=5
WHERE pid=1;

SELECT pid, pName, qty, price, qty*price AS TOTAL
FROM cart_sr1 JOIN product_sr1
USING(pid);
UNION ALL
SELECT null, null, null, null, SUM(qty*price) AS TOTAL
FROM cart_sr1 JOIN product_sr1
USING(pid);

--PAY 

UPDATE product_sr1
SET qtyInStock=qtyInStock-( 
        SELECT qty FROM cart_sr1
        WHERE pid=product_sr1.pid
WHERE pid IN(SELECT pid FROM cart_sr1);
);

INSERT INTO order_sr1(customer)
VALUES(USER);

INSERT INTO order_detail_sr1(pid, qty)
SELECT pid, qty
FROM cart_sr1;

COMMIT;

--FINAL

SELECT *FROM product_sr1;

SELECT *FROM cart_sr1;

SELECT * FROM order_detail_sr1;

SELECT * FROM order_sr1;

--1-Create table product(pid Primary key, pName, qty, Price)
CREATE TABLE product(
    pid NUMBER(5) PRIMARY KEY,
    PName VARCHAR2(25),
    qty NUMBER(5),
    price NUMBER(7,2)
);

--2-Insert any 3 Rows to product
INSERT INTO product(pid, pName, qty, price)
VALUES(1,'FANTA', 1000,5);

INSERT INTO product(pid, pName, qty, price)
VALUES(2,'COCA', 1100,10);

INSERT INTO product(pid, pName, qty, price)
VALUES(3,'SODA', 1200,15);

--3-Create sequence orders_seq start from 1000
CREATE SEQUENCE order_seq
START WITH 1000;

--4-Create table orders(oid default orders_seq.nextval primary key, oDate default sysdate, customer)
CREATE TABLE orders(
    oid NUMBER(5) DEFAULT order_seq.NEXTVAL PRIMARY KEY,
    oDate DATE DEFAULT sysdate,
    customer VARCHAR2(25)
);

--5-Create table order_detail(oid default orders_seq.currval references orders(oid), pid  references product(pid), qty)
CREATE TABLE order_detail(
    oid NUMBER(5)DEFAULT order_seq.CURRVAL REFERENCES orders(oid),
    pid NUMBER(5) REFERENCES product(pid),
    qty NUMBER(5)   
);

--6-Create temporary table cart(pid, qty) when commit will delete rows
CREATE GLOBAL TEMPORARY TABLE cart(
    pid NUMBER(5),
    qty NUMBER(5)
) ON COMMIT DELETE ROWS;

--7-Select two products to cart
INSERT INTO cart
VALUES(1,10);

INSERT INTO cart
VALUES(2,15);

--8-Insert one row to orders (customer=user)
INSERT INTO orders(customer)
VALUES(user);

--9Copy data from cart to order_detail
INSERT INTO order_detail(pid,qty)
SELECT pid, qty
FROM cart;

--10-Update qty in stock(product)
UPDATE product
SET qty=qty- (SELECT qty FROM cart
              WHERE pid=product.pid)
WHERE pid IN(SELECT pid FROM cart);

--11-Commit
COMMIT;

--12Select all product to confirm
SELECT * FROM product;

SELECT * FROM orders;

SELECT * FROM order_detail;

SELECT * FROM cart;

SELECT * 
FROM User_Objects;

SELECT *
FROM User_Tables;

SELECT *
FROM User_Views;

SELECT *
FROM User_Sequences;

SELECT *
FROM all_Sequences;

SELECT *
FROM User_indexes;

SELECT *
FROM User_Synonyms;

SELECT *
FROM all_Synonyms;

SELECT * 
FROM User_constraints;

SELECT DISTINCT constraint_type
FROM user_constraints;

SELECT *
FROM User_Tab_Columns
WHERE  table_name='EMPLOYEESHZ';

SELECT *
FROM dictionary
WHERE comments LIKE '%tablespace%';

SELECT * 
FROM USER_TABLESPACES;

SELECT * FROM User_Objects;

SELECT * FROM User_Tables;

SELECT * FROM User_Views;

SELECT *
FROM User_Sequences;

SELECT *
FROM all_Sequences;

SELECT *
FROM User_indexes;

SELECT *
FROM User_Synonyms;

SELECT *
FROM all_Synonyms;

SELECT * 
FROM User_constraints;

SELECT DISTINCT constraint_type
FROM user_constraints;

SELECT *
FROM User_Tab_Columns
WHERE  table_name='EMPLOYEES';

SELECT * FROM User_Ind_Columns;

SELECT *FROM User_Cons_Columns;

SELECT* FROM user_tables;

SELECT*FROM EMP3_SR1;

COMMENT ON TABLE emp3_sr1
IS 'Test Comments on Table for sr1';

COMMENT ON COLUMN emp3_sr1.NAME
IS 'Test Comments on column for sr1';

SELECT *
FROM  user_tab_comments
WHERE table_name='EMP3_SR1';

SELECT *
FROM  user_col_comments
WHERE table_name='EMP3_SR1';

CREATE OR REPLACE DIRECTORY  
AS 'D:\emp_dir';

CREATE TABLE library_items_ext_sr1(
    category_id NUMBER(12)
    book_id NUMBER(8),
    book_price NUMBER(8,2),
    quanlity NUMBER(8)
)ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY emp_dir_sr1
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ','
    )   
    LOCATION ('library_items.txt')
)REJECT LIMIT 2;

SELECT *
FROM library_items_ext_sr1;


--1
CREATE TABLE staff_demo(
    sid NUMBER(5) PRIMARY KEY,
    sName VARCHAR2(25),
    salary NUMBER(7,2)
);

--2
DROP TABLE staff_demo;

--3
FLASHBACK TABLE staff_demo TO BEFORE DROP;

--4
INSERT INTO staff_demo
VALUES(1, 'CHAMRERN', 1200);

--5
COMMIT;

--6
DELETE staff_demo;

--7
ROLLBACK;

--8
INSERT INTO staff_demo
VALUES(2, 'MENG HEANG', 1500);

--9
COMMIT;

--10
SELECT current_scn
FROM v$database;
--11890668

--11
DELETE staff_demo;

--12
COMMIT;

--13
ROLLBACK;

--14
ALTER TABLE staff_demo
ENABLE ROW MOVEMENT;
FLASHBACK TABLE staff_demo TO SCN 11890668;

--15
DROP TABLE staff_demo PURGE;

--16
CREATE DIRECTORY staff_dir 
AS 'D:\staff_dir';

CREATE TABLE library_items_ext(
    category_id NUMBER(12)
    book_id NUMBER(8),
    book_price NUMBER(8,2),
    quantity NUMBER(8)
)ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY staff_dir
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ','
    )   
    LOCATION ('library_items.txt')
)REJECT LIMIT UNLIMITED;

SELECT * FROM library_items_ext;

--16/03/2022
--==============================================================================

CREATE TABLE countries_sr1 AS 
SELECT * 
FROM countries
WHERE country_id IN('AC', 'DE', 'UK', 'US');

SELECT *
FROM countries_sr1;

SELECT *
FROM regions;

SELECT *
FROM countries_sr1
WHERE region_id=(SELECT region_id
                FROM regions
                WHERE region_name='Europe');
                
SELECT country_id, country_name, region_id
FROM countries_sr1 JOIN regions
USING (region_id);

CREATE VIEW countries_sr1_Europe AS
SELECT *
FROM countries_sr1
WHERE region_id=(SELECT region_id
                FROM regions
                WHERE region_name='Europe'); --SIMPLE VIEW

SELECT*
FROM countries_sr1_Europe;

CREATE OR REPLACE VIEW countries_sr1_Europe AS
SELECT*
FROM (SELECT *
    FROM countries_sr1
    WHERE region_id=(SELECT region_id
                    FROM regions
                    WHERE region_name='Europe')   
WITH CHECK OPTION; --SIMPLE VIEW

INSERT INTO countries_sr1_Europe
VALUES('KH', 'CAMBODIA', 1);

SELECT * FROM countries_sr1_Europe;

SELECT * FROM countries_sr1;

CREATE TABLE emp6_sr1(
    id NUMBER (5) PRIMARY KEY,
    name VARCHAR2(25),
    salary NUMBER(7,2) DEFAULT  100
);

INSERT INTO emp6_sr1
VALUES(2,'TOLA', 100);

INSERT INTO emp6_sr1
VALUES(3,'MAKARA', DEFAULT); --Explicat Default View

SELECT *FROM emp6_sr1;

UPDATE emp6_sr1
SET salary=DEFAULT
WHERE id=1;

INSERT INTO emp6_sr1(id, name)
    SELECT employee_id, last_name
    FROM employees
    WHERE salary>=10000;

INSERT ALL
    INTO emp6_sr1(id, name)         VALUES(employee_id, last_name)
    INTO emp7_sr1(id, name, salary) VALUES(employee_id, last_name, salary)
    INTO emp8_sr1(id, name)         VALUES(employee_id, last_name)
SELECT employee_id, last_name, salary
FROM employees
WHERE salary>=10000; --error

TRUNCATE TABLE sal_history;

TRUNCATE TABLE mgr_history;

SELECT * FROM sal_history;

SELECT * FROM mgr_history;

INSERT ALL
    INTO sal_history (employee_id, hire_date, salary) VALUES(i, h, s)
    INTO mgr_history (employee_id, manager_id, salary,hire_date) VALUES(i,m,s,h)
SELECT employee_id AS i, manager_id AS m, hire_date AS h, salary AS s
FROM employees
WHERE employee_id>200; --error

CREATE TABLE emp_history(
    id NUMBER(5),
    hire_date DATE,
    salary NUMBER(7,2)
);

CREATE TABLE emp_sales(
    id NUMBER(5),
    com NUMBER(7,2),
    salary NUMBER(7,2)
);


TRUNCATE TABLE emp_history;

TRUNCATE TABLE emp_sales;

SELECT * 
FROM emp_history;

SELECT * 
FROM emp_sales;

INSERT ALL
WHEN hire_date<'01-JAN-98' THEN     --DD-MON-RR
    INTO emp_history VALUES(employee_id, hire_date, salary)
WHEN commission_pct IS NOT NULL THEN
    INTO emp_sales VALUES(employee_id, commission_pct, salary)
SELECT employee_id, hire_date, salary, commission_pct
FROM employees;

INSERT FIRST
WHEN hire_date<'01-JAN-98' THEN     --DD-MON-RR
    INTO emp_history VALUES(employee_id, hire_date, salary)
WHEN commission_pct IS NOT NULL THEN
    INTO emp_sales VALUES(employee_id, commission_pct, salary)
SELECT employee_id, hire_date, salary, commission_pct
FROM employees;

INSERT ALL
    INTO emp_sales_info VALUES(id, week_id, qty_mon, 1)
    INTO emp_sales_info VALUES(id, week_id, qty_tue, 2)
    INTO emp_sales_info VALUES(id, week_id, qty_wed, 3)
    INTO emp_sales_info VALUES(id, week_id, qty_thu, 4)
    INTO emp_sales_info VALUES(id, week_id, qty_fri, 5)
SELECT *
FROM sales_week_data;

SELECT *
FROM emp_sales_info
ORDER BY 1, 2, 3;

SELECT * FROM emp_sales_info;

DELETE emp_sales_info
WHERE qty_sales_info IS NULL;

TRUNCATE TABLE emp_sales_info;


--1
DROP TABLE SAL_HISTORY;
CREATE TABLE SAL_HISTORY(
    EMPLOYEE_ID	NUMBER(6),
    HIRE_DATE	DATE,
    SALARY	NUMBER(8,2)
);

--2
DESC SAL_HISTORY;

--3
DROP TABLE MGR_HISTORY;
CREATE TABLE MGR_HISTORY(
    EMPLOYEE_ID	NUMBER(6),
    MANAGER_ID	NUMBER(6),
    SALARY	NUMBER(8,2)
);

--4
DESC MGR_HISTORY;

--5
DROP TABLE SPECIAL_SAL;
CREATE TABLE SPECIAL_SAL(
    EMPLOYEE_ID	NUMBER(6),
    SALARY	NUMBER(8,2)
);

--6
DESC SPECIAL_SAL;

--7
    --a
    INSERT ALL
    WHEN salary >20000 THEN
        INTO SPECIAL_SAL VALUES(employee_id,salary)
    WHEN salary<20000 THEN
        INTO SAL_HISTORY VALUES(employee_id,HIRE_DATE,salary)
        INTO MGR_HISTORY VALUES(employee_id,MANAGER_ID,salary)
    SELECT EMPLOYEE_ID,HIRE_DATE, salary,MANAGER_ID
    FROM employees
    WHERE EMPLOYEE_ID<125;
    
    --b
    SELECT *
    FROM SPECIAL_SAL;
    
    --c
    SELECT *
    FROM SAL_HISTORY;
    
    --d
    SELECT *
    FROM MGR_HISTORY;

--8
    --a
    DROP TABLE SALES_WEEK_DATA;
    CREATE TABLE SALES_WEEK_DATA(
        ID NUMBER(6),
        WEEK_ID	NUMBER(2),
        QTY_MON	NUMBER(8,2),
        QTY_TUE	NUMBER(8,2),
        QTY_WED	NUMBER(8,2),
        QTY_THUR NUMBER(8,2),
        QTY_FRI	NUMBER(8,2)
    );
    
    --b
    INSERT INTO SALES_WEEK_DATA 
    VALUES(200, 6, 2050,2200,1700,1200,3000);
    
    COMMIT;
    
    --c
    DESC SALES_WEEK_DATA;
    
    --d
    SELECT *
    FROM SALES_WEEK_DATA;
    
    --e
    DROP TABLE EMP_SALES_INFO;
    CREATE TABLE EMP_SALES_INFO(
        ID NUMBER(6),
        WEEK NUMBER(2),
        QTY_SALES NUMBER(8,2)
    );
    
    --f
    DESC EMP_SALES_INFO;
    
    --g
    SELECT id, week_id, qty_mon, qty_tue, qty_wed, qty_thur, qty_fri
    FROM SALES_WEEK_DATA;

    INSERT ALL
    WHEN m IS NOT NULL THEN
        INTO EMP_SALES_INFO VALUES(i,w,m)
    WHEN t IS NOT NULL THEN
        INTO EMP_SALES_INFO VALUES(i,w,t)
    WHEN we IS NOT NULL THEN
        INTO EMP_SALES_INFO VALUES(i,w,we)
    WHEN th IS NOT NULL THEN
        INTO EMP_SALES_INFO VALUES(i,w,th)
    WHEN f IS NOT NULL THEN
        INTO EMP_SALES_INFO VALUES(i,w,f)
        
    SELECT id AS i, week_id AS w, qty_mon AS m, qty_tue AS t, qty_wed AS we, 
        qty_thur AS th, qty_fri AS f
    FROM SALES_WEEK_DATA;
    
    --h
    SELECT *
    FROM EMP_SALES_INFO;

--==============================================================================
--23/03/2022

CREATE TABLE emp10_sr1 AS
SELECT employee_id, last_name, salary
FROM employees
WHERE salary>=10000;

SELECT *
FROM emp10_sr1;

INSERT INTO emp10_sr1
VALUES(1, 'DARA', 1000);

UPDATE emp10_sr1
SET last_name='NITA', salary=2000
WHERE employee_id=200;

UPDATE emp10_sr1
SET last_name='NITA', salary=2000
WHERE employee_id=100;

MERGE INTO emp10_sr1 e10
USING(SELECT employee_id, last_name, salary FROM employees ) e1
ON(e10.employee_id=e1.employee_id)
WHEN MATCHED THEN
    UPDATE 
    SET e10.last_name=e1.last_name, e10.salary=e1.salary
WHEN NOT MATCHED THEN
    INSERT (e10.employee_id, e10.last_name, e10.salary)
    VALUES(e1.employee_id, e1.last_name, e1.salary);

SELECT *
FROM emp10_sr1;

SELECT employee_id, last_name, salary
FROM employees;

MERGE INTO emp10_sr1 e10
USING(  SELECT 1 AS id, 'Bopa' AS name, 10000 AS salary
        FROM dual) e1
ON(e10.employee_id=e1.id)
WHEN MATCHED THEN
    UPDATE 
    SET e10.last_name=e1.name, e10.salary=e1.salary
WHEN NOT MATCHED THEN
    INSERT 
    VALUES(e1.id, e1.name, e1.salary);

SELECT 1 AS id, 'Bopa' AS name, 10000 AS salary
FROM dual;


MERGE INTO emp10_sr1 e10
USING(  SELECT 1 AS id, 'Bopa' AS name, 10000 AS salary, 'Delete' opt
        FROM dual) e1
ON(e10.employee_id=e1.id)
WHEN MATCHED THEN
    UPDATE 
    SET e10.last_name=e1.name, e10.salary=e1.salary
    DELETE WHERE(e1.opt='Delete')
WHEN NOT MATCHED THEN
    INSERT 
    VALUES(e1.id, e1.name, e1.salary);
    
    
MERGE INTO emp10_sr1 e10
USING(  SELECT 1 AS id, 'Tola' AS name, 15000 AS salary, '' opt
        FROM dual) e1
ON(e10.employee_id=e1.id)
WHEN MATCHED THEN
    UPDATE 
    SET e10.last_name=e1.name, e10.salary=e1.salary
    DELETE WHERE(e1.opt='Delete')
WHEN NOT MATCHED THEN
    INSERT 
    VALUES(e1.id, e1.name, e1.salary);

SELECT *
FROM emp10_sr1;

SELECT *FROM user_tables;


UPDATE emp10_sr1
SET salary=7000
WHERE employee_id=174;

COMMIT;

SELECT salary, VERSIONS_STARTTIME, VERSIONS_ENDTIME  --Date
FROM emp10_sr1
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE              --Old Values
WHERE employee_id=174;

--29/03/2022
--==============================================================================
--LESSON 5  TIME ZONE SESSION PARAMATER

SELECT sessiontimezone
FROM dual;

ALTER  SESSION SET TIME_ZONE='-5:00';

ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-RR HH:MI:SS AM';

SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP
FROM DUAL;

SELECT SESSIONTIMEZONE, DBTIMEZONE
FROM DUAL;

CREATE TABLE web_order_sr1(
    order_date TIMESTAMP WITH ZONE,
    delivery_time TIMESTAMP WITH LOCAL TIME ZONE
);

SELECT *
FROM web_order_sr1;

SELECT current_timestamp, current_timestamp+2
FROM dual;

INSERT INTO web_order_sr1
VALUES(current_timestamp, current_timestamp+2); 

SELECT SESSIONTIMEZONE, DBTIMEZONE
FROM DUAL;

CREATE TABLE products_sr1(
    pid NUMBER (5) PRIMARY KEY,
    pName VARCHAR2(25),
    create_date DATE,
    exp_ym INTERVAL YEAR TO MONTH, --YEAR-MONTH
    exp_ds INTERVAL DAY TO SECOND   --DAY HOUR:MINUTE:SECOND
);

SELECT *
FROM products_sr1;

INSERT INTO products_sr1
VALUES(1,'COCA', SYSDATE, '1-2','2 3:30:00');

SELECT pName, create_date, exp_ym, create_date+exp_ds
FROM products_sr1;

SELECT last_name, hire_date, EXTRACT(YEAR FROM hire_date)
FROM employees;

SELECT sessiontimezone, TZ_OFFSET('Asia/Bangkok'), TZ_OFFSET('Africa/Abidjan')
FROM dual;

SELECT *
FROM v$timezone_names;

SELECT '2022-29-03 11' , TO_TIMESTAMP('2022-29-03 11','YYYY-DD-MM HH')
FROM dual;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2*12+2)+2+2/24+2/60/24+2/60/60/24, SYSDATE + TO_YMINTERVAL('2-2'), SYSDATE + TO_DSINTERVAL('2 2:2:2')
FROM DUAL;


--1
SELECT SESSIONTIMEZONE, DBTIMEZONE
FROM DUAL;

--2
ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-RR HH:MI:SS AM';

--3
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP
FROM DUAL;

--4
ALTER  SESSION SET TIME_ZONE='-11:00';

--5
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP
FROM DUAL;

--6
CREATE TABLE w_order(
    oid NUMBER(5),
    oDate timestamp with time zone,
    shipping timestamp with local time zone,
    cName VARCHAR(25)
);

--7
INSERT INTO w_order
VALUES('1000', current_timestamp, current_timestamp+5, 'user'); 

--8
--Re-connect your user

--9
SELECT * 
FROM w_order;

--10
CREATE TABLE products(
    pid NUMBER (5),
    pName VARCHAR2(25),
    qty NUMBER(5),
    price NUMBER(7,2),
    create_date DATE,
    exp_ym INTERVAL YEAR TO MONTH, 
    exp_ds INTERVAL DAY TO SECOND   
);

--11
INSERT INTO products
VALUES(1,'COCA',100,12000, SYSDATE, '1-2','2 3:30:00');

INSERT INTO products
VALUES(2,'SODA',200,15000, SYSDATE, '1-2','2 3:30:00');

--12
SELECT pName, create_date, exp_ym, exp_ds, create_date+exp_ym+exp_ds
FROM products;


--05.04.2022
--=================================================================

--NonPairwise comparison subquary
SELECT employee_id, last_name, manager_id, department_id
FROM employees
WHERE manager_id=(SELECT manager_id
                    FROM employees
                    WHERE last_name='Rajs')
AND department_id=(SELECT department_id
                    FROM employees
                    WHERE last_name='Rajs')
AND last_name<>'Rajs';

--Pairwise comparison subquary
SELECT employee_id, last_name, manager_id, department_id
FROM employees
WHERE (manager_id, department_id)=(SELECT manager_id, department_id
                    FROM employees
                    WHERE last_name='Rajs')         --Multiple Subquery

AND last_name<>'Rajs';

SELECT employee_id, last_name ,department_id,
    CASE WHEN department_id= (  SELECT department_id
                                FROM departments
                                WHERE location_id=1800)THEN
                                
        'Canada'
    ELSE 
        'USA'
    END AS location
FROM employees;

SELECT employee_id, last_name, department_id
FROM employees JOIN departments
USING(department_id)
ORDER BY department_name;

--Correlated Subquery AND Scalar Subquery
SELECT employee_id, last_name, department_id
FROM employees e
ORDER BY (  SELECT department_name
            FROM  departments
            WHERE department_id=e.department_id);


SELECT employee_id, last_name, department_id,
                ( SELECT department_name
                  FROM  departments
                  WHERE department_id=e.department_id ) AS department_name
FROM employees e
ORDER BY (SELECT department_name FROM departments WHERE department_id=e.department_id);


SELECT employee_id, last_name, salary, department_id
FROM employees e1
WHERE salary>( SELECT AVG(salary)
               FROM employees e2
               WHERE e2.department_id=e1.department_id
             );

SELECT *
FROM job_history;

SELECT employee_id, last_name
FROM employees e
WHERE (SELECT COUNT(*) FROM job_history j WHERE j.employee_id=e.employee_id)>=2;

SELECT last_name, e.department_id, department_name
FROM employees e JOIN departments d
ON e.department_id=d.department_id;

SELECT last_name, e.department_id, (SELECT department_name
                                    FROM departments d
                                    WHERE e.department_id=d.department_id) AS department_name
FROM employees e;


--06/04/2022

--==============================================================
SELECT employee_id, last_name, salary
FROM employees
WHERE EXISTS (SELECT 1
             FROM dual
             WHERE 1=2);

SELECT 1 
FROM DUAL
WHERE 1=2;

SELECT employee_id, last_name, manager_id
FROM employees
WHERE employee_id IN (SELECT manager_id FROM employees);

SELECT employee_id, last_name, manager_id
FROM employees e1
WHERE EXISTS(SELECT 1 
            FROM employees e2
            WHERE e2.manager_id=e1.employee_id);

SELECT employee_id, last_name, manager_id
FROM employees
WHERE  employee_id IN (100,101,102,500,NULL);

SELECT employee_id, last_name, manager_id
FROM employees
WHERE  employee_id NOT IN (100,101,102,500,NULL);

SELECT employee_id, last_name, manager_id
FROM employees
WHERE  employee_id IN (SELECT manager_id FROM employees);

SELECT employee_id, last_name, manager_id
FROM employees
WHERE  employee_id NOT IN ( SELECT manager_id 
                            FROM employees
                            WHERE  manager_id IS NOT NULL);

CREATE TABLE  emp_sr1_sr1 AS
SELECT employee_id ,last_name, job_id
FROM employees;


SELECT *
FROM emp_sr1_sr1;

DELETE  emp_sr1_sr1
WHERE employee_id=104;

UPDATE emp_sr1_sr1
SET job_id='HR'
WHERE employee_id=103;

INSERT INTO emp_sr1_sr1
VALUES(1, 'MAKARA', 'IP_PROG', 12000);

ALTER TABLE emp_sr1_sr1
ADD (salary NUMBER(7,2));

COMMIT;

UPDATE emp_sr1_sr1
SET salary=(SELECT salary
            FROM employees
            WHERE employee_id= emp_sr1_sr1.employee_id);


SELECT *
FROM emp_sr1_sr1;

ROLLBACK;

UPDATE emp_sr1_sr1
SET salary=(SELECT salary
            FROM employees
            WHERE employee_id=emp_sr1_sr1)
WHERE employee_id= emp_sr1_sr1.employee_id);


SELECT employee_id, last_name, manager_id
FROM employees e1
WHERE NOT EXISTS(SELECT 1 FROM employees e2 WHERE e2.manager_id=e1.employee_id);


SELECT employee_id, last_name, manager_id
FROM employees e1
WHERE NOT EXISTS(SELECT 1 FROM employees e2 WHERE e2.manager_id=e1.employee_id);

WITH manager AS (
                    SELECT employee_id, last_name, manager_id
                    FROM employees e1
                    WHERE EXISTS(SELECT  1 FROM employees e2 WHERE e2.manager_id=e1.employee_id)
                ),
    worker AS  (
                    SELECT employee_id, last_name, manager_id
                    FROM employees e1
                    WHERE NOT EXISTS(SELECT  1 FROM employees e2 WHERE e2.manager_id=e1.employee_id)
               )

SELECT * FROM worker;

SELECT *
FROM flights;

UPDATE flights
SET flight_time=5.8
WHERE source='Los Angeles';

COMMIT;

SELECT source, destin, flight_time
FROM flights;

WITH Reachable_From AS(
    SELECT source, destin, flight_time
    FROM flights
) 

SELECT * FROM Reachable_From;


WITH Reachable_From AS(source, destin, flight_time) AS (
    SELECT source, destin, flight_time
    FROM flights
    UNION ALL
    SELECT f.source, r.destin, f.flight_time+r.flight_time
    FROM flights f JOIN Reachable_From r
    ON f.destin=souce
) 

SELECT * FROM Reachable_From;


SELECT first_name, last_name
FROM employees
WHERE REGEXP_LIKE (first_name, '^Ste(v|ph)en$');


SELECT REGEXP_REPLACE(phone_number, '\.','-') AS phone
FROM employees; 

SELECT phone_number, REGEXP_REPLACE(phone_number, '\.','-')
FROM employees; 

SELECT street_address, REGEXP_INSTR(street_address, '[[:alpha]]') AS First_Alpha_Possition
FROM location;


CREATE USER demo_sr2
IDENTIFIED BY demo
DEFAULT TABLESPACE users
QUOTA 10M ON users;


GRANT create session, create table, create view, create sequence,
      create any index, create synonym
TO demo_sr1;


--================================================================
--1 Create one user and set quota 
CREATE USER chamrern
IDENTIFIED BY chamrern_final
DEFAULT TABLESPACE users 
QUOTA 10M ON users;

--2 Grant create session, create table, create view, create synonym, create sequence, create any index to this user
GRANT CREATE SESSION, CREATE TABLE , CREATE SEQUENCE, CREATE VIEW , CREATE SYNONYM, CREATE ANY INDEX
TO chamrern;

--3 Connect to this user and create table below 
CREATE TABLE JOBS_SR1 (
    JOB_ID VARCHAR2(10) PRIMARY KEY,
    JOB_TITLE VARCHAR2(35),
    MIN_SALARY NUMBER(6,0),
    MAX_SALARY NUMBER(6,0)
);

CREATE TABLE EMPLOYEES_SR1(
    EMPLOYEE_ID NUMBER(6,0) PRIMARY KEY,
    LAST_NAME VARCHAR2(25)
    JOB_ID VARCHAR2(10) CONSTRAINT EMP_JOBS_FK REFERENCES JOBS_SR1(JOB_ID),
    SALARY NUMBER(8,2),
    MANAGER_ID NUMBER(6,0),
    DEPARTMENT_ID NUMBER(4,0)
);
DROP TABLE EMPLOYEES_SR1;

CREATE TABLE DEPARTMENTS(
    DEPARTMENT_ID NUMBER(4,0) PRIMARY KEY, 
    DEPARTMENT_NAME VARCHAR2(30) CONSTRAINT DP_FK REFERENCES DEPARTMENTS(DEPARTMENT_ID)
);

--4 Insert Data 
--INSERT INTO jobs
INSERT INTO JOBS_SR1
VALUES('AD_PRES','President',20000,40000);

INSERT INTO JOBS_SR1
VALUES('AD_VP','Administration Vice President',15000,30000);

INSERT INTO JOBS_SR1
VALUES('IT_PROG','Programmer',4000,10000);

--INSERT INTO DEPARTMENTS 
INSERT INTO DEPARTMENTS
VALUES(60,'IT');

INSERT INTO DEPARTMENTS
VALUES(90,'Executive');

--INSERT INTO EMPLOYEES
INSERT INTO EMPLOYEES
VALUES(100,'King','AD_PRES',24000,NULL,90);

INSERT INTO EMPLOYEES
VALUES(101,'Kochhar','AD_VP',17000,100,90);

INSERT INTO EMPLOYEES
VALUES(102,'De haan','AD_VP',17000,100,90);

INSERT INTO EMPLOYEES
VALUES(103,'Hunold','IT_PROG',9000,102,60);

--5 Create View Employee_Department(employee_id, last_name, job_title) 
CREATE VIEW Employee_Department AS 
SELECT employee_id, last_name, job_title
FROM employees e JOIN JOBS_SR1 j
ON(e.job_id=j.job_title);

--6 Create Synonym emp1 for Employee_Department 
CREATE SYNONYM emp1
FOR Employee_Department ;

--7 Display employees whose  department_name=’IT’ 
SELECT *
FROM EMPLOYEES JOIN departments
USING (department_id)
WHERE department_name='IT'; 

--8 Display employees whose Min_salary>10000 
SELECT *
FROM employees JOIN JOBS_SR1
USING(JOB_ID)
WHERE min_salary>10000;

--9 Display employees whose Job_id and Salary the same ‘Kochhar’ 
SELECT *
FROM EMPLOYEES
WHERE job_id =( SELECT job_id
                FROM employees
                WHERE employees.last_name='Kochhar'
              )
AND SALARY =  ( SELECT SALARY
                FROM employees
                WHERE employees.last_name='Kochhar'
              ); 
              
--10 Using correlated sub query to display lastName, Department_Name 
SELECT last_name
FROM employees 
ORDER BY( SELECT department_name
          FROM departments
          WHERE department_id=employees.department_id
);

--11 Convert this statement to NONPAIRWISE comparison sub query 
--SELECT * FROM employees WHERE (manager_id, Department_id) in (SELECT manager_id, department_id         FROM employees        WHERE employee_id=102) NONPAIRWISE 
SELECT * 
FROM employees
WHERE manager_id IN (SELECT manager_id         
                     FROM employees        
                     WHERE employee_id=102)
AND Department_id IN (SELECT department_id         
                      FROM employees        
                      WHERE employee_id=102);
                      
--12 Alter the session to set the NLS_DATE_FORMAT to DD-MM-YYYY HH:MI:SS
ALTER SESSION 
SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH:MI:SS';

--13 Find all employees who are not supervisor (using NOT EXISTS) 
SELECT *
FROM employees e1 
WHERE NOT EXISTS (SELECT 'X' 
                    FROM   employees e2
                    WHERE  e1.employee_id = e2.manager_id
                );
--14 Find all employees who are not supervisor (using NOT IN)
SELECT *
FROM employees e1 
WHERE employee_id NOT IN (SELECT manager_id
                          FROM employees e2);
                          
--15 Create table emp1(id, sal), emp2(id, dates), emp3(id, dates) and Emp4(id, dates) 
CREATE TABLE emp1(
    id NUMBER(5),
    sal NUMBER(6,0)
);

CREATE TABLE emp2(
    id NUMBER(5),
    dates DATE
);
CREATE TABLE emp3(
    id NUMBER(5),
    dates DATE
);
CREATE TABLE emp4(
    id NUMBER(5),
    dates DATE   
);

--16 Copy first into emp1 (id, sal) if sal<12000 into 
--Emp2 (id, dates) if id<60 into 
--Emp3 (id, dates) if dates >’10-sep-09’ Else into Emp4 (id, dates)  
--from query (select department_id, sum(salary), min (hire_date))  
INSERT ALL
    WHEN Sal<12000 THEN
        INTO emp1 VALUES(ID,SAL)
    WHEN ID<60 THEN
        INTO emp2 VALUES(ID,Dates)
    WHEN DATES>'10-sep-09' THEN
        INTO emp3 VALUES(ID,DATES)
    ELSE
        INTO emp4  VALUES(ID,DATES)

SELECT department_id AS "ID", SUM(salary) AS "SAL", MIN(hire_date) AS "DATES"
from employees
GROUP BY  department_id;


--1
SELECT first_name, last_name, hire_date, salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 3 ROWS ONLY;

--2



--3
SELECT *
FROM EMPLOYEES
WHERE job_id =( SELECT job_id
                FROM employees
                WHERE employees.last_name='Rajs'
              )
AND SALARY =  ( SELECT salary
                FROM employees
                WHERE employees.last_name='Rajs'
              );
              

--4
SELECT last_name
FROM employees 
ORDER BY( SELECT department_name
          FROM departments
          WHERE department_id=employees.department_id
);


--5
CREATE TABLE emp1(
    id NUMBER(5),
    sal NUMBER(6,0)
);

CREATE TABLE emp2(
    id NUMBER(5),
    dates DATE
);
CREATE TABLE emp3(
    id NUMBER(5),
    dates DATE
);
CREATE TABLE emp4(
    id NUMBER(5),
    dates DATE   
);


INSERT ALL
    WHEN Sal<12000 THEN
        INTO emp1 VALUES(ID,SAL)
    WHEN ID<60 THEN
        INTO emp2 VALUES(ID,Dates)
    WHEN DATES>'10-sep-09' THEN
        INTO emp3 VALUES(ID,DATES)
    ELSE
        INTO emp4  VALUES(ID,DATES)

SELECT department_id AS "ID", SUM(salary) AS "SAL", MIN(hire_date) AS "DATES"
from employees
GROUP BY  department_id;





select last_name,(SELECT department_name
                    from departments 
                    where department_id=employees.department_id)as department_name
from employees;

