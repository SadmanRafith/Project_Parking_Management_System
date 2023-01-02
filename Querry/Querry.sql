                                    /*Query*/

//*1.	Equijoin: 

Question: Display the owner name and their manager’s name.*/
select O.name as owner_name,m.name as manager_name
from  owner o,manager m
where o.mgr_id = m.mgr_id

/*2.	/*OUTER-JOIN:
Question: Display the first name, and phone number of all drivers who have parked any car.*/
select d.dri_first_name,d.dri_phone_num,s.slip_id,s.issue_date,s.duration
from driver d,parking_slip2 s
where d.dri_id=s.dri_id(+)

/*3.SELF-JOIN:
Question: Display the name and salary of those managers who earn less than the manager earn whose id number is 13.*/

select m.name, m.salary 
from manager m, manager a
where m.salary < a.salary 
      and a.mgr_id = 13

/*4.SUB-QUERRY (1)
Question: Display the  name and salary for all managers who earn more than manager id 13.*/
select name ,salary 
from manager
where salary>(select salary from manager
              where mgr_id = 13)’

/*5.SUB-QUERRY (2)
Question: Display the id, name,  and phone number of owner whose manager name is Winston.*/
select mgr_id,name,phone_number, salary
from manager
where mgr_id IN(select mgr_id
from owner
where name= 'Winston')

/*6.SIMPLE VIEW
Question: create a view name mgr_vu and display id, name, salary, and phone number where the manager salary is between 40000 to 80000.*/
create view mgr_vu
as select
mgr_id, name, salary, phone_number
from manager
where salary between 40000 and 80000
select *
from mgr_vu

 

/*6.COMPLEX VIEW
 question: create view parking_details( vehicle_type, spot_type, amount, spot_id)*/
as select v.type, r.rate_type, r.rate_hourly_rate, s.spot_id
from vehicle2 v, rate r, parking_spot s, spot_rate sr
where v.spot_id=s.spot_id
and   s.spot_id= sr.spot_id
and   r.rate_id=sr.rate_id

select * from parking_details

 
                                         /*CONSTRAIN*/


/*1.	Primary Key 
Question: Add primaru key to manager table*/
               create table Manager( MGR_ID number(10)  primary key,
                   Name Varchar2(30),
                   Salary number(30) not null,
                   Phone_Number number(10) not null,
                   Role varchar2(30)
                    )
desc manager

/*2.	Foreign Key: 
Question: Add constrain for spot_id and Rate_id as foreign key in spot_rate table.*/
   create table spot_rate( Rate_ID number(10),
                        foreign key(rate_id) references rate(rate_id),
                        spot_id number(10),
                        foreign key(spot_id) references parking_spot(spot_id)
                   
               )
Desc spot_rate

/*3.	Not Null
QUestion: Apply not null in salary while creating table manger.*/
               create table Manager( MGR_ID number(10)  primary key,
                   Name Varchar2(30),
                   Salary number(30) not null,
                   Phone_Number number(10) not null,
                   Role varchar2(30)
                    )
desc manager
 
/*4. Check:
Question: Apply check constrain in spot_type  while creating parking_spot table*/
 create table Parking_Spot(Spot_ID number(10)  primary key,
                           Spot_Type varchar2(20) check(spot_type in('small','large','medium')),
                           Space_ID number(10),
                           foreign key(space_id) references parking_space(space_id)
                          )
desc Parking_Spot
 
/*5. Unique
Question: Apply an unique contrain in dri_phone_Num and dri_Email while creating Driver2 table.*/
 create table Driver2(Dri_ID number(10)  primary key,
                   dri_First_name Varchar2(50),
                   dri_Last_name Varchar2(50),
                   dri_Phone_Num number(11) unique,
                   dri_Email varchar2(50) unique,
                   dri_address varchar2(50),
                   fine_id number(10),
                   foreign key(fine_id) references fine(fine_id)
                    )
desc Driver2
 

