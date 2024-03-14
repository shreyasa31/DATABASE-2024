/*DB SOFTWARE: USAGE OF SQL SERVER SCRIPTS7- MICROSOFT SQL SERVER MANAGEMENT STUDIO*/
use CovidTracing1;
/*QUERY 4: The management would like stats, for a given period (between start, end dates), on the following: number of scans, number of tests, number of employees who self-reported symptoms, number of positive cases. Write queries to output these*/
/*number of scan between 10/01/2023 and 10/05/2023*/
select count(*) as no_of_scans from Scan where scan_date between '10/01/2023' and '10/05/2023';

/*number of tests between 10/06/2023 and 10/10/2023*/

select count(*) as no_of_tests from Test where test_date between '10/06/2023' and '10/10/2023';

/*number of employees who self reported symptoms between 10/10/2023 and 10/13/2023*/
/*select count(e.emp_id) as no_of_selfreport from Employee as e inner join Symptoms as s on e.emp_id=s.emp_id where date_reported between '10/10/2023' and '10/13/2023' ;*/
/*this above commented query gives the same output as below query just a demo to use inner join */
select count(emp_id) as no_of_selfreport from Symptoms where date_reported between '10/10/2023' and '10/13/2023' ;

/*number of positive cases between 10/06/2023 and 10/08/2023*/

select count(test_result) as no_of_positives from Test where test_result='positive' and test_date between '10/06/2023' and '10/08/2023' ;
