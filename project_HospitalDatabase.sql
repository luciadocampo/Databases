/* LUCIA DOCAMPO RODRIGUEZ*/


DROP TABLE IF EXISTS Hospital;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS EntryHospital;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Treatment;

create table hospital (
    IDHosp number(4) constraint pk_hosp primary key,
    NameH varchar2(25) constraint nn_namehosp not null,
    Loc varchar2(25) constraint nn_hosploc not null,
    TotalCapacity number(4),
    UCIcapacity number(4)
);

create table doctor (
    NSS number(15) constraint pk_doctor primary key,
    NameD varchar2(25) constraint nn_doctorname not null,
    Surname1 varchar2(25),
    Surname2 varchar2(25),
    Especialty varchar2(100)
    
);

create table patient (
    NHC number(15) constraint pk_patient primary key,
    DNI number(8),
    NameP varchar2(25),
    Surname1 varchar2(25),
    Surname2 varchar2(25),
    DateBirthday date,
    DateRegister date constraint nn_datereg not null,  
    MethodReg varchar2(25)                        
);

create table hospitalization (
    IDhospit number(15) constraint pk_hospit primary key,
    NHC number(15),
    HospitalizationDate date,
    OutDate date,
    Place number(4),
    Reason varchar2(240),
    Diagnostic varchar(240)
);

create table treatment (
    IDTreatment number(20) constraint pk_treatment primary key,
    BeginningDate date,
    FinalDate date,
    Authorize number(15) constraint nn_authorizetreatment not null,
    Patient number(15) constraint nn_patient_take_treatment not null
);

/*----------------------------*/

alter table hospitalization add constraint fk_hospitalizationPatient foreign key (NHC) references patient (NHC);
alter table hospitalization add constraint fk_hospitalizationHospital foreign key (Place) references hospital (IDHosp);

alter table treatment add constraint fk_treatmentdoctor foreign key (Authorize) references doctor (NSS);
alter table treatment add constraint fk_treatmetpatient foreign key (Patient) references patient (NHC);

alter table doctor add StartWorking date constraint nn_dateW not null;

/*-------------------------------*/

-- Insertar hospitales

insert into hospital values (1, 'CHUAC', 'Coruna', 1000, 50);
insert into hospital values (2, 'Teresa Herrera', 'Coruna', 500, 25);
insert into hospital values (3, 'CHUS', 'Santiago', 1500, 150);
insert into hospital values (4, 'Rosaleda', 'Santiago', 400, 25);
insert into hospital values (5, 'Barbanza', 'Ribeira', 100, 5);
insert into hospital values (6, 'Alvaro Cunqueiro', 'Vigo', 800, 80);
insert into hospital values (7, 'Meixoeiro', 'Vigo', 500, 50);

-- Insertar personal sanitario

insert into doctor values (1, 'Claudia', 'Barrio', 'de Pablo', 'Neurology', to_date('29/01/1988', 'DD/MM/YYYY'));
insert into doctor values (2, 'Sonia', 'Laure', 'Mota', 'Urology', to_date('15/09/1995', 'DD/MM/YYYY'));
insert into doctor values (3, 'Ana', 'Corrales', 'Nunez', 'Cardiology', to_date('25/03/1986', 'DD/MM/YYYY'));
insert into doctor values (4, 'Aida', 'Amparo', 'Ndiaye', 'Gynecology', to_date('04/03/1978', 'DD/MM/YYYY'));
insert into doctor values (5, 'Maite', 'Fernandez', 'Arizcuren', 'Psychiatry', to_date('01/10/1981', 'DD/MM/YYYY'));
insert into doctor values (6, 'Silvia', 'Ramos', 'Vazquez', 'Nursing', to_date('27/01/1970', 'DD/MM/YYYY'));
insert into doctor values (7, 'Maria', 'Arizcuren', 'Casamayor', 'Nursing', to_date('05/05/1968', 'DD/MM/YYYY'));

insert into patient values (111, 1, 'Andres', 'Romano', 'Seijas', to_date('05/05/1988', 'DD/MM/YYYY'), to_date('05/04/2022', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (222, 2, 'Igor', 'Illarramendi', null, to_date('22/04/1984', 'DD/MM/YYYY'), to_date('20/04/2022', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (333, 3, 'Ana', 'Yerga', 'Mayor', to_date('29/08/1932', 'DD/MM/YYYY'), to_date('03/04/2022', 'DD/MM/YYYY'),'Phone call');
insert into patient values (444, 4, 'David', 'Lorenzo', 'Bartolini', to_date('07/05/2011', 'DD/MM/YYYY'), to_date('04/01/2023', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (666, null, 'Ander', 'Cabezon', 'Rochapea', null, to_date('15/04/2020', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (777, 7, 'Unai', 'Unzueta', 'Mendillorri', to_date('17/10/1850', 'DD/MM/YYYY'), to_date('28/03/2022', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (888, 8, 'Oier', 'Txolo', null, to_date('5/6/1923', 'DD/MM/YYYY'), to_date('15/01/2023', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (999, 9, 'Merali', 'Dominguez', 'Santiago', to_date('28/11/1940', 'DD/MM/YYYY'), to_date('01/02/2022', 'DD/MM/YYYY'),'Phone call');
insert into patient values (100, 10, 'Lucia', 'Gamonal', 'Galapagar', to_date('15/10/1984', 'DD/MM/YYYY'), to_date('14/02/2022', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (200, 20, 'Nacho', 'Pitirroto', null, to_date('15/04/2000', 'DD/MM/YYYY'), to_date('28/04/2022', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (300, 30, 'Noa', 'Dofer', 'Nancampo', to_date('13/10/1970', 'DD/MM/YYYY'), to_date('20/01/2023', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (400, 40, 'Ona', 'Barrio', null, to_date('05/02/1954', 'DD/MM/YYYY'), to_date('24/04/2022', 'DD/MM/YYYY'),'Hospitalization');
insert into patient values (500, 50, 'Alejandro', 'Ferreira', 'Vitoria', to_date('09/06/1943', 'DD/MM/YYYY'), to_date('05/02/2022', 'DD/MM/YYYY'),'Phone call');
insert into patient values (123, null, null, null, null, null, to_date('11/04/2022', 'DD/MM/YYYY'),'Hospitalization');

-- Insertar ingresos

insert into hospitalization values (01, 111 , to_date('05/04/2022 16:30', 'DD/MM/YYYY HH24:MI'), to_date('07/04/2022 07:00', 'DD/MM/YYYY HH24:MI'), 1   , 'Headache', 'Posible migraines');
insert into hospitalization values (02, 111 , to_date('07/04/2022 07:00', 'DD/MM/YYYY HH24:MI'), to_date('11/04/2022 12:30', 'DD/MM/YYYY HH24:MI'), null, 'Improvement, hospital at home', null);
insert into hospitalization values (03, 111 , to_date('11/04/2022 12:30', 'DD/MM/YYYY HH24:MI'), to_date('11/04/2022 14:00', 'DD/MM/YYYY HH24:MI'), 3   , 'Relapse, severe headache', 'Posible brain tumor');
insert into hospitalization values (04, 111 , to_date('11/04/2022 14:00', 'DD/MM/YYYY HH24:MI'), null                       , 5   , 'Beginning of cerebral infarction', 'Sen to ICU');

insert into hospitalization values (04, 222 , to_date('20/04/2022 06:30', 'DD/MM/YYYY HH24:MI'), to_date('25/04/2022 10:00', 'DD/MM/YYYY HH24:MI'), 3   , 'Traffic accident', 'Fracture in both legs');
insert into hospitalization values (05, 222 , to_date('25/04/2022 10:00', 'DD/MM/YYYY HH24:MI'), to_date('29/04/2022 18:30', 'DD/MM/YYYY HH24:MI'), 2   , 'Change of centre', 'Infection in the right leg, danger of gangrene');
insert into hospitalization values (06, 222 , to_date('29/04/2022 18:30', 'DD/MM/YYYY HH24:MI'), null                                  , 3   , 'Improvement, return to plant', null);

insert into hospitalization values (07, 333 , to_date('15/04/2022 17:40', 'DD/MM/YYYY HH24:MI'),  to_date('27/04/2022 12:00', 'DD/MM/YYYY HH24:MI'), 5   , 'Breathlessness', 'Possible case of COVID. Isolation');

insert into hospitalization values (08, 444 , to_date('4/01/2023 16:30', 'DD/MM/YYYY HH24:MI'), to_date('06/01/2023 21:00', 'DD/MM/YYYY HH24:MI'), 7   , 'Abdominal pain', 'Appendicitis. Emergency surgery');
--no hay 555
insert into hospitalization values (09, 555 , to_date('28/03/2022 08:35', 'DD/MM/YYYY HH24:MI'), to_date('03/04/2022 08:35', 'DD/MM/YYYY HH24:MI') , null   , 'Breathlessness', 'Waiting for diagnosis');
insert into hospitalization values (10, 555 , to_date('03/04/2022 08:35', 'DD/MM/YYYY HH24:MI'), to_date('15/04/2022 16:30', 'DD/MM/YYYY HH24:MI') , 3   , 'Breathlessness', 'Admitted for coronavirus');
insert into hospitalization values (11, 555 , to_date('15/04/2022 16:30', 'DD/MM/YYYY HH24:MI'), null , null, 'Disease improvement', 'Home lockdown');

insert into hospitalization values (12, 666 , to_date('15/04/2022 12:15', 'DD/MM/YYYY HH24:MI'), to_date('15/04/2022 22:30', 'DD/MM/YYYY HH24:MI'), 1   , 'Breathlessness', 'Possible case of COVID. Isolation');
insert into hospitalization values (13, 666 , to_date('15/04/202 22:30', 'DD/MM/YYYY HH24:MI'), to_date('29/04/2022 11:00', 'DD/MM/YYYY HH24:MI'), 2   , 'Change of center', 'Covid ruled out, pneumonia case confirmed');

insert into hospitalization values (14, 777 , to_date('28/03/2022 03:35', 'DD/MM/YYYY HH24:MI'), to_date('04/04/2022 11:00', 'DD/MM/YYYY HH24:MI'), 1   , 'Traffic accident. Back pain', 'Possible whiplash');
insert into hospitalization values (15, 777 , to_date('04/04/2022 11:00', 'DD/MM/YYYY HH24:MI'), to_date('19/04/2022 11:00', 'DD/MM/YYYY HH24:MI'), 1 , 'Patient improvement', 'Observation for 15 days');
insert into hospitalization values (16, 777 , to_date('09/04/2022 15:30', 'DD/MM/YYYY HH24:MI'), to_date('10/04/2022 18:30', 'DD/MM/YYYY HH24:MI'), 1   , 'Cut in left forearm', 'Deep cut on the left forearm from a domestic accident. Does not affect the muscles');

insert into hospitalization values (17, 888 , to_date('15/01/2023 13:15', 'DD/MM/YYYY HH24:MI'), to_date('20/02/2022 11:00', 'DD/MM/YYYY HH24:MI'), 3   , 'General discomfort, abdominal pain', 'Pancreatic cancer diagnosed');
insert into hospitalization values (18, 888 , to_date('20/02/2023 11:00', 'DD/MM/YYYY HH24:MI'), null                                        , null, 'Hospital at home', 'Palliative care patient');

insert into hospitalization values (20, 100 , to_date('14/02/2022 20:00', 'DD/MM/YYYY HH24:MI'), to_date('15/02/2022 12:00', 'DD/MM/YYYY HH24:MI'), 4   , 'Right ankle pain', 'Second degree skew. Bandage and rest');

insert into hospitalization values (21, 200 , to_date('28/04/2022 12:00', 'DD/MM/YYYY HH24:MI'), to_date('28/04/2022 19:15', 'DD/MM/YYYY HH24:MI'), 5   , 'Allergic reaction', 'Patient with anaphylaxis shock. Emergency admission');
insert into hospitalization values (22, 200 , to_date('28/04/2022 19:15', 'DD/MM/YYYY HH24:MI'), null                                  , 4   , 'Controlled shock', 'The patient remains under observation');

insert into hospitalization values (23, 300 , to_date('20/01/2023 18:00', 'DD/MM/YYYY HH24:MI'), to_date('22/01/2023 12:25', 'DD/MM/YYYY HH24:MI'), 3   , 'Burn on the right hand', 'Second degree burn on the right hand from a domestic accident');
insert into hospitalization values (24, 300 , to_date('15/04/2022 16:00', 'DD/MM/YYYY HH24:MI'), to_date('17/04/2022 12:45', 'DD/MM/YYYY HH24:MI'), 7   , 'Burn on the left arm', 'First degree burn on the left arm from a domestic accident');

insert into hospitalization values (25, 400 , to_date('24/04/2022 10:25', 'DD/MM/YYYY HH24:MI'), to_date('24/04/2022 19:30', 'DD/MM/YYYY HH24:MI'), 1   , 'Anxiety Attack', 'Patient with dizziness and shortness of breath with anxiety');
insert into hospitalization values (26, 400 , to_date('24/04/2022 19:30', 'DD/MM/YYYY HH24:MI'), null                                  , null, 'Goes home under observation', 'Continue the treatment with pills. Appointment in 15 days to check your progress');

insert into hospitalization values (27, 123 , to_date('11/04/2022 07:15', 'DD/MM/YYYY HH24:MI'), to_date('13/04/2022 08:30', 'DD/MM/YYYY HH24:MI'), 1   , 'Traffic accident', 'Unidentified patient. He enters a coma, very serious after a traffic accident');
insert into hospitalization values (28, 123 , to_date('13/04/2022 08:30', 'DD/MM/YYYY HH24:MI'), to_date('15/04/2022 18:30', 'DD/MM/YYYY HH24:MI'), 2   , 'Patient transfer', 'Transfer for hip reconstruction surgery');
insert into hospitalization values (29, 123 , to_date('15/04/2022 18:30', 'DD/MM/YYYY HH24:MI'), to_date('29/04/2022 12:30', 'DD/MM/YYYY HH24:MI'), 1   , 'Transfer', 'The patient regains consciousness. It is kept under observation');


-- Insertar tratamentos

insert into treatment values (01, to_date('01/03/2022', 'DD/MM/YYYY'), to_date('01/04/2022', 'DD/MM/YYYY'), 1, 111);
insert into treatment values (02, to_date('03/03/2022', 'DD/MM/YYYY'), to_date('03/04/2022', 'DD/MM/YYYY'), 3, 222);
insert into treatment values (03, to_date('04/03/2022', 'DD/MM/YYYY'), to_date('04/04/2022', 'DD/MM/YYYY'), 4, 222);
insert into treatment values (04, to_date('07/03/2022', 'DD/MM/YYYY'), to_date('07/04/2022', 'DD/MM/YYYY'), 5, 222);
insert into treatment values (05, to_date('10/03/2022', 'DD/MM/YYYY'), to_date('10/04/2022', 'DD/MM/YYYY'), 6, 333);
insert into treatment values (06, to_date('13/03/2022', 'DD/MM/YYYY'), to_date('13/04/2022', 'DD/MM/YYYY'), 7, 333);
insert into treatment values (07, to_date('15/03/2022', 'DD/MM/YYYY'), to_date('15/05/2022', 'DD/MM/YYYY'), 1, 333);
insert into treatment values (08, to_date('17/03/2022', 'DD/MM/YYYY'), to_date('17/05/2022', 'DD/MM/YYYY'), 1, 444);
insert into treatment values (09, to_date('19/03/2022', 'DD/MM/YYYY'), to_date('19/05/2022', 'DD/MM/YYYY'), 1, 444);
insert into treatment values (10, to_date('20/04/2022', 'DD/MM/YYYY'), to_date('20/05/2022', 'DD/MM/YYYY'), 3, 666);
insert into treatment values (11, to_date('21/04/2022', 'DD/MM/YYYY'), to_date('04/05/2022', 'DD/MM/YYYY'), 4, 777);
insert into treatment values (12, to_date('22/04/2022', 'DD/MM/YYYY'), to_date('05/05/2022', 'DD/MM/YYYY'), 4, 888);
insert into treatment values (13, to_date('23/04/2022', 'DD/MM/YYYY'), to_date('06/05/2022', 'DD/MM/YYYY'), 5, 999);
insert into treatment values (14, to_date('23/04/2022', 'DD/MM/YYYY'), to_date('23/05/2022', 'DD/MM/YYYY'), 6, 100);
insert into treatment values (15, to_date('23/04/2022', 'DD/MM/YYYY'), to_date('23/05/2022', 'DD/MM/YYYY'), 6, 200);
insert into treatment values (16, to_date('24/04/2022', 'DD/MM/YYYY'), to_date('14/05/2022', 'DD/MM/YYYY'), 7, 300);
insert into treatment values (17, to_date('25/04/2022', 'DD/MM/YYYY'), to_date('10/05/2022', 'DD/MM/YYYY'), 1, 400);
insert into treatment values (18, to_date('26/04/2022', 'DD/MM/YYYY'), to_date('11/05/2022', 'DD/MM/YYYY'), 1, 400);
insert into treatment values (19, to_date('28/04/2022', 'DD/MM/YYYY'), to_date('13/05/2022', 'DD/MM/YYYY'), 3, 111);
insert into treatment values (20, to_date('28/04/2022', 'DD/MM/YYYY'), to_date('08/05/2022', 'DD/MM/YYYY'), 3, 123);
insert into treatment values (21, to_date('29/04/2022', 'DD/MM/YYYY'), to_date('09/05/2022', 'DD/MM/YYYY'), 4, 123);
insert into treatment values (22, to_date('30/04/2022', 'DD/MM/YYYY'), to_date('13/05/2022', 'DD/MM/YYYY'), 5, 111);
insert into treatment values (23, to_date('30/04/2022', 'DD/MM/YYYY'), to_date('16/05/2022', 'DD/MM/YYYY'), 6, 222);
insert into treatment values (24, to_date('30/04/2022', 'DD/MM/YYYY'), to_date('19/05/2022', 'DD/MM/YYYY'), 7, 333);

-- Actualizar datos y borralos
update patient set Surname1 = 'Aramburu' where NHC = 222;
update doctor set Especialty = 'General Surgery' where NSS = 2

insert into doctor values (8, 'Mon', 'Serrat', null, 'Urology', to_date('05/12/1988', 'DD/MM/YYYY'));

update hospitalization set OutDate = to_date('16/05/2022 12:00', 'DD/MM/YYYY HH24:MI') where IDhospit = 07 and HospitalizationDate = to_date('15/04/2022 17:40', 'DD/MM/YYYY HH24:MI');

delete from doctor where NSS = 8;
delete from treatment where IDTreatment = 24;


/* VIEWS*/

create view fisrtv as select NameD from doctor where Especialty = 'Nursing';
create view secondv as select NameP from patient where Surname2 = 'Santiago';

create or replace view firstv as select NameD, Especialty from doctor where Especialty = 'Nursing';

select * from firstv;
select * from secondv;

/*
SELECT STATEMENTS:

1. Show for each patient the dni, full name, date of the register and the method

    SELECT dni, nameP, Surname1, Surname2, to_char(DateRegister, 'DD/MM/YYYY') AS "Register date", MethodReg AS "Register method"
    FROM patient;

2. Show the id and full name of every patient that are isolated at home on day 01/05/2022 at 00:00:00h

    select p.NHC, p.NameP, p.Surname1, p.Surname2
    from patient p join hospitalization h on p.nhc = h.nhc
    where h.OutDate is null and i.place is null;
*/





