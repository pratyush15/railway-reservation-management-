drop table Uuser cascade constraints;
drop table Passenger cascade constraints;
drop table Train_status cascade constraints;
drop table Train cascade constraints;
drop table Station cascade constraints;
drop table Route cascade constraints;
drop table Booked_seats cascade constraints;
drop table is_having cascade constraints;

create table Uuser
(
  username varchar(40),
  userpassword char(4),
  userid char(7) primary key,
  userstid int,
  userdate date
);

create table Passenger
(
  Fname varchar(20),
  Lname varchar(20),
  PNR char(10) primary key,
  Seatnum int,
  coach char(4),
  res_status varchar(30),
  Sex char,
  Phonenum char(10),
  Pdate date,
  Pstid int,
  Email varchar(30)
);

create table Train_status
(
  waiting_seats int,
  avail_seats int,
  Statusid int primary key,
  booked_seats int,
  cancelled_seats int,
  trainno int
);

create table Train
(
  Trainnum int primary key,
  Train_name varchar(50),
  Train_type varchar(20),
  class_avail int,
  Ssid char(3)
);

create table Station
(
   Station_id char(3) primary key,
   Stopno int,
   Dept_time varchar(10),
   Stname varchar(40),
   Arr_time varchar(10),
   Dep_station varchar(40)
);

create table Route
(
   Trainnumb int primary key,
   Rzone varchar(40),
   Rstatus varchar(40)
);

create table Booked_seats
(
   Bno int primary key,
   PPNR char(10) references Passenger(PNR),
   useruid char(7) references Uuser(userid)
);

create table is_having
(
   stid char(3),
   tnu int,
   primary key(stid,tnu),
   foreign key(stid) references Station(Station_id),
   foreign key(tnu) references Route(Trainnumb)
);
alter table UUSER add constraint fkst foreign key(Userstid)references Train_status(Statusid);
alter table Passenger add constraint fkid foreign key(Pstid)references Train_status(Statusid);
alter table Train_status add constraint fkno foreign key(trainno)references Train(Trainnum);
alter table Train add constraint fksd foreign key(Ssid)references Station(Station_id);
alter table Route add constraint fknum foreign key(Trainnumb)references Train(Trainnum);

insert into Station values('UBL',2,'09:34','Hubballi Jn','09:25','Gadag Jn');
insert into Station values('DWD',1,'08:40','Dharwad','08:30','Londa Jn');
insert into Station values('BDT',5,'12:25','Bandra Terminus','12:15','Amritsar Jn');
insert into Station values('PUN',4,'15:30','Pune Jn','15:10','Hazrat Nizamuddin');
insert into Station values('HWR',6,'12:56','Howrah Jn','12:30','Vasco-da-gama');
insert into Station values('DDR',4,'16:15','Dadar','16:00','Tiruneveli');
insert into Station values('BHU',6,'19:45','Bhubaneshwar','19:20','Dhanbad Jn');
insert into Station values('YPR',8,'10:16','Yesvantpur Jn','10:00','Barmer Jn');
insert into Station values('DHN',3,'09:12','Dehradun','08:59','Howrah Jn');
insert into Station values('JPR',6,'02:18','Jaipur','01:56','Mumbai Central');
insert into Station values('BKN',7,'17:56','Bikaner Jn','17:34','Bandra Terminus');
insert into Station values('VRN',1,'22:40','Varanasi Jn','22:20','Gwalior');
insert into Station values('SCN',5,'15:40','Secunderabad Jn','15:25','Hubballi Jn');
insert into Station values('NWD',9,'19:20','New Delhi','19:05','Jammu Tawi');
insert into Station values('JMT',6,'18:15','Jammu Tawi','18:00','Pune Jn');
insert into Station values('AMD',4,'05:16','Ahmedabad Jn','05:00','Mumbai Central');
insert into Station values('MYS',6,'23:10','Mysore','22:44','Dadar');
insert into Station values('PUR',3,'18:00','Puri','17:44','Haridwar');
insert into Station values('HNZ',6,'14:15','Hazrat Nizamuddin','08:59','Ahmedabad Jn');
insert into Station values('BLC',9,'07:17','Bangalore Cy Jn','06:50','Guwahati');
insert into Station values('CSM',2,'10:40','C.Shahumaharaj Terminus','10:20','Tirupati');
insert into Station values('LTT',1,'18:09','Lokmanya Tilak Terminus','17:46','Hubballi Jn');
insert into Station values('AND',5,'11:10','Anand Vihar Terminus','10:47','Jammu Tawi');
insert into Station values('GDB',4,'14:20','Gandhidham Bg','14:10','Kamakhya');
insert into Station values('GNT',1,'12:00','Guntur Jn','11:45','Kacheguda');
insert into Station values('KCG',4,'17:08','Kacheguda','16:50','Madurai Jn');
insert into Station values('KCH',5,'19:25','Kochuveli','19:10','Lokmanya Tilak Terminus');
insert into Station values('KOL',8,'10:20','Kolkata Jn','10:00','Patna Jn');
insert into Station values('BHJ',3,'13:09','Bhuj','12:49','Bandra Terminus');
insert into Station values('BHP',3,'02:25','Bhopal Jn','01:59','Lucknow Jn');
insert into Station values('UDP',4,'17:20','Udaipur City','17:02','Hazrat Nizamuddin');
insert into Station values('MRJ',1,'12:15','Miraj Jn','11:56','Hubli Jn');
insert into Station values('IND',2,'14:09','Indore Jn','13:50','Mumbai Central');
insert into Station values('AJM',3,'19:25','Ajmer Jn','19:05','Bangalore Cy Jn');
insert into Station values('VJW',1,'15:00','Vijaywada Jn','14:46','Secunderabad Jn');
insert into Station values('PBN',4,'05:16','Porbandar','05:10','Mumbai Central');
insert into Station values('SRT',3,'23:15','Surat','22:56','Ajmer Jn');
insert into Station values('CNB',5,'18:20','Kanpur Central','18:09','Valsad Jn');
insert into Station values('ALH',2,'23:09','Allahabad Jn','22:50','Chandigarh');
insert into Station values('SLD',5,'07:00','Sealdah Jn','06:48','New Delhi');

insert into Train values(12925,'Paschim express','Superfast',3,'BDT');
insert into Train values(12493,'Darshan express','Superfast',1,'PUN');
insert into Train values(18048,'Amravati express','Superfast',3,'HWR');
insert into Train values(22629,'Chalukya express','Superfast',2,'DDR');
insert into Train values(12832,'Garibrath express','Superfast',1,'BHU');
insert into Train values(14805,'Barmer AC express','Superfast',1,'YPR');
insert into Train values(13010,'Doon express','Superfast',3,'DHN');
insert into Train values(12240,'Duronto express','Superfast',1,'JPR');
insert into Train values(22473,'Ranakpur express','Superfast',3,'BKN');
insert into Train values(17320,'Secunderabad express','Superfast',2,'SCN');
insert into Train values(12425,'Rajdhani express','Superfast',1,'NWD');
insert into Train values(11078,'Jhelum express','Superfast',3,'JMT');
insert into Train values(12009,'Shatabdi express','Superfast',1,'AMD');
insert into Train values(11036,'Sharavati express','Superfast',2,'MYS');
insert into Train values(18477,'Utkal express','Superfast',3,'PUR');
insert into Train values(72916,'Ashram express','Superfast',2,'HNZ');
insert into Train values(17415,'Haripriya express','Superfast',2,'CSM');
insert into Train values(77320,'LTT Hubballi express','Superfast',3,'LTT');
insert into Train values(15667,'Kamakhya express','Superfast',3,'GDB');
insert into Train values(17615,'Kacheguda express','Superfast',2,'KCG');
insert into Train values(13131,'Kolkata express','Superfast',3,'KOL');
insert into Train values(89456,'Kutch express','Superfast',3,'BHJ');
insert into Train values(12964,'Mewar express','Superfast',2,'UDP');
insert into Train values(51419,'Miraj Hubli Passenger express','Passenger',1,'MRJ');
insert into Train values(16531,'Garib Nawaj express','Superfast',3,'AJM');
insert into Train values(12713,'Satavahana express','Superfast',2,'VJW');
insert into Train values(19216,'Saurashtra express','Superfast',3,'PBN');
insert into Train values(62216,'Ajmer express','Superfast',3,'SRT');
insert into Train values(14217,'Prayagraj express','Superfast',3,'ALH');
insert into Train values(12313,'Rajdhani express','Superfast',1,'SLD');
insert into Train values(87337,'Hubli Gadag Passenger express','Passenger',1,'UBL');
insert into Train values(22211,'Dharwad Passenger express','Passenger',1,'DWD');

insert into Route values(12925,'Western Railway','Broad gauge');
insert into Route values(12493,'Konkan Railway','Narrow gauge');
insert into Route values(18048,'Eastern Railway','Broad gauge');
insert into Route values(22629,'Central Railway','Broad gauge');
insert into Route values(12832,'East Coast Railway','Broad gauge');
insert into Route values(14805,'South Western Railway','Broad gauge');
insert into Route values(13010,'Northern Railway','Narrow gauge');
insert into Route values(12240,'North Western Railway','Broad gauge');
insert into Route values(22473,'North Western Railway','Broad gauge');
insert into Route values(17320,'South Central Railway','Broad gauge');
insert into Route values(12425,'Northern Railway','Broad gauge');
insert into Route values(11078,'Northern Railway','Narrow gauge');
insert into Route values(12009,'Western Railway','Broad gauge');
insert into Route values(11036,'South Western Railway','Broad gauge');
insert into Route values(18477,'East Coast Railway','Broad gauge');
insert into Route values(72916,'Northern Railway','Broad gauge');
insert into Route values(17415,'South Western Railway','Narrow gauge');
insert into Route values(77320,'Central Railway','Broad gauge');
insert into Route values(15667,'Eastern Railway','Narrow gauge');
insert into Route values(17615,'Southern Railway','Broad gauge');
insert into Route values(13131,'South Eastern Railway','Broad gauge');
insert into Route values(89456,'Western Railway','Broad gauge');
insert into Route values(12964,'North Western Railway','Broad gauge');
insert into Route values(51419,'South Western Railway','Broad gauge');
insert into Route values(16531,'North Western Railway','Broad gauge');
insert into Route values(12713,'South Western Railway','Broad gauge');
insert into Route values(19216,'Western Railway','Broad gauge');
insert into Route values(62216,'North Western Railway','Broad gauge');
insert into Route values(14217,'North Central Railway','Broad gauge');
insert into Route values(12313,'South Eastern Railway','Broad gauge');
insert into Route values(87337,'South Western Railway','Broad gauge');
insert into Route values(22211,'South Western Railway','Broad gauge');

insert into is_having values('BDT',12925);
insert into is_having values('PUN',12493);
insert into is_having values('HWR',18048);
insert into is_having values('DDR',22629);
insert into is_having values('BHU',12832);
insert into is_having values('YPR',14805);
insert into is_having values('DHN',13010);
insert into is_having values('JPR',12240);
insert into is_having values('BKN',22473);
insert into is_having values('SCN',17320);
insert into is_having values('NWD',12425);
insert into is_having values('JMT',11078);
insert into is_having values('AMD',12009);
insert into is_having values('MYS',11036);
insert into is_having values('PUR',18477);
insert into is_having values('HNZ',72916);
insert into is_having values('CSM',17415);
insert into is_having values('LTT',77320);
insert into is_having values('GDB',15667);
insert into is_having values('KCG',17615);
insert into is_having values('KOL',13131);
insert into is_having values('BHJ',89456);
insert into is_having values('UDP',12964);
insert into is_having values('MRJ',51419);
insert into is_having values('AJM',16531);
insert into is_having values('VJW',12713);
insert into is_having values('PBN',19216);
insert into is_having values('SRT',62216);
insert into is_having values('ALH',14217);
insert into is_having values('SLD',12313);
insert into is_having values('UBL',87337);
insert into is_having values('DWD',22211);

insert into Train_status values(4,14,101,23,3,12925);
insert into Train_status values(2,15,102,26,1,12493);
insert into Train_status values(2,17,103,21,4,18048);
insert into Train_status values(3,15,104,23,3,22629);
insert into Train_status values(1,18,105,22,3,12832);
insert into Train_status values(2,17,106,21,4,14805);
insert into Train_status values(3,16,107,20,5,13010);
insert into Train_status values(2,17,108,21,4,12240);
insert into Train_status values(2,15,109,23,4,22473);
insert into Train_status values(3,18,110,21,2,17320);
insert into Train_status values(1,16,111,22,5,12425);
insert into Train_status values(2,17,112,23,2,11078);
insert into Train_status values(3,14,113,24,3,12009);
insert into Train_status values(2,15,114,22,5,11036);
insert into Train_status values(3,18,115,21,2,18477);
insert into Train_status values(4,14,116,23,3,72916);
insert into Train_status values(2,15,117,26,1,17415);
insert into Train_status values(2,17,118,21,4,77320);
insert into Train_status values(3,15,119,23,3,15667);
insert into Train_status values(1,18,120,22,3,17615);
insert into Train_status values(2,17,121,21,4,13131);
insert into Train_status values(3,16,122,20,5,89456);
insert into Train_status values(2,17,123,21,4,12964);
insert into Train_status values(2,15,124,23,4,51419);
insert into Train_status values(3,18,125,21,2,16531);
insert into Train_status values(1,16,126,22,5,12713);
insert into Train_status values(2,17,127,23,2,19216);
insert into Train_status values(3,14,128,24,3,62216);
insert into Train_status values(2,15,129,22,5,14217);
insert into Train_status values(3,18,130,21,2,12313);
insert into Train_status values(2,17,131,22,3,87337);
insert into Train_status values(1,16,132,27,0,22211);

insert into Uuser values('Suresh Singh','susi','Sur1011',102,'12-dec-2020');
insert into Uuser values('Gaurav Sharma','gaur','Gau1012',104,'23-sep-2020');
insert into Uuser values('Shanti Kumari','shan','Sha1013',102,'20-oct-2020');
insert into Uuser values('Rohan Patil','roha','Roh1014',102,'12-apr-2021');
insert into Uuser values('Rakesh Pawar','rake','Rak1015',104,'13-nov-2020');
insert into Uuser values('Mahesh Kumar','mahe','Mah1016',104,'17-dec-2020');
insert into Uuser values('Manoj Bhatt','mano','Man1017',102,'18-oct-2020');
insert into Uuser values('Santosh Badiger','sant','San1018',102,'19-nov-2020');
insert into Uuser values('Sanjay Patil','sanj','San1019',107,'24-apr-2021');
insert into Uuser values('Akshay Rao','aksh','Aks1020',107,'20-sep-2020');
insert into Uuser values('Vardhan Singh','vard','Var1021',107,'11-jan-2021');
insert into Uuser values('Kishor Pandey','kish','Kis1022',107,'15-may-2021');
insert into Uuser values('Kartik Kumar','kart','Kar1023',107,'18-sep-2020');
insert into Uuser values('Kailash Patel','kail','Kai1024',107,'15-aug-2020');
insert into Uuser values('Samarth Hiremath','sama','Sam1025',119,'12-feb-2021');
insert into Uuser values('Hrithik Kumar','Hrit','Hri1026',119,'28-april-2021');
insert into Uuser values('Sambhav Rathod','Samb','Sha1027',119,'21-sep-2020');
insert into Uuser values('Rohan Sharma','roha','Roh1028',119,'12-apr-2021');
insert into Uuser values('Sumanth Hegade','suma','Sum1029',120,'13-mar-2021');
insert into Uuser values('Roshan Hegade','rosh','Ros1030',120,'17-dec-2020');
insert into Uuser values('Sadashiv Pawar','sada','Sad1031',120,'18-oct-2020');
insert into Uuser values('Ram Lokhande','ram','Ram1032',120,'19-nov-2020');
insert into Uuser values('Raju Kumar','raju','Raj1033',120,'24-apr-2021');
insert into Uuser values('Venkatesh Kulkarni','venk','Ven1034',120,'20-sep-2020');
insert into Uuser values('Vijay Mallik','vija','Vij1035',120,'11-jan-2021');
insert into Uuser values('Sharda Kanitkar','shar','Sha1036',120,'15-may-2021');
insert into Uuser values('Karan Singh','kara','Kar1037',120,'18-sep-2020');
insert into Uuser values('Deep Pandey','deep','Dee1038',120,'15-aug-2020');

update Uuser set userdate='11-aug-2020' where userid='Raj1033';
update Uuser set userdate='12-may-2021' where userid='Ram1032';
update Uuser set userdate='21-jan-2021' where userid='Kar1037';
update Uuser set userdate='22-feb-2021' where userid='Dee1038';
update Uuser set userdate='13-dec-2020' where userid='Sha1036';
update Uuser set userdate='21-nov-2020' where userid='Sha1027';
update Uuser set userdate='18-mar-2021' where userid='Sur1011';
update Uuser set userdate='15-sep-2020' where userid='Sha1013';
insert into Passenger values('Harsh','Kumar','8602110100',24,'B2','Confirmed','M','8908765432',
'15-sep-2020',102,'harsh16@gmail.com');
insert into Passenger values('Shravan','Sharma','8602110102',22,'B1','Confirmed','M','9987656789',
'23-sep-2020',104,'shrav22@gmail.com');
insert into Passenger values('Aman','Kulkarni','8602110103',21,'S1','Waiting','M','6778765432',
'12-apr-2021',102,'aman12@gmail.com');
insert into Passenger values('Raj','Rastogi','8602110104',20,'S2','Confirmed','M','9008765432',
'13-nov-2020',104,'rajrastogi12@gmail.com');
insert into Passenger values('Roshan','Vernekar','8602110105',12,'B1','Confirmed','M','890898541',
'15-sep-2020',102,'harsh16@gmail.com');
insert into Passenger values('Shantilal','Suman','8602110106',26,'S2','Confirmed','M','9987656764',
'23-sep-2020',107,'shantilal@gmail.com');
insert into Passenger values('Malvika','Joshi','8602110107',2,'B1','Confirmed','F','6778765123',
'12-apr-2021',102,'joshimalvika@gmail.com');
insert into Passenger values('Manav','Awasthi','8602110108',4,'B2','Confirmed','M','9987890654',
'13-nov-2020',104,'manavawasthi@gmail.com');
insert into Passenger values('Rahul','Banerjee','8602110109',44,'B2','Confirmed','M','8909090900',
'15-sep-2020',102,'harsh16@gmail.com');
insert into Passenger values('Muskan','Sharma','8602110110',14,'S2','Confirmed','F','7768900007',
'23-sep-2020',104,'muskan@gmail.com');
insert into Passenger values('Manoj','Pawar','8602110111',17,'B1','Confirmed','M','6778765999',
'12-apr-2021',102,'joshimalvika@gmail.com');
insert into Passenger values('Pankaj','Rawat','8602110112',19,'B2','Confirmed','M','9987890233',
'13-nov-2020',104,'pankajk@gmail.com');
update Passenger set Pstid=107 where PNR='8602110109';
update Passenger set Pstid=107 where PNR='8602110110';
update Passenger set Pstid=119 where PNR='8602110111';
update Passenger set Pstid=120 where PNR='8602110112';

insert into Booked_seats values(1,'8602110100','Sur1011');
insert into Booked_seats values(2,'8602110102','Gau1012');
insert into Booked_seats values(3,'8602110103','Roh1014');
insert into Booked_seats values(4,'8602110104','Rak1015');
insert into Booked_seats values(5,'8602110105','Man1017');
insert into Booked_seats values(6,'8602110108','Mah1016');
insert into Booked_seats values(7,'8602110109','San1019');
insert into Booked_seats values(8,'8602110111','Roh1028');
insert into Booked_seats values(9,'8602110112','Dee1038');
insert into Booked_seats values(10,'8602110106','Aks1020');

Select * from Station;
Select * from Train;
Select * from Route;
Select * from is_having;
Select * from Train_status;
Select * from Uuser;
Select * from Passenger;
select * from Booked_seats;

/*Simple Queries*/
/*Retreieve passenger names who have booked trains in the train doon express*/

Select Fname,Lname
from Passenger,Train_status,Train
where Pstid=Statusid and trainno=Trainnum and Train_name
like '%Doon express%';

/*Retreive the Train names which have route lying in northern railway zone*/

Select Train_name 
from Train,Route
where Trainnumb=Trainnum and Rzone like '%Northern Railway%';

/*Retreive users information who booked their seats in the Train which is
  departing to the station Madurai*/
  
Select username,userpassword,userid
from Uuser,Train,Train_status,Station
where userstid=Statusid and trainno=Trainnum
and Ssid=Station_id and Dep_station like '%Madurai Jn%';

/*Retrieve Stationname with stopnumber as 6*/
Select Stname
from Station
where Stopno=6;

/*Retreive all the users and passengers who have booked their seats in a train with
  waiting seats of 2*/
  
  Select distinct Username,Fname
  from Uuser,Passenger,Train_status,Train
  where userstid=Statusid and Pstid=Statusid and Trainnum=trainno
  and waiting_seats=2;
  
/*Retreive all the female passenger details*/

 Select *
 from Passenger
 where Sex='F';

/*Aggregate functions*/
/*Retreive all the passenger name and gender having maximum number of waiting seats greater than 2
  in the train they are travelling*/
  Select Fname,Lname,Sex
  from Passenger,Train_status
  where Pstid=Statusid
  having max(waiting_seats)>2
  group by Fname,Lname,Sex;
  
  /*Retreive passenger details having sum of booked seats less than 23 in the train
    they are going*/
    
    Select Fname,Lname,Sex
    from Passenger,Train_status
    where Pstid=Statusid
    having sum(booked_seats)<23
    group by Fname,Lname,Sex;
  
  /*Retreive the total number of Stations along with their names having 
    stop number greater than 3*/
    
   Select count(*),Stname
   from Station
   where Stopno>3
   group by Stname;
   
  /*Retreive the average,sum,count,minimum and maximum number of available
    seats in superfast trains*/
    
    Select avg(avail_seats),sum(avail_seats),count(avail_seats),
    min(avail_seats),max(avail_seats)
    from Train,Train_Status
    where Trainnum=trainno and Train_type like '%Superfast%';
 
  /*Retreive minimum and maximum number of cancelled seats in the train having 3
    class availabilities*/
    
    Select min(cancelled_seats),max(cancelled_seats)
    from Train,Train_status
    where Trainnum=trainno and class_avail=3;
    
  /*Set operations*/
  /*Retreive the train names booked either by a passenger or a user in the month of
    november*/
    
   (Select distinct Train_name
    from Train,Train_status,Passenger
    where Trainnum=trainno and Pstid=Statusid and 
    Pdate like '__-11-__')
    UNION
   (Select distinct Train_name
    from Train,Train_status,Uuser
    where Trainnum=trainno and userstid=Statusid and 
    userdate like '__-11-__');
    
  /*Retrieve train name and train type which are booked by both passengers and
    users in the month of november*/
    
   (Select distinct Train_name,Train_type
    from Train,Train_status,Passenger
    where Trainnum=trainno and Pstid=Statusid and 
    Pdate like '__-11-__')
    INTERSECT
   (Select distinct Train_name,Train_type
    from Train,Train_status,Uuser
    where Trainnum=trainno and userstid=Statusid and 
    userdate like '__-11-__');
    
  /*Retreive the train names booked by passengers in the month of november but
    not users in the month of november*/
    
   (Select distinct Train_name
    from Train,Train_status,Passenger
    where Trainnum=trainno and Pstid=Statusid and 
    Pdate like '__-11-__')
    MINUS
   (Select distinct Train_name
    from Train,Train_status,Uuser
    where Trainnum=trainno and userstid=Statusid and 
    userdate like '__-11-__');
    
  /*Retreive train name and train number booked by either passengers or users
    in the month of September*/
    
   (Select distinct Train_name,Trainnum
    from Train,Train_status,Passenger
    where Trainnum=trainno and Pstid=Statusid and 
    Pdate like '__-09-__')
    UNION
   (Select distinct Train_name,Trainnum
    from Train,Train_status,Uuser
    where Trainnum=trainno and userstid=Statusid and 
    userdate like '__-09-__');
    
  /*Retreive train name ,class availabilty and train number booked by 
    users in the month of October but not passengers in october*/ 
    
   (Select distinct Train_name,class_avail,Trainnum
    from Train,Train_status,Uuser
    where Trainnum=trainno and userstid=Statusid and 
    userdate like '__-10-__')
    MINUS
   (Select distinct Train_name,class_avail,Trainnum
    from Train,Train_status,Passenger
    where Trainnum=trainno and pstid=Statusid and 
    Pdate like '__-10-__');
    
  /*Nested Queries*/
  /*Retreive the passenger names who travel in a train with at most 3 waiting seats*/
    
    Select Fname,Lname
    from Passenger
    where exists(Select * from Train_status
                 where Pstid=Statusid
                 and waiting_seats<=3);
                 
  /*Retreive train names which are travelling by the routes with at least 1 South
    western railway zone*/
    
    Select Train_name
    from Train
    where exists(Select * from Route
                 where Trainnumb=Trainnum
                 and Rzone like '%South Western Railway%'
                 having count(Rzone)>=1);
   
  /*Retreive train names and their numbers in which 1 or more female passengers
    travel*/
    
    Select Train_name,Trainnum
    from Train
    where exists(Select * from Train_status
                 where trainno=Trainnum
                 and exists(Select * from Passenger
                            where Statusid=Pstid
                            and Sex='F'
                            having count(Sex)>=1));
                            
  /*Retreive username and his booking date who travels in a train with atmost
    15 available seats*/
    
   Select username,userdate
   from  Uuser
   where exists(Select * from Train_status
                where userstid=Statusid
                and avail_seats<=15);
  
  /*Concept of views*/             
  /*Create a view for the passengers travelling in Darshan Express*/
  
   Create view PAS
   As Select Fname,Lname,Sex
      from Passenger,Train_status,Train
      where Pstid=Statusid and trainno=Trainnum and
      Train_name like '%Darshan express%';
      Select Fname,Lname,Sex from PAS;
   Drop view PAS cascade constraints;
      
  /*Create a view for the trains travelling through Northern Railway*/
  
   Create view TRA
   As Select Train_name,Trainnum
      from Train,Route
      where Trainnum=Trainnumb and Rzone like '%Northern Railway%';
   Select Train_name,Trainnum from TRA;
   DROP view TRA cascade constraints;
   
  /*Create a view for the users travelling in train which is going from Pune*/
    
   CREATE view USERN
   AS Select username,userdate
      from Uuser,Train_status,Train,Station
      where userstid=Statusid and Trainnum=trainno
      and Station_id=Ssid and Stname like '%Pune%';
   Select username,userdate from USERN;
   DROP view USERN cascade constraints;
   
  /*Create a view for the stations*/
  
  CREATE View STATIO
  AS Select * from Station;
  Select * from STATIO;
  DROP view STATIO cascade constraints;
