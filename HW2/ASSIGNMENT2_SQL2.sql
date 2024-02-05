/*DB SOFTWARE: USAGE OF SQL SERVER SCRIPTS7- MICROSOFT SQL SERVER MANAGEMENT STUDIO*/
use CovidTracing1;
/*
insert into Symptoms values(23,1000,'10/13/2023',4);
insert into Symptoms values(33,1002,'10/29/2023',4);
insert into Symptoms values(34,1007,'10/29/2023',4);
insert into Symptoms values(35,1007,'10/28/2023',4);
insert into Symptoms values(36,1007,'10/27/2023',4);
insert into Symptoms values(37,1007,'10/26/2023',4);
insert into Symptoms values(38,1007,'10/29/2023',4);*/

/*this query outputs 4 which is most self reported symptom and also this query handles if 2 symptoms are most reported for example if symptom 3 and 4 has same count then it outputs both*/

/*QUERY 2: outputs the most self-reporting symptoms*/
select symptoms_id
from Symptoms
group by symptoms_id
having COUNT(*) = (
    select MAX(count) 
    from (
        select COUNT(*) AS count
        from Symptoms
        group by symptoms_id
    ) as c);