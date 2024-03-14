/*DB SOFTWARE: USAGE OF SQL SERVER SCRIPTS7- MICROSOFT SQL SERVER MANAGEMENT STUDIO*/
use CovidTracing1;

/*QUERY 5: get the email address and id of employees who has all 5 symptoms*/
/*This query uses table division to identify employees who has all 5 symptoms*/
/*Firstly, Employee and Symptoms table are combined inorder to obtaind a derived table called AllSymptoms it contains columns: employee address, employee id and symptoms id */
/*Secondly, the EXCEPT operator subtracts employees who dont have all 5 symptoms and returns one with all symptoms*/
/*The LEFT JOIN combined with the IS NULL condition ensures that only non-matching rows from the AllSymptoms table are selected*/
/*
insert into Symptoms values(25,1000,'10/15/2023',1);
insert into Symptoms values(29,1000,'10/18/2023',2);
insert into Symptoms values(30,1000,'10/10/2023',3);
insert into Symptoms values(23,1000,'10/13/2023',4);
insert into Symptoms values(28,1000,'10/15/2023',5);

insert into Symptoms values(31,1002,'10/30/2023',1);
insert into Symptoms values(21,1002,'10/11/2023',2);
insert into Symptoms values(32,1002,'10/31/2023',3);
insert into Symptoms values(33,1002,'10/29/2023',4);
insert into Symptoms values(26,1002,'10/16/2023',5);

*/
with AllSymptoms as (
    select distinct email_add,e.emp_id as employee_ID, symptoms_id 
    from Employee as e
    CROSS JOIN Symptoms as s 
   
)

select distinct employee_ID,email_add
from AllSymptoms
except
select employee_ID,email_add
from AllSymptoms as a
LEFT JOIN Symptoms s on a.employee_ID = s.emp_id AND a.symptoms_id = s.symptoms_id
where s.symptoms_id IS NULL;