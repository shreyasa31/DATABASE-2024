/*DB SOFTWARE: USAGE OF SQL SERVER SCRIPTS7- MICROSOFT SQL SERVER MANAGEMENT STUDIO*/
use CovidTracing1;
/*QUERY 3: find sickest floor*/
/*here view is a virtual table*/ 
go
create view v as
select floor_no, COUNT(distinct e.emp_id) as sick_employee_count
    from Employee as e 
    INNER JOIN Health_Status as h on e.emp_id = h.emp_id 
    where h_status = 'sick'
    group by floor_no
go

select floor_no
from v
where sick_employee_count = (select MAX(sick_employee_count) from v);