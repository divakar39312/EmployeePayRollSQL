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

















