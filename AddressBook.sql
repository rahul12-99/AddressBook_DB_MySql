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

mysql> insert into addressbook_table(firstname,lastname,address,city,state,zip,phone_number,email) values 
('Rahul','Kumar','Banka','Patna','Bihar',813211,99934344,'rah@123'),('Kundan','Singh','Seohar','Patna','Bihar',73211,967634344,'kun@123'),
('Shubham','Sharma','abc','Mum','Mah',765455,865334334,'shu@123');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from addressbook_table;
+-----------+----------+---------+-------+-------+--------+--------------+---------+
| firstname | lastname | address | city  | state | zip    | phone_number | email   |
+-----------+----------+---------+-------+-------+--------+--------------+---------+
| Rahul     | Kumar    | Banka   | Patna | Bihar | 813211 | 99934344     | rah@123 |
| Kundan    | Singh    | Seohar  | Patna | Bihar |  73211 | 967634344    | kun@123 |
| Shubham   | Sharma   | abc     | Mum   | Mah   | 765455 | 865334334    | shu@123 |
+-----------+----------+---------+-------+-------+--------+--------------+---------+
3 rows in set (0.00 sec)

mysql>update addressbook_table set address = 'Patna' where firstname = 'Shubham';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook_table;
+-----------+----------+---------+-------+-------+--------+--------------+---------+
| firstname | lastname | address | city  | state | zip    | phone_number | email   |
+-----------+----------+---------+-------+-------+--------+--------------+---------+
| Rahul     | Kumar    | Banka   | Patna | Bihar | 813211 | 99934344     | rah@123 |
| Kundan    | Singh    | Seohar  | Patna | Bihar |  73211 | 967634344    | kun@123 |
| Shubham   | Sharma   | Patna   | Mum   | Mah   | 765455 | 865334334    | shu@123 |
+-----------+----------+---------+-------+-------+--------+--------------+---------+
3 rows in set (0.00 sec)

mysql> delete from addressbook_table where firstname = 'Shubham';
Query OK, 1 row affected (0.01 sec)

mysql> select * from addressbook_table;
+-----------+----------+---------+-------+-------+--------+--------------+---------+
| firstname | lastname | address | city  | state | zip    | phone_number | email   |
+-----------+----------+---------+-------+-------+--------+--------------+---------+
| Rahul     | Kumar    | Banka   | Patna | Bihar | 813211 | 99934344     | rah@123 |
| Kundan    | Singh    | Seohar  | Patna | Bihar |  73211 | 967634344    | kun@123 |
+-----------+----------+---------+-------+-------+--------+--------------+---------+
2 rows in set (0.00 sec)

mysql>select state,city from addressbook_table where firstname = 'Rahul';
+-------+-------+
| state | city  |
+-------+-------+
| Bihar | Patna |
+-------+-------+
1 row in set (0.00 sec)

mysql>select count(city),count(state) from addressbook_table where city = 'Patna' and state = 'Bihar';
+-------------+--------------+
| count(city) | count(state) |
+-------------+--------------+
|           2 |            2 |
+-------------+--------------+
1 row in set (0.01 sec)

mysql>select firstname from addressbook_table where city = 'Patna' order by firstname ASC;
+-----------+
| firstname |
+-----------+
| Kundan    |
| Rahul     |
+-----------+
2 rows in set (0.00 sec)

mysql>alter table addressbook_table add column book_name varchar(20) after lastname;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table addressbook_table add column type varchar(20) after book_name;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update addressbook_table set book_name = 'book1',type = 'Friends' where firstname in ('Kundan');
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressbook_table set book_name = 'book2',type = 'Family' where firstname in ('Rahul');
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook_table;
+-----------+----------+-----------+---------+---------+-------+-------+--------+--------------+---------+
| firstname | lastname | book_name | type    | address | city  | state | zip    | phone_number | email   |
+-----------+----------+-----------+---------+---------+-------+-------+--------+--------------+---------+
| Rahul     | Kumar    | book2     | Family  | Banka   | Patna | Bihar | 813211 | 99934344     | rah@123 |
| Kundan    | Singh    | book1     | Friends | Seohar  | Patna | Bihar |  73211 | 967634344    | kun@123 |
+-----------+----------+-----------+---------+---------+-------+-------+--------+--------------+---------+
2 rows in set (0.00 sec)

mysql> select count(type) from addressbook_table where type = 'Family';
+-------------+
| count(type) |
+-------------+
|           1 |
+-------------+
1 row in set (0.00 sec)

mysql> select count(type) from addressbook_table where type = 'Friends';
+-------------+
| count(type) |
+-------------+
|           1 |
+-------------+
1 row in set (0.00 sec)

mysql>insert into addressbook_table values('Raunak','Rao','book1','Friend','Banka','Bhagalpur','Bihar',84554,222111333,'raunak@gmail.com'),
('Shiv','Kumar','book2','Family','Badli','Delhi','Delhi',842100,809090909,'shiv@gmail.com');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from addressbook_table;
+-----------+----------+-----------+---------+---------+-----------+-------+--------+--------------+------------------+
| firstname | lastname | book_name | type    | address | city      | state | zip    | phone_number | email            |
+-----------+----------+-----------+---------+---------+-----------+-------+--------+--------------+------------------+
| Rahul     | Kumar    | book2     | Family  | Banka   | Patna     | Bihar | 813211 | 99934344     | rah@123          |
| Kundan    | Singh    | book1     | Friends | Seohar  | Patna     | Bihar |  73211 | 967634344    | kun@123          |
| Raunak    | Rao      | book1     | Friend  | Banka   | Bhagalpur | Bihar |  84554 | 222111333    | raunak@gmail.com |
| Shiv      | Kumar    | book2     | Family  | Badli   | Delhi     | Delhi | 842100 | 809090909    | shiv@gmail.com   |
+-----------+----------+-----------+---------+---------+-----------+-------+--------+--------------+------------------+
4 rows in set (0.00 sec)

mysql>