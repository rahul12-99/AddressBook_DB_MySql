********* Welcome to addressBook using Mysql *********

mysql> create database Address_Book_Service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| addressbook_db       |
| addressbookdb        |
| employee             |
| employee_db          |
| employeepayroll_db   |
| information_schema   |
| mysql                |
| payroll_service      |
| payroll_service_jdbc |
| performance_schema   |
| rahul                |
| studentdb            |
| sys                  |
| world                |
+----------------------+
15 rows in set (0.01 sec)

mysql> use address_book_service;
Database changed
mysql> create table addressbook_table(firstname varchar(20),lastname varchar(20),address varchar(50),
city varchar(20),state varchar(20),zip int,phone_number long,email varchar(30));
Query OK, 0 rows affected (0.10 sec)

mysql>