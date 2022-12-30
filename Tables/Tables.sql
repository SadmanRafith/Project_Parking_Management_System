/*Table 1: Manager */
create table Manager( MGR_ID number(10)  primary key,
                   Name Varchar2(30),
                   Salary number(30) not null,
                   Phone_Number number(10) not null,
                   Role varchar2(30)
                    )
desc manager

/*Table 2: PARKING_SPACE */
create table Parking_Space(Space_ID number(10)  primary key,
                           Space_Type varchar2(20),
                           Space_Adress varchar2(20)
                          )
desc Parking_Space


/* TAble 3: PARKING_SPOT*/
create table Parking_Spot(Spot_ID number(10)  primary key,
                           Spot_Type varchar2(20) check(spot_type in('small','large','medium')),
                           Space_ID number(10),
                           foreign key(space_id) references parking_space(space_id)
                          )
desc Parking_Spot


/* Table 4: Manager2*/
create table Manager2( MGR_ID number(10)  primary key,
                   Name Varchar2(30),
                   Salary number(30) not null,
                   Phone_Number number(10) not null,
                   Role varchar2(30),
                   space_id number(10),
                   foreign key(space_id) references parking_space(space_id)
                    )
desc manager2


/* Table 5: PARKING_SLIP*/
create table Parking_Slip(Slip_ID number(10)  primary key,
                          type Varchar2(50) check(type in('small','large','medium')),
                          Duration number(20) not null,
                          Issue_date date
              
                          )

desc Parking_Slip

/*Table 6: PARKING_SPOT2*/
create table Parking_Spot2(Spot_ID number(10)  primary key,
                           Spot_Type varchar2(20) check(spot_type in('small','large','medium')),
                           slip_id number(10),
                           foreign key(slip_id) references parking_slip(slip_id)
                          )
desc Parking_Spot2


/* Table 7: DRIVER*/
create table Driver(Dri_ID number(10)  primary key,
                   dri_First_name Varchar2(50),
                   dri_Last_name Varchar2(50),
                   dri_Phone_Num number(11) unique,
                   dri_Email varchar2(50) unique,
                   dri_address varchar2(50)
                    )
desc Driver


/* Table 8: PARKING_SLIP2*/
create table Parking_Slip2(Slip_ID number(10)  primary key,
                          type Varchar2(50) check(type in('small','large','medium')),
                          Duration number(20) not null,
                          Issue_date date,
                          dri_id number(10),
                          foreign key(dri_id) references driver(dri_id)
                           )

desc Parking_Slip2


/* Table 9: PARKING_SPOT3*/
create table Parking_Spot3(Spot_ID number(10)  primary key,
                           Spot_Type varchar2(20) check(spot_type in('small','large','medium'))
                           )
                           
desc Parking_Spot3

/* Table 10: RATE */
create table Rate( Rate_ID number(10)  primary key,
                   rate_type Varchar2(30),
                   rate_hourly_rate number(30) not null,
                   rate_day_rate number(10)
                    )

desc rate


/* Table 11: SPOT_RATE*/
create table spot_rate( Rate_ID number(10),
                        foreign key(rate_id) references rate(rate_id),
                        spot_id number(10),
                        foreign key(spot_id) references parking_spot(spot_id)
                   
               )
desc spot_rate
/* Table 12: FINE*/
create table Fine(Fine_ID number(10)  primary key,
                   Amount number(30) not null,
                   Issue_date date,
                   Paid_date date
                   
                    )
desc Fine

/*Table 13: DRIVER2_TABLE*/
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


/* Table 14: VEHICLE*/
create table Vehicle(Veh_Nameplate number(10)  primary key,
                           Type varchar2(20) not null
                           
                          )
desc Vehicle

/*Table 15: DRIVER3*/
create table Driver3(Dri_ID number(10)  primary key,
                   dri_First_name Varchar2(50),
                   dri_Last_name Varchar2(50),
                   dri_Phone_Num number(11) unique,
                   dri_Email varchar2(50) unique,
                   dri_address varchar2(50),
                   veh_nameplate number(10),
                   foreign key(veh_nameplate) references vehicle(veh_nameplate)
                    )
desc Driver3

/* Table 16: VEHICLE_TABLE2*/
create table Vehicle2(Veh_Nameplate number(10)  primary key,
                     Type varchar2(20) not null,
                     spot_id number(10),
                     foreign key(spot_id) references parking_spot(spot_id)
                          )
desc Vehicle2

/* Table 17: FINE2*/
create table Fine2(Fine_ID number(10)  primary key,
                   Amount number(30) not null,
                   Issue_date date,
                   Paid_date date,
                   MGR_ID number(10),
                   foreign key(mgr_id) references manager(mgr_id)
                    )
desc Fine2

/* Table 18: OWNER*/
create table Owner( Owner_ID number(10)  primary key,
                   Name Varchar2(30),       
                   Phone_Number number(10) Unique not null,
                   MGR_ID number(10) not null,
                   foreign key(MGR_ID) references manager (MGR_ID)
            
                    )
desc owner

