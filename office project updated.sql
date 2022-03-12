-- drop database if exists office
-- GO
if not exists(select * from sys.databases where name='office')
create database office
GO

use office
Go

-- DOWN
if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where Constraint_Name = 'fk_bookings_booking_employee_id')
    alter table bookings drop constraint fk_bookings_booking_employee_id
if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where Constraint_Name = 'fk_bookings_booking_meetingroom_id')
    alter table bookings drop constraint fk_bookings_booking_meetingroom_id
drop table if exists bookings

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where Constraint_Name = 'fk_meetingrooms_meetingroom_building_code')
    alter table meetingrooms drop constraint fk_meetingrooms_meetingroom_building_code
drop table if exists meetingrooms

drop table if exists buildings

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where Constraint_Name = 'fk_employees_employee_department_id')
    alter table employees drop constraint fk_employees_employee_department_id
drop table if exists employees

drop table if exists departments


-- UP

create table departments (
    department_id int identity not null,
    department_name varchar(50) not null,
    constraint pk_departments_department_id primary key (department_id),
)


create table employees (
    employee_id int identity not null,
    employee_firstname varchar(50) not null,
    employee_lastname varchar(50) not null,
    employee_email varchar(50) not null,
    employee_number numeric(10) null,
    employee_department_id int not null,
    constraint pk_employees_employee_id primary key (employee_id),
    constraint u_employees_employee_email unique (employee_email),
    constraint u_employees_employee_number unique (employee_number),
)
GO

alter table employees 
    add constraint fk_employees_employee_department_id foreign key (employee_department_id) 
    references departments(department_id)
GO

create table buildings (
    building_id int identity not null,
    building_code varchar(50) not null,
    building_city varchar(50) not null,
    building_state varchar(50) not null
    constraint pk_buildings_building_id primary key (building_id),
    constraint u_buildings_building_code unique (building_code)
)
GO

create table meetingrooms (
    meetingroom_id int identity not null,
    meetingroom_capacity int not null,
    meetingroom_available char(1) not null,
    meetingroom_equipment varchar(50) null,
    meetingroom_building_code varchar(50) not null,
    constraint pk_meetingrooms_meetingroom_id primary key (meetingroom_id),
)
GO

alter table meetingrooms
    add constraint fk_meetingrooms_meetingroom_building_code foreign key (meetingroom_building_code) 
    references buildings(building_code)
GO

create table bookings (
    booking_id int identity not null,
    booking_date date not null,
    booking_starttime time not null,
    booking_endtime time not null,
    booking_employee_id int not null,
    booking_meetingroom_id int not null,
    constraint pk_bookings_booking_id primary key (booking_id),
)
GO

alter table bookings 
    add constraint fk_bookings_booking_employee_id foreign key (booking_employee_id) 
    references employees(employee_id)
GO

alter table bookings 
    add constraint fk_bookings_booking_meetingroom_id foreign key (booking_meetingroom_id) 
    references meetingrooms(meetingroom_id)
GO

--UP DATA
insert into departments (department_name) VALUES
    ('Sales'),('Marketing'),('Finance'),('HR'),('R&D')

BEGIN
BEGIN TRY
    BEGIN TRANSACTION

        Insert into employees values ('Lanette','Presman','lpresman0@baidu.com',9733888212,2)
        Insert into employees values ('Dolph','Frere','dfrere1@sourceforge.net',3852140023,5)
        Insert into employees values ('Conrade','Bachelor','cbachelor2@cpanel.net',7624389531,3)
        Insert into employees values ('Hildy','Louca','hlouca3@weebly.com',6287691532,5)
        Insert into employees values ('Forester','Bolduc','fbolduc4@geocities.jp',9502800927,2)
        Insert into employees values ('Virgilio','Sneesbie','vsneesbie5@tuttocitta.it',1138203357,2)
        Insert into employees values ('Marylou','McGurn','mmcgurn6@photobucket.com',4112016426,5)
        Insert into employees values ('Karisa','De Francesco','kdefrancesco7@hud.gov',8211034045,2)
        Insert into employees values ('Jany','Jacson','jjacson8@1und1.de',6265285679,2)
        Insert into employees values ('Hi','Wethered','hwethered9@comsenz.com',1414550360,2)
        Insert into employees values ('Armin','MacKill','amackilla@jigsy.com',4349564534,4)
        Insert into employees values ('Clarance','Ollerhead','collerheadb@seesaa.net',2028597101,5)
        Insert into employees values ('Victor','Onion','vonionc@blogger.com',3483859126,5)
        Insert into employees values ('Heidi','Maleby','hmalebyd@sun.com',5298423653,2)
        Insert into employees values ('Estrellita','Goldthorpe','egoldthorpee@g.co',1619318766,1)
        Insert into employees values ('Giffer','Powdrell','gpowdrellf@weebly.com',7929827614,1)
        Insert into employees values ('Sigismond','Tagg','staggg@squidoo.com',6844760467,5)
        Insert into employees values ('Daisey','Worsham','dworshamh@bizjournals.com',2835853909,4)
        Insert into employees values ('Bank','Simkins','bsimkinsi@slashdot.org',7016610627,2)
        Insert into employees values ('Rafael','Manueau','rmanueauj@aol.com',9455730941,4)
        Insert into employees values ('Sari','Chidwick','schidwickk@feedburner.com',3943757453,4)
        Insert into employees values ('Jilli','Danell','jdanelll@privacy.gov.au',6853400028,5)
        Insert into employees values ('Margit','Pilling','mpillingm@1und1.de',7197552066,1)
        Insert into employees values ('Angy','Howship','ahowshipn@washington.edu',4959334431,5)
        Insert into employees values ('Alex','Widdecombe','awiddecombeo@cisco.com',9972291154,1)
        Insert into employees values ('Rahal','Kobu','rkobup@icio.us',4903028132,4)
        Insert into employees values ('Hendrika','Lumsdale','hlumsdaleq@soup.io',3221630930,5)
        Insert into employees values ('Corinne','Pettie','cpettier@ox.ac.uk',3087974236,2)
        Insert into employees values ('Janaye','Drewet','jdrewets@surveymonkey.com',4667964020,5)
        Insert into employees values ('Theadora','Brettor','tbrettort@unblog.fr',6815000606,5)
        Insert into employees values ('Alfred','Hance','ahanceu@tamu.edu',1003705298,4)
        Insert into employees values ('Dyana','Stenners','dstennersv@tinypic.com',2762243563,3)
        Insert into employees values ('Evelin','Bennough','ebennoughw@weather.com',7912330681,1)
        Insert into employees values ('Gayelord','Simak','gsimakx@eepurl.com',4271526241,2)
        Insert into employees values ('Tarrah','Ballister','tballistery@noaa.gov',6161303046,3)
        Insert into employees values ('Creigh','Tatham','ctathamz@miitbeian.gov.cn',4523529607,2)
        Insert into employees values ('Westbrooke','Schult','wschult10@statcounter.com',7436436265,2)
        Insert into employees values ('Jodee','Snedden','jsnedden11@chronoengine.com',9714596799,3)
        Insert into employees values ('Marney','Edwardes','medwardes12@printfriendly.com',1847678778,4)
        Insert into employees values ('Hetty','Tabourier','htabourier13@weebly.com',5053058315,1)
        Insert into employees values ('Carl','Barttrum','cbarttrum14@bravesites.com',3782964287,5)
        Insert into employees values ('Vail','Evelyn','vevelyn15@forbes.com',8052286678,5)
        Insert into employees values ('Rolland','Rickertsen','rrickertsen16@time.com',2934091239,5)
        Insert into employees values ('Obed','Fletham','ofletham17@behance.net',9913541089,5)
        Insert into employees values ('Sigvard','Scotting','sscotting18@naver.com',3966419689,4)
        Insert into employees values ('Aharon','Dellatorre','adellatorre19@webnode.com',8469998692,5)
        Insert into employees values ('Valentine','Ghidoni','vghidoni1a@feedburner.com',1332411327,1)
        Insert into employees values ('Leslie','Watson-Brown','lwatsonbrown1b@mtv.com',2456908324,5)
        Insert into employees values ('Damaris','Ritchman','dritchman1c@usa.gov',1373959809,5)
        Insert into employees values ('Dalila','Franklen','dfranklen1d@bizjournals.com',1241204345,4)

    COMMIT
END TRY
BEGIN CATCH
    ROLLBACK ;
    THROW
END CATCH
END

BEGIN
BEGIN TRY
    BEGIN TRANSACTION

insert into buildings(building_code,building_city,building_state) VALUES
    ('A1','New York','NY'),
    ('A2','New York','NY'),
    ('A3','New York','NY'),
    ('B1','New York','NY'),
    ('B2','New York','NY'),
    ('B3','New York','NY'),
    ('B4','New York','NY')

    COMMIT
END TRY
BEGIN CATCH
    ROLLBACK ;
    THROW
END CATCH
END


BEGIN
BEGIN TRY
    BEGIN TRANSACTION

insert into meetingrooms(meetingroom_capacity,meetingroom_available,meetingroom_equipment,meetingroom_building_code) VALUES
    (4,'Y','Projector','A1'),
    (5,'Y','Projector, Conference Table','A1'),
    (2,'Y','Projector','A2'),
    (10,'Y','Projector, Conference Table','A3'),
    (8,'Y','Projector, Conference Table','A3'),
    (5,'Y','Projector, Conference Table','B1'),
    (5,'Y','Projector, Conference Table','B2'),
    (10,'Y','Projector, Conference Table','B3'),
    (10,'Y','Projector, Conference Table','B3'),
    (10,'Y','Projector, Conference Table','B3'),
    (2,'Y','Projector','A2'),
    (8,'Y','Projector, Conference Table','B4'),
    (8,'Y','Projector','B4'),
    (4,'Y','Projector','B1'),
    (4,'Y','Projector, Conference Table','A1')

    COMMIT
END TRY
BEGIN CATCH
    ROLLBACK ;
    THROW
END CATCH
END

GO


-- VERIFY
select * from departments
select * from employees
select * from meetingrooms
select * from buildings
GO

--Running query

select * 
    from meetingrooms m 
    join buildings b 
    on m.meetingroom_building_code = b.building_code
    order by b.building_code

--Trigger
drop trigger if exists t_bookings_meeting_id_insert
go

create trigger t_bookings_meeting_id_insert
on bookings 
after INSERT as 
    begin
        declare @meetingroomid INT

        select @meetingroomid = inserted.booking_meetingroom_id
        from inserted

        update meetingrooms
        set meetingroom_available = 'N'
        where meetingroom_id = @meetingroomid
END

drop trigger if exists t_bookings_meeting_id_delete
go

create trigger t_bookings_meeting_id_delete
on bookings 
after DELETE as 
    begin
        declare @meetingroomid INT

        select @meetingroomid = deleted.booking_meetingroom_id
        from deleted
        PRINT(@meetingroomid)

        update meetingrooms
        set meetingroom_available = 'Y'
        where meetingroom_id = @meetingroomid
END

select * from bookings
select * from meetingrooms

--Inserting into booking
BEGIN
BEGIN TRY
    BEGIN TRANSACTION
        
        insert into bookings(booking_date,booking_starttime,booking_endtime,booking_employee_id, booking_meetingroom_id)
        VALUES
        ('2020-05-01','08:00:00','12:00:00',1,1)
        COMMIT
END TRY
BEGIN CATCH
    ROLLBACK ;
    THROW
END CATCH
END

select * from bookings
select * from meetingrooms

--Deleting from booking  NOT WORKING
--Inserting into booking
BEGIN
BEGIN TRY
    BEGIN TRANSACTION
        
        delete from bookings
        where booking_id = 7
        COMMIT
END TRY
BEGIN CATCH
    ROLLBACK ;
    THROW
END CATCH
END

select * from bookings
select * from meetingrooms