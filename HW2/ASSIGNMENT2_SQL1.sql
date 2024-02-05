/*DB SOFTWARE: USAGE OF SQL SERVER SCRIPTS7- MICROSOFT SQL SERVER MANAGEMENT STUDIO*/
/*QUERY 1*/
create database CovidTracing1;

use CovidTracing1;

/*Creating the Tables*/
create table Employee(emp_id int primary key, emp_name varchar(50), office_no int, floor_no int, phone_no varchar(15), email_add varchar(50));
create table Meeting(meeting_id int primary key, emp_id int,room_no int, floor_no int,meet_start_time Time check(meet_start_time between '08:00:00' AND '18:00:00'),Foreign key(emp_id) references Employee(emp_id));
create table Notifications(notify_id int primary key, emp_id int,notify_date date,notify_type varchar(20),Foreign key(emp_id) references Employee(emp_id));
create table Symptoms(row_id int primary key, emp_id int,date_reported date,symptoms_id int check(symptoms_id>=1 and symptoms_id<=5),Foreign key(emp_id) references Employee(emp_id));
create table Scan(scan_id int primary key,scan_date date,scan_time int check(scan_time>=0 and scan_time<=23),emp_id int, temp float,Foreign key(emp_id) references Employee(emp_id));
create table Test(test_id int primary key, locations varchar(50),test_date date,test_time int check(test_time>=0 and test_time<=23), emp_id int, test_result varchar(20),Foreign key(emp_id) references Employee(emp_id));
create table Cases(case_id int primary key, emp_id int, case_date date, resolution varchar(50),Foreign key(emp_id) references Employee(emp_id));
Create table Health_Status(status_row_id int primary key,emp_id int,status_date date,h_status varchar(50),Foreign key(emp_id) references Employee(emp_id));
 
/*Inserting values into Employee table*/
insert into Employee values(1000,'shreya',1,1,'123456789','shreya@123.com');
insert into Employee values(1001,'shraddha',2,3,'1237126839','shraddha@234.com');
insert into Employee values(1002,'anjan',3,4,'287817938','anjan@678.com');
insert into Employee values(1003,'arjun',1,2,'8316839930','arjun@456.com');
insert into Employee values(1004,'mohith',2,5,'100832281','mohith@189.com');
insert into Employee values(1005,'mahesh',2,5,'2498298498','mahesh@189.com');
insert into Employee values(1006,'shravya',2,3,'9958385992','shravya@234.com');
insert into Employee values(1007,'mamtha',1,5,'42879752505','mamtha@987.com');

/*Inserting values into Meeting table*/
insert into Meeting values(100,1001,5,1,'8:00:00');
insert into Meeting values(101,1004,6,2,'9:00:00');
insert into Meeting values(102,1002,7,4,'10:00:00');
insert into Meeting values(103,1003,6,3,'11:00:00');
insert into Meeting values(104,1000,5,5,'12:00:00');

/*Inserting values into Notifications table*/
insert into Notifications values(10,1000,'10/20/2023','mandatory');
insert into Notifications values(11,1001,'10/21/2023','optional');
insert into Notifications values(12,1003,'10/22/2023','mandatory');
insert into Notifications values(13,1002,'10/23/2023','optional');
insert into Notifications values(14,1004,'10/24/2023','mandatory');

/*Inserting values into Symptoms table*/
insert into Symptoms values(20,1004,'10/10/2023',1);
insert into Symptoms values(21,1002,'10/11/2023',2);
insert into Symptoms values(22,1003,'10/12/2023',3);
insert into Symptoms values(23,1000,'10/13/2023',4);
insert into Symptoms values(24,1001,'10/14/2023',5);
insert into Symptoms values(25,1000,'10/15/2023',1);
insert into Symptoms values(26,1002,'10/16/2023',5);
insert into Symptoms values(27,1004,'10/15/2023',1);
insert into Symptoms values(28,1000,'10/15/2023',5);
insert into Symptoms values(29,1000,'10/18/2023',2);
insert into Symptoms values(30,1000,'10/10/2023',3);
insert into Symptoms values(31,1002,'10/30/2023',1);
insert into Symptoms values(32,1002,'10/31/2023',3);
insert into Symptoms values(33,1002,'10/29/2023',4);
insert into Symptoms values(34,1007,'10/29/2023',4);
insert into Symptoms values(35,1007,'10/28/2023',4);
insert into Symptoms values(36,1007,'10/27/2023',4);
insert into Symptoms values(37,1007,'10/26/2023',4);
insert into Symptoms values(38,1007,'10/29/2023',4);

/*Inserting values into Scan table*/
insert into Scan values(30,'10/01/2023',8,1004,98.2);
insert into Scan values(31,'10/02/2023',9,1002,94.2);
insert into Scan values(32,'10/03/2023',10,1003,93.2);
insert into Scan values(33,'10/04/2023',11,1000,97.2);
insert into Scan values(34,'10/05/2023',12,1001,91.2);

/*Inserting values into Test table*/
insert into Test values(40,'california','10/06/2023',1,1004,'positive');
insert into Test values(41,'texas','10/06/2023',2,1003,'negative');
insert into Test values(42,'florida','10/10/2023',3,1002,'positive');
insert into Test values(43,'new york','10/08/2023',4,1001,'negative');
insert into Test values(44,'arizona','10/09/2023',3,1000,'negative');
insert into Test values(45,'washington','10/07/2023',3,1006,'positive');


/*Inserting values into Cases table*/
insert into Cases values(50,1000,'09/11/2023','back to work');
insert into Cases values(51,1001,'09/12/2023','left the company');
insert into Cases values(52,1002,'09/13/2023','deceased');
insert into Cases values(53,1004,'09/14/2023','back to work');
insert into Cases values(54,1003,'09/15/2023','left the company');

/*Inserting values into Health_Status table*/
insert into Health_Status values(200,1004,'09/01/2023','sick');
insert into Health_Status values(201,1003,'09/02/2023','well');
insert into Health_Status values(202,1000,'09/03/2023','hospitalised');
insert into Health_Status values(203,1001,'09/04/2023','sick');
insert into Health_Status values(204,1002,'09/05/2023','well');
insert into Health_Status values(205,1005,'09/01/2023','sick');
insert into Health_Status values(206,1006,'09/05/2023','sick');
insert into Health_Status values(207,1007,'09/15/2023','sick');

/*Displaying all the data from the table*/
select * from Employee;
select * from Meeting;
select * from Notifications;
select * from Symptoms;
select * from Scan;
select * from Test;
select * from Cases;
select * from Health_Status;