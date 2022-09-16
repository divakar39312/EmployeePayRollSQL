---------------- UC1 ----------------

mysql> create database payroll_services;
Query OK, 1 row affected (2.75 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| addressbook_db     |
| firstdatabase      |
| flight             |
| flights            |
| information_schema |
| location_web_app   |
| login_app_db       |
| mysql              |
| payroll_services   |
| performance_schema |
| projectdb1         |
| seconddatabase     |
| student_app_db     |
| sys                |
| user_app_demo      |
| userid             |
| userregister       |
| web_app2           |
+--------------------+
18 rows in set (0.24 sec)

mysql> use payroll_services;
Database changed


******************** UC2 *************


mysql> CREATE TABLE Employee_Payroll
    -> (id int not null auto_increment,
    -> name varchar(50) not null,
    -> salary Double not null,
    -> StartDate Date not null,
    -> primary key(id)
    -> );
Query OK, 0 rows affected (36.24 sec)

mysql> DESCRIBE Employee_Payroll;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int         | NO   | PRI | NULL    | auto_increment |
| name      | varchar(50) | NO   |     | NULL    |                |
| salary    | double      | NO   |     | NULL    |                |
| StartDate | date        | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
4 rows in set (6.56 sec)



************** UC3 *********************

mysql> INSERT INTO Employee_Payroll (name,salary,StartDate) VALUES
    -> ('Divakar',55000,'2021-03-31'),
    -> ('anil',50000,'2020-04-11'),
    -> ('Abinav',90000,'2022-02-18');
Query OK, 3 rows affected (12.25 sec)
Records: 3  Duplicates: 0  Warnings: 0

*********** UC4 *************

mysql> select * from Employee_Payroll;
+----+---------+--------+------------+
| id | name    | salary | StartDate  |
+----+---------+--------+------------+
|  1 | Divakar |  55000 | 2021-03-31 |
|  2 | anil    |  50000 | 2020-04-11 |
|  3 | Abinav  |  90000 | 2022-02-18 |
+----+---------+--------+------------+
3 rows in set (2.08 sec)

************* UC5 ***********************************



mysql> SELECT salary FROM Employee_Payroll WHERE name = 'divakar';
+--------+
| salary |
+--------+
|  55000 |
+--------+
1 row in set (1.35 sec)

mysql> SELECT salary FROM Employee_Payroll WHERE StartDate BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+--------+
| salary |
+--------+
|  55000 |
|  50000 |
|  90000 |
+--------+
3 rows in set (1.57 sec)


******************* UC6 *********************


mysql> ALTER TABLE Employee_Payroll ADD gender char(1) NOT NULL;
Query OK, 0 rows affected (12.56 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE Employee_Payroll;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int         | NO   | PRI | NULL    | auto_increment |
| name      | varchar(50) | NO   |     | NULL    |                |
| salary    | double      | NO   |     | NULL    |                |
| StartDate | date        | NO   |     | NULL    |                |
| gender    | char(1)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
5 rows in set (0.98 sec)

mysql> UPDATE Employee_Payroll SET gender = 'M' WHERE name = 'Divakar';
Query OK, 1 row affected (0.31 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Employee_Payroll SET gender = 'M' WHERE name = 'anil';
Query OK, 1 row affected (0.67 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Employee_Payroll SET gender = 'F' WHERE name = 'Abinav';
Query OK, 1 row affected (0.61 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Employee_Payroll;
+----+---------+--------+------------+--------+
| id | name    | salary | StartDate  | gender |
+----+---------+--------+------------+--------+
|  1 | Divakar |  55000 | 2021-03-31 | M      |
|  2 | anil    |  50000 | 2020-04-11 | M      |
|  3 | Abinav  |  90000 | 2022-02-18 | F      |
+----+---------+--------+------------+--------+
3 rows in set (0.00 sec)


*************** UC7 ********************************************

mysql> select sum(salary) from Employee_Payroll Where gender = 'M' group by gender;
+-------------+
| sum(salary) |
+-------------+
|      105000 |
+-------------+
1 row in set (0.10 sec)

mysql> select sum(salary) from Employee_Payroll Where gender = 'F' group by gender;
+-------------+
| sum(salary) |
+-------------+
|       90000 |
+-------------+
1 row in set (0.00 sec)

mysql> select avg(salary) from Employee_Payroll Where gender = 'M' group by gender;
+-------------+
| avg(salary) |
+-------------+
|       52500 |
+-------------+
1 row in set (0.00 sec)

mysql> select min(salary) from Employee_Payroll Where gender = 'M' group by gender;
+-------------+
| min(salary) |
+-------------+
|       50000 |
+-------------+
1 row in set (0.06 sec)

mysql> select max(salary) from Employee_Payroll Where gender = 'M' group by gender;
+-------------+
| max(salary) |
+-------------+
|       55000 |
+-------------+
1 row in set (0.00 sec)

mysql> select count(salary) from Employee_Payroll Where gender = 'M' group by gender;
+---------------+
| count(salary) |
+---------------+
|             2 |
+---------------+
1 row in set (0.02 sec)

mysql> select count(salary) from Employee_Payroll Where gender = 'F' group by gender;
+---------------+
| count(salary) |
+---------------+
|             1 |
+---------------+
1 row in set (0.00 sec)


********************** UC8 *******************************

mysql> ALTER TABLE Employee_Payroll ADD phone_number VARCHAR(250) AFTER name;
Query OK, 0 rows affected (5.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD address VARCHAR(250) AFTER phone_number;
Query OK, 0 rows affected (3.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD department VARCHAR(250) AFTER address;
Query OK, 0 rows affected (15.71 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ALTER address SET DEFAULT 'TBD';
Query OK, 0 rows affected (0.53 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE Employee_Payroll;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(50)  | NO   |     | NULL    |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| address      | varchar(250) | YES  |     | TBD     |                |
| department   | varchar(250) | YES  |     | NULL    |                |
| salary       | double       | NO   |     | NULL    |                |
| StartDate    | date         | NO   |     | NULL    |                |
| gender       | char(1)      | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
8 rows in set (4.27 sec)


************************** UC9 *********************************

mysql> ALTER TABLE Employee_Payroll RENAME COLUMN salary TO basic_pay;
Query OK, 0 rows affected (0.74 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD deductions Double NOT NULL AFTER basic_pay;
Query OK, 0 rows affected (2.87 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD taxable_pay Double NOT NULL AFTER deductions;
Query OK, 0 rows affected (2.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD tax Double NOT NULL AFTER taxable_pay;
Query OK, 0 rows affected (4.65 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Employee_Payroll ADD net_pay Double NOT NULL AFTER tax;
Query OK, 0 rows affected (2.56 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from Employee_Payroll;
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
| id | name    | phone_number | address | department | basic_pay | deductions | taxable_pay | tax | net_pay | StartDate  | gender |
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
|  1 | Divakar | NULL         | NULL    | NULL       |     55000 |          0 |           0 |   0 |       0 | 2021-03-31 | M      |
|  2 | anil    | NULL         | NULL    | NULL       |     50000 |          0 |           0 |   0 |       0 | 2020-04-11 | M      |
|  3 | Abinav  | NULL         | NULL    | NULL       |     90000 |          0 |           0 |   0 |       0 | 2022-02-18 | F      |
+----+---------+--------------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+
3 rows in set (0.02 sec)


*********************** UC10 **************************************


mysql> INSERT INTO Employee_Payroll (id,name,phone_number,address,department,basic_pay,deductions,taxable_pay,tax,net_pay,StartDate,gender) VALUES
    -> (4, 'Terissa', 7846821730, 'Amberpet', 'Sales', 45000, 2000, 1500, 5000, 50000, '2022-05-30','F'),
    -> (5, 'Terissa', 7846821730, 'Amberpet', 'Marketing', 45000, 2000, 1500, 5000, 50000, '2022-05-30','F');
Query OK, 2 rows affected (0.74 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Employee_Payroll;
+----+---------+--------------+----------+------------+-----------+------------+-------------+------+---------+------------+--------+
| id | name    | phone_number | address  | department | basic_pay | deductions | taxable_pay | tax  | net_pay | StartDate  | gender |
+----+---------+--------------+----------+------------+-----------+------------+-------------+------+---------+------------+--------+
|  1 | Divakar | NULL         | NULL     | NULL       |     55000 |          0 |           0 |    0 |       0 | 2021-03-31 | M      |
|  2 | anil    | NULL         | NULL     | NULL       |     50000 |          0 |           0 |    0 |       0 | 2020-04-11 | M      |
|  3 | Abinav  | NULL         | NULL     | NULL       |     90000 |          0 |           0 |    0 |       0 | 2022-02-18 | F      |
|  4 | Terissa | 7846821730   | Amberpet | Sales      |     45000 |       2000 |        1500 | 5000 |   50000 | 2022-05-30 | F      |
|  5 | Terissa | 7846821730   | Amberpet | Marketing  |     45000 |       2000 |        1500 | 5000 |   50000 | 2022-05-30 | F      |
+----+---------+--------------+----------+------------+-----------+------------+-------------+------+---------+------------+--------+
5 rows in set (0.02 sec)



********************** UC11 ***************************************


mysql> CREATE TABLE departments(
    -> dept_id INT NOT NULL,
    -> dept_name varchar(150) NOT NULL,
    -> emp_id INT NOT NULL,
    -> PRIMARY KEY(dept_id),
    -> FOREIGN KEY (emp_id) REFERENCES employee_payroll (id));
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE payroll(
    -> payroll_id INT NOT NULL,
    -> basic_pay double NOT NULL,
    -> PRIMARY KEY(payroll_id),
    -> emp_id INT NOT NULL,
    -> FOREIGN KEY (emp_id) REFERENCES employee_payroll(id));
Query OK, 0 rows affected (0.03 sec)



















