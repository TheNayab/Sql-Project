 -- .......................CREATING DATABASE HOSPITAL MANAGEMENT SYSTEM.......................

CREATE DATABASE Hospital_Management_System;

-- .......................USING DATABASE HOSPITAL MANAGEMENT SYSTEM.......................

USE HOSPITAL_MANAGEMENT_SYSTEM;
drop DATABASE HOSPITAL_MANAGEMENT_SYSTEM
use master
CREATE TABLE ADMIN
(
    Patient_id int FOREIGN KEY REFERENCES PATIENT(Patient_ID),
    Doctor_id int FOREIGN KEY REFERENCES DOCTORS(doctor_id),
    Nurse_id int FOREIGN KEY REFERENCES NURSES(Nurse_id),
    Room_id int FOREIGN KEY REFERENCES ROOM(ROOM_NO),
    Bill_id int FOREIGN KEY REFERENCES BILLS(Bill_id)
)

INSERT INTO ADMIN
VALUES(
        14, 1, 01, 001, 1
);
INSERT INTO ADMIN
VALUES(
        15, 2, 02, 002, 2
);
INSERT INTO ADMIN
VALUES(
        16, 3, 03, 003, 3
);
INSERT INTO ADMIN
VALUES(
        17, 4, 04, 004, 4
);
INSERT INTO ADMIN
VALUES(
        18, 5, 05, 005, 5
);



-- select DOCTORS.doctor_id,DOCTORS.doctor_name
-- from DOCTORS where(PATIENT.Patient_ID from PATIENT INNER JOIN ADMIN on PATIENT.Patient_id=Admin.Patient_id) INNER JOIN ADMIN on DOCTORS.doctor_id=ADMIN.Doctor_id

-- .......................CREATING TABLE DOCTORS.......................

CREATE TABLE DOCTORS
(
    doctor_id int primary key,
    doctor_password int NOT NULL,
    doctor_name varchar(50) NOT NULL,
    doctor_address varchar(50) NOT NULL ,
    doctor_mobile_no varchar(50) NOT NULL,
    doctor_age int NOT NULL ,
    doctor_qualification varchar(50) NOT NULL ,
    doctor_specilization varchar(50) NOT NULL ,
    doctor_experience_duration varchar(50) NOT NULL,
    doctor_city varchar(50) NOT NULL,
    doctor_slot1 varchar(50) NOT NULL,
    doctor_slot2 varchar(50) NOT NULL,
    doctor_slot3 varchar(50) NOT NULL,
    CHECK(doctor_password>5),
);
drop table doctors

-- ________________________________________________________________________________________________

-- >>>>>>>>>>>ROW OPERATIONS<<<<<<<<<<<<<
-- ___________________________________________________________________________________________________




-- .......................INSERTING  INTO TABLE DOCTORS.......................

INSERT INTO DOCTORS
VALUES(1, 123456, 'Mehtab Ali', 'Subhan Town Gujranwala' , '03367278570', 33, 'MBBS', 'Eye specilist', '3Years', ' Gujranwala', '11pm - 12pm', '1am - 2am', '3am - 4am');
INSERT INTO DOCTORS
VALUES(2, 123456, 'Ahmad Ali', 'Iqbal Road Lahore' , '03233423432', 43, 'BDMS', 'Lungs specilist', '2Years', ' Lahore', '1pm - 2pm', '3pm - 4pm', '5pm - 6pm' );
INSERT INTO DOCTORS
VALUES(3, 123456, 'Mukhzan Ali', 'Fawara Chock Gujrat' , '03224534345', 38, 'MBBS', 'Brain specilist', '1Years', ' Gujrat', '2am - 3am', '4am - 5am', '6am - 7am' );
INSERT INTO DOCTORS
VALUES(4, 123456, 'Tayyab Ali', 'Kachi Fatomand Gujranwala' , '03454545450', 58, 'MBBS', 'Brain specilist', '6Years', ' Gujranwala', '7am - 8am', '9am - 10am', '11am - 12am' );
INSERT INTO DOCTORS
VALUES(5, 123456, 'Sehar Safdar', 'Purana Bazar Kamoki' , '03333300247', 40, 'MBBS', 'Heart specilist', '6Years', ' Kamoki', '1pm - 2pm', '3pm - 4pm', '5pm - 6pm');

--.......................FOR UPDATING ANY DOCTORS.......................
UPDATE DOCTORS
SET doctor_id=1,doctor_password=123456,doctor_name='Nayab Ali',doctor_address='Subhan Town Gujranwala'
,doctor_mobile_no='03434343438',doctor_age=34,doctor_qualification='MBBS',doctor_specilization='Heart specilist',doctor_experience_duration='5Years',doctor_city='Gujranwala',doctor_slot1='5pm-6pm',doctor_slot2='6pm-7pm',doctor_slot3='8pm-9pm'
WHERE doctor_id=1;

-- .......................FOR DELETING ANY  DOCTORS.......................
DELETE FROM DOCTORS WHERE doctor_id=20;



-- ________________________________________________________________________________________________

-- >>>>>>>>>>>COLUMN OPERATIONS<<<<<<<<<<<<<
-- ___________________________________________________________________________________________________



-- .......................INSERTING  NEW COLUMN INTO TABLE DOCTORS.......................
ALTER TABLE DOCTORS
ADD gender varchar(50)
-- .......................DELETING ANY COLUMN FROM TABLE DOCTORS.......................
ALTER TABLE DOCTORS
    DROP COLUMN Doctor_gender
-- .......................UPDATING ANY COLUMN NAME IN TABLE DOCTORS.......................
sp_rename 'DOCTORS.gender',
'doctor_gender'
-- ..........................ADDING DATA INTO COLUMN WHEN NEWLY ADDED........................
update DOCTORS
set doctor_gender='male'
where doctor_id=1

-- .......................SHOW DATA OF TABLE DOCTORS.......................






---------------------------------------------------------------------------------------------------------------------------------



CREATE TABLE NURSES
(
    nurse_id int primary key,
    nurse_password int NOT NULL,
    nurse_name varchar(50) NOT NULL,
    nurse_address varchar(50) NOT NULL ,
    nurse_mobile_no varchar(50) NOT NULL,
    nurse_age int NOT NULL ,
    nurse_qualification varchar(50) NOT NULL ,
    nurse_experience_duration varchar(50) NOT NULL,
    nurse_city varchar(50) NOT NULL,
    CHECK(nurse_password>5),
    Room_id int FOREIGN key REFERENCES ROOM(ROOM_NO)
);

-- ________________________________________________________________________________________________

-- >>>>>>>>>>>ROW OPERATIONS<<<<<<<<<<<<<
-- ___________________________________________________________________________________________________




-- .......................INSERTING  INTO TABLE NURSES.......................

INSERT INTO NURSES
VALUES(01, 123456, 'Ayesha', 'Subhan Town Gujranwala' , '03367278570', 33, '1st year of MBBS', '3Years', ' Gujranwala', 001);
INSERT INTO NURSES
VALUES(02, 123456, 'Ifra', 'Iqbal Road Lahore' , '03233423432', 43, '1st year of BDMS', '2Years', ' Lahore', 002 );
INSERT INTO NURSES
VALUES(03, 123456, 'Sehar', 'Fawara Chock Gujrat' , '03224534345', 38, '1st year of MBBS', '1Years', ' Gujrat', 003 );
INSERT INTO NURSES
VALUES(04, 123456, 'Seerat', 'Kachi Fatomand Gujranwala' , '03454545450', 58, '1st year of MBBS', '6Years', ' Gujranwala', 004 );
INSERT INTO NURSES
VALUES(05, 123456, 'Seerat', 'Kachi Fatomand Gujranwala' , '03454545450', 58, '1st year of MBBS', '6Years', ' Gujranwala', 005 );

--.......................FOR UPDATING ANY NURSES.......................
UPDATE NURSES
SET nurse_id=01,nurse_password=123456,nurse_name='Emman',nurse_address='Subhan Town kamoki'
,nurse_mobile_no='03434343438',nurse_age=34,nurse_qualification='MBBS',nurse_experience_duration='5Years',nurse_city='Gujranwala',Room_id=001
WHERE nurse_id=01;

-- .......................FOR DELETING ANY  NURSES.......................
DELETE FROM DOCTORS WHERE doctor_id=6;

-- ________________________________________________________________________________________________

-- >>>>>>>>>>>COLUMN OPERATIONS<<<<<<<<<<<<<
-- ___________________________________________________________________________________________________



-- .......................INSERTING  NEW COLUMN INTO TABLE NURSES.......................
ALTER TABLE NURSES
ADD gender varchar(50)
-- .......................DELETING ANY COLUMN FROM TABLE NURSES.......................
ALTER TABLE NURSES
    DROP COLUMN nurse_gender
-- .......................UPDATING ANY COLUMN NAME IN TABLE NURSES.......................
sp_rename 'NURSES.gender',
'nurse_gender'
-- ..........................ADDING DATA INTO COLUMN WHEN NEWLY ADDED........................
update NURSES
set nurse_gender='female'
where nurse_password=123456

-- .......................SHOW DATA OF TABLE NURSES.......................






----------------------------------------------------------------------------------------------------------------------------




CREATE TABLE PATIENT
(
    Patient_ID int primary key,
    Patient_name varchar(55) not null,
    Patient_age int not null,
    Patient_mobile varchar(55) not null,
    Patient_username varchar(55) not null,
    Patient_password varchar(55) not null,
    Patient_address varchar(55) not null,
    Patient_city varchar(55) not null,
    Bill_id int not null,
    Patient_room_charges int NOT NULL,
    Patient_doctor_charges int NOT NULL,
    Patient_other_charges int NOT NULL,
);

drop table PATIENT
-- ________________________________________________________________________________________________

-- >>>>>>>>>>>ROW OPERATIONS<<<<<<<<<<<<<
-- ___________________________________________________________________________________________________




-- .......................INSERTING  INTO TABLE PATIENT.......................


insert into Patient
Values
    (14, 'Nayab', 21, '03417938432', 'alinayab', 'nayab12', 'gujranwala', 'Lahore', 1, 2000, 3000, 4000);
insert into Patient
Values
    (15, 'Kamran', 21, '03417938434', 'kamran', 'kam12', 'Dinga', 'Lahore', 2, 2320, 3233, 3390);
insert into Patient
Values
    (16, 'Shani', 22, '03413934432', 'shani', 'shani12', 'Rolia', 'Gujrat', 3, 3000, 4000, 5000);
insert into Patient
Values
    (17, 'Ali', 23, '03422238444', 'ali', 'ali123', 'Langrial', 'Islamabad', 4, 5000, 5000, 5000);
insert into Patient
Values
    (18, 'Rehan', 21, '03422239888', 'rehan', 'rehan12', 'Kotla', 'Kharian', 5, 3030, 4040, 5050);
insert into Patient
Values
    (19, 'Adnan', 20, '03417938492', 'adnan', 'adnan32', 'kakrali', 'Dina', 6, 1110, 2220, 3330);
insert into Patient
Values
    (20, 'Luqman', 18, '03458838432', 'luqman', 'luqman1', 'jalalpur', 'Kotla', 7, 1110, 2220, 3333);
insert into Patient
Values
    (22, 'Faizan', 24, '03487938838', 'faizan', 'faizan3', 'MANGOWAL', 'Lahore', 8, 3300, 3300, 1100);

insert into Patient
Values
    (23, 'Farhan', 25, '03417978782', 'farhan', 'farhan22', 'Jumpstreet F6', 'Faisalabad', 9, 8000, 80000, 8088);
insert into Patient
Values
    (24, 'Abu-Bakr', 28, '03717738432', 'abubakr', 'abubakr1', 'A341-1', 'Bhimber', 10, 1454, 23423, 5675);
insert into Patient
Values
    (25, 'Usman', 32, '03417967332', 'usman', 'usman54', 'G6 12', 'Lahore', 11, 6544, 4544, 8765);
insert into Patient
Values
    (26, 'Suleman', 23, '03423338533', 'suleman', 'suleman31', 'F8 Park', 'Manchester', 12, 7777, 66666, 6666);
insert into Patient
Values
    (27, 'Rizwan', 22, '03413934432', 'rizwan', 'rizwan89', 'gujrat', 'Islamabad', 13, 6666, 6666, 6666);
insert into Patient
Values
    (290, 'Rizwan', 22, '03413934432', 'rizwan', 'rizwan89', 'gujrat', 'Islamabad', 14, 6666, 6666, 6666);

DROP TABLE PATIENT
--.......................FOR UPDATING ANY PATIENT.......................
update PATIENT
set Patient_ID=14,Patient_name='UPDATED',Bill_id=15,Patient_room_charges=9000,Patient_doctor_charges=9000,Patient_other_charges=9000
 WHERE Patient_ID = 14;

--.......................ROMOVE EVERYTHING FROM PATIENT.......................
TRUNCATE table Patient;

--.......................FOR DELETING ANY PATIENT.......................

DELETE from PATIENT where Patient_ID =14;

-- ________________________________________________________________________________________________

-- >>>>>>>>>>>COLUMN OPERATIONS<<<<<<<<<<<<<
-- ___________________________________________________________________________________________________



-- .......................INSERTING  NEW COLUMN INTO TABLE PATIENT.......................
alter table Patient
add Patient_disease varchar(55);
alter table Patient
add test_require varchar(55);

-- .......................DELETING  ANY COLUMN FROM TABLE PATIENT.......................

alter table PATIENT
DROP COLUMN PPatient_BG;
-- .......................UPDATING ANY COLUMN NAME IN TABLE PATIENT.......................
sp_rename 'PATIENT.Patient_Bloodgp',
'Patient_BG'
-- ..........................ADDING DATA INTO COLUMN WHEN NEWLY ADDED........................
update PATIENT
set test_require='negative'
where Patient_ID=18


create INDEX patient_index
on patient (Patient_ID) 
drop index patient_index on patient
select * from patient where Patient_other_charges>4000
--------------------------------------------------------------------------------------------------------------------
--___________________________
--  |                           |
-- |         BILLS TABLE       |
--|___________________________|

CREATE TABLE BILLS
(
    Patient_id int,
    Patient_name varchar(50),
    Bill_id int PRIMARY KEY,
    Room_charges int NOT NULL,
    Doctor_charges int NOT NULL,
    Other_charges int NOT NULL,
    Total_Charges int NOT NULL,
    Action varchar(100) NOT NULL,
)
drop table bills



-- .............................CREATE TRIGGERS OF BIILS FROM PATIENT..................................




Create TRIGGER TRIGERAFTERINSERT ON PATIENT 

-- .......................................AFTER INSERT TRIGGER............................................

AFTER INSERT
AS 
-- .............................DECLARING VARIABLES....................................

    DECLARE @Patient_ID int ;
    DECLARE @Patient_Name Varchar(50);
    DECLARE @Bill_id int;
    DECLARE @Room_charges  int;
    DECLARE @Doctor_charges int;
    DECLARE @Other_Charges int ;
    DECLARE @Total_Charges int;
    DECLARE @Action varchar(100);
SELECT @Patient_ID=i.Patient_ID, @Patient_Name=i.Patient_name, @Bill_id=i.Bill_id , @Room_charges=i.Patient_room_charges, @Doctor_charges=i.Patient_doctor_charges, @Other_Charges=i.Patient_other_charges
from inserted i;
SET @Total_Charges=(@Room_charges+@Doctor_charges+@Other_Charges)
SET @Action='...RECORD IS INSERTED ...';

-- ...............................PASSING TRIGGERED ELEMENTS INTO THE BILL TABLE......................
insert into BILLS
    (Patient_id,Patient_name,BILL_ID,Room_charges,Doctor_charges,Other_charges,Total_Charges,Action)
values(@Patient_ID, @Patient_Name, @Bill_id, @Room_charges, @Doctor_charges, @Other_Charges, @Total_Charges, @Action)
Print 'TRIGGER RUN AFTER INSERTED';
GO

drop trigger TRIGERAFTERINSERT

select * from bills




Create TRIGGER TRIGERAFTERUPADATE ON PATIENT 

-- ......................................AFTER UPDATE TRIGGER............................................
AFTER UPDATE
AS 
-- .............................DECLARING VARIABLES....................................




     DECLARE @Patient_ID int ;
    DECLARE @Patient_Name Varchar(50);
    DECLARE @Bill_id int;
    DECLARE @Room_charges  int;
    DECLARE @Doctor_charges int;
    DECLARE @Other_Charges int ;
    DECLARE @Total_Charges int;
    DECLARE @Action varchar(100);
SELECT @Patient_ID=i.Patient_ID, @Patient_Name=i.Patient_name, @Bill_id=i.Bill_id , @Room_charges=i.Patient_room_charges, @Doctor_charges=i.Patient_doctor_charges, @Other_Charges=i.Patient_other_charges
from inserted i;

IF UPDATE(Patient_name)
SET @Action='...RECORD IS UPDATED ...';
IF UPDATE(Patient_room_charges)
SET @Action='...RECORD IS UPDATED ...';
IF UPDATE(Patient_doctor_charges)
SET @Action='...RECORD IS UPDATED ...';
IF UPDATE(Patient_other_charges)
SET @Action='...RECORD IS UPDATED ...';
SET @Total_Charges=(@Room_charges+@Doctor_charges+@Other_Charges)


-- ...............................PASSING TRIGGERED ELEMENTS INTO THE BILL TABLE......................
insert into BILLS
    (Patient_id,Patient_name,BILL_ID,Room_charges,Doctor_charges,Other_charges,Total_Charges,Action)
values(@Patient_ID, @Patient_Name, @Bill_id, @Room_charges, @Doctor_charges, @Other_Charges, @Total_Charges, @Action)
Print 'TRIGGER RUN AFTER UPDATED';
GO





Create TRIGGER TRIGERAFTERDELETE ON PATIENT 

-- .......................................AFTER DELETE TRIGGER............................................

AFTER DELETE
AS 
-- .............................DECLARING VARIABLES....................................

    DECLARE @Patient_ID int;
    DECLARE @Patient_Name Varchar(50);
    DECLARE @Bill_id int;
    DECLARE @Room_charges  int;
    DECLARE @Doctor_charges int;
    DECLARE @Other_Charges int ;
    DECLARE @Total_Charges int;
    DECLARE @Action varchar(100);
SELECT @Patient_ID=d.Patient_ID, @Patient_Name=d.Patient_name, @Bill_id=d.Bill_id, @Room_charges=d.Patient_room_charges, @Doctor_charges=d.Patient_doctor_charges, @Other_Charges=d.Patient_other_charges
from deleted d;
SET @Total_Charges=(@Room_charges+@Doctor_charges+@Other_Charges)
SET @Action='...RECORD IS DELETED ...';

-- ...............................PASSING TRIGGERED ELEMENTS INTO THE BILL TABLE......................
insert into BILLS
    (Patient_id,Patient_name,BILL_ID,Room_charges,Doctor_charges,Other_charges,Total_Charges,Action)
values(@Patient_ID, @Patient_Name, @Bill_id, @Room_charges, @Doctor_charges, @Other_Charges, @Total_Charges, @Action)
Print 'TRIGGER RUN AFTER DELETED';
GO


-- ...................................GRAND TOTAL OF ALL BILLS......................
SELECT sum(Total_Charges) As 'GRAND_TOTAL'
from BILLS




-----------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ROOM
(
    ROOM_NO int primary key,
    ROOM_Status varchar(50) NOT NULL,
    ROOM_Type varchar (50) NOT NULL,
    ROOM_Charges int NOT NULL,
    Arrival_Date date NOT NULL,
    Discharge_Date date NOT NULL,
    patient_id int FOREIGN KEY REFERENCES PATIENT(Patient_ID),
    Doctor_id int FOREIGN KEY REFERENCES DOCTORS(Doctor_id)
);


drop table ROOM


-- ____________

-- >>>>>>>>>>>ROW OPERATIONS<<<<<<<<<<<<<
-- ___________

-- .......................SUM OF ROOM_Charges .......................
SELECT SUM(ROOM_Charges)As 'TOTAL ROOMS SALE'
FROM ROOM
-- .......................AVG OF ROOM_Charges .......................
SELECT AVG(ROOM_Charges)AS 'AVERAGE ROOM SALE '
FROM ROOM
-- .......................MINIMUM  ROOM_Charges .......................
SELECT MIN(ROOM_Charges)AS 'MINIMUN ROOM SALE '
FROM ROOM
-- .......................MAXIMUM ROOM_Charges .......................
SELECT MAX(ROOM_Charges)AS 'MAXIMUM ROOM SALE'
FROM ROOM

Select room_charges from room
where room_charges>(Select AVG(room_charges)from room)

-- .......................COUNT ROOM_NO .......................
SELECT COUNT(ROOM_NO)AS 'TOTAL ROOMS '
FROM ROOM






-- .......................INSERTING  INTO TABLE ROOM.......................

INSERT INTO ROOM
values
    (001, 'Available', 'Opthalmologist', 5000, '2020-10-15', '2021-12-12', 14, 1)
INSERT INTO ROOM
values
    (002, 'Not-Available', 'ICU', 6000, '2020-10-19', '2021-12-22', 15, 2)
INSERT INTO ROOM
values
    (003, 'Available', 'Operation Theater', 7000, '2020-10-22', '2021-12-30', 16, 3)
INSERT INTO ROOM
values
    (004, 'Not-Available', 'Emergency', 8000, '2020-10-15', '2021-12-12', 17, 4)
INSERT INTO ROOM
values
    (005, 'Available', 'Dermatologist', 9000, '2020-10-15', '2021-12-12', 18, 5)


--.......................FOR UPDATING ANY ROW DATA OF TABLE ROOM.......................

update ROOM 
set ROOM_NO= 001,ROOM_Status = 'Not -Available',ROOM_Type ='Oncologist',ROOM_Charges = 30000 ,Arrival_Date = '2021-5-19', Discharge_Date = '2021-5-23',patient_id=19,doctor_id=5
Where ROOM_NO= 001;

-- .......................FOR DELETING ANY ROW DATA FROM TABLE ROOM.......................
DELETE FROM ROOM WHERE ROOM_NO=6;

-- ____________

-- >>>>>>>>>>>COLUMN OPERATIONS<<<<<<<<<<<<<
-- ___________

-- .......................INSERTING  NEW COLUMN INTO TABLE ROOM.......................
ALTER TABLE ROOM
ADD ROOM_Window varchar(50)
-- .......................DELETING ANY COLUMN FROM TABLE ROOM.......................
ALTER TABLE ROOM
    DROP COLUMN ROOM_Window

-- .......................UPDATING ANY COLUMN NAME IN TABLE ROOM.......................
sp_rename 'ROOM.ROOM_Charges',

'ROOM_Price'
-- ..........................ADDING DATA INTO COLUMN WHEN NEWLY ADDED........................
update ROOM
set ROOM_Window='Yes'
where ROOM_NO=1
-- .......................SHOW DATA OF TABLE ROOM.......................


-------------------------------------------------------------------------------------------------------------


CREATE TABLE APPOINTMENT
(
    Appointment_id int PRIMARY KEY,
    Appointment_date DATE not null,
    Appointment_time varchar(50) not null,
    patient_id int FOREIGN key REFERENCES PATIENT(patient_id),
    Doctor_id int FOREIGN key REFERENCES DOCTORS(Doctor_id)
)
drop table APPOINTMENT
-- ____________

-- >>>>>>>>>>>ROW OPERATIONS<<<<<<<<<<<<<
-- ___________


-- .............................................  INSERTING INTO THE TABLE APPOINTMENT
INSERT INTO APPOINTMENT
VALUES
    (
        22, '2020-10-15', '11pm - 12pm', 14, 1
)
INSERT INTO APPOINTMENT
VALUES
    (
        23, '2020-10-19', '1pm - 2pm', 15, 2
)
INSERT INTO APPOINTMENT
VALUES
    (
        24, '2020-10-22', '3am - 4am', 16, 1
)
INSERT INTO APPOINTMENT
VALUES
    (
        25, '2020-10-15', '5pm - 6pm', 17, 5
)
INSERT INTO APPOINTMENT
VALUES
    (
        26, '2020-10-17', '5pm - 6pm', 17, 5
)


-- ....................................................UPDATING ANY ROW
update APPOINTMENT 
set Appointment_date='2020-10-15'
where Appointment_id=22;

-- .......................FOR DELETING ANY ROW DATA FROM TABLE ROOM.......................
DELETE FROM APPOINTMENT WHERE Appointment_id=22;

-- ____________

-- >>>>>>>>>>>COLUMN OPERATIONS<<<<<<<<<<<<<
-- ___________

-- .......................INSERTING  NEW COLUMN INTO TABLE ROOM.......................
ALTER TABLE APPOINTMENT
ADD Patient_name varchar(50)
-- .......................DELETING ANY COLUMN FROM TABLE ROOM.......................
ALTER TABLE APPOINTMENT
    DROP COLUMN Patient_name

-- .......................UPDATING ANY COLUMN NAME IN TABLE ROOM.......................
sp_rename 'APPOINTMENT.Appointment_id ',
' Appointed_id'

-- .......................SHOW DATA OF TABLE ROOM.......................



----------------------------------------------------------------------------------------------------------------------------------------------
---___________________________________________________________________VIEWS
----------------------------------------------------------------------------------------------------------------------------------------------


-----THIS VIEW CAN ONLY BE ACCESSED BY ADMIN
create view Admin_All
AS
    SELECT DOCTORS.doctor_id, DOCTORS.doctor_name, PATIENT.patient_name,Patient.Patient_disease,Patient.test_require, ROOM.Room_No, BILLS.Total_Charges
    from ADMIN
        INNER JOIN DOCTORS on ADMIN.Doctor_id=DOCTORS.doctor_id
        INNER JOIN PATIENT on Admin.Patient_id=PATIENT.Patient_id
        INNER JOIN ROOM on Admin.Room_id=ROOM.ROOM_NO
        INNER JOIN BILLS on Admin.BILL_ID=BILLS.Bill_id

SELECT *
FROM Admin_All;
drop view Admin_All

-----THIS VIEW CAN ONLY BE ACCESSED BY ADMIN AND DOCTOR

CREATE VIEW DOCTOR_ALL
AS
    SELECT *
    from DOCTORS;

SELECT *
FROM DOCTOR_ALL
ORDER BY DOCTOR_ID;

------THIS VIEW CAN ONLY BE ACCESSED BY ADMIN AND PATIENT

CREATE VIEW PATIENT_ALL
AS
    SELECT *
    from PATIENT;

SELECT *
FROM PATIENT_ALL
ORDER BY PATIENT_ID;

-------THIS VIEW CAN ONLY BE ACCESSED BY ADMIN AND NURSE

CREATE VIEW NURSE_ALL
AS
    SELECT NURSES.nurse_id, NURSES.nurse_name, ROOM.Room_NO
    FROM NURSES
        INNER JOIN ROOM ON NURSES.Room_id=ROOM.Room_No;

SELECT * FROM NURSE_ALL

---------THIS VIEW CAN ONLY BE ACCESSED BY DOCTOR AND PATIENT

CREATE VIEW APPOINTMENT_ALL
AS
    SELECT APPOINTMENT.Appointment_id, DOCTORS.DOCTOR_ID, DOCTORS.doctor_name, APPOINTMENT.Appointment_date, APPOINTMENT.Appointment_time, PATIENT.Patient_ID, PATIENT.Patient_Name
    FROM APPOINTMENT
        INNER JOIN DOCTORS ON APPOINTMENT.doctor_id=DOCTORS.doctor_id
        INNER JOIN PATIENT ON APPOINTMENT.patient_id=PATIENT.patient_id

SELECT *
FROM APPOINTMENT_ALL
ORDER BY Appointment_id;

------THIS VIEW CAN ONLY BE ACCESSED BY ADMIN , DOCTOR AND PATIENT

CREATE VIEW ROOM_ALLOT
AS
    SELECT PATIENT.PATIENT_ID, PATIENT.Patient_Name, DOCTORS.DOCTOR_ID, DOCTORS.doctor_name, ROOM.ROOM_NO, ROOM.ROOM_Type
    FROM ROOM
        FULL JOIN DOCTORS ON ROOM.Doctor_id=DOCTORS.DOCTOR_ID
        FULL JOIN PATIENT ON ROOM.patient_id=PATIENT.PATIENT_ID

SELECT *
FROM ROOM_ALLOT
ORDER BY PATIENT_ID;



-------THIS VIEW CAN ONLY BE ACCESSED BY ADMIN AND PATIENT

CREATE VIEW BILL_ALL
AS
    SELECT Doctors.Doctor_id,Doctors.Doctor_name,PATIENT.PATIENT_ID, PATIENT.PATIENT_NAME, BILLS.BILL_ID, BILLS.Total_Charges
    FROM ADMIN
    JOIN Doctors on admin.Doctor_id=Patient_id
         JOIN PATIENT ON ADMIN.Patient_id=PATIENT.PATIENT_ID
         JOIN BILLS ON ADMIN.BILL_ID=BILLS.BILL_ID

SELECT * FROM BILL_ALL

-- create view disease_all
--     select patient_patient_id,Patient_Name,Doctor_id


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- _____________________________________________________________THANKS YOU_____________________________________________________________________________________________

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------





--.
