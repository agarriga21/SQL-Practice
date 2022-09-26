DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
    carid int AUTO_INCREMENT,
    model_year int NOT NULL,
    make varchar(255) NOT NULL,
    model varchar(255) NOT NULL,
    fuel varchar(25),
    cost DECIMAL(65, 2),
    Primary Key (carid) 
);
Alter table cars
add column garage int;

DROP TABLE IF EXISTS driver;
CREATE TABLE driver (
    driverid int AUTO_INCREMENT,
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,
    Primary Key (driverid) 
);
DROP TABLE IF EXISTS car_driver;
CREATE TABLE car_driver (
    carid int NOT NULL,
    driverid int NOT NULL,
    Primary Key (carid,driverid) 
);

INSERT INTO cars ( model_year, make, model, fuel, cost)
VALUES 
( 2008, "Ford","F250","Diesel",40992.88),
( 2015, "Tesla","Model S","Electric",80052.31),
( 2007, "Honda","Civic","Gas",20000.99),
( 2010, "Ford","F150","Gas",10112.50),
( 2011, "Dodge","Caravan","Gas",21800.99),
( 2012, "Honda","Civic","Hybrid",20200.70),
( 2008, "Toyota","Prius","Hybrid",25212.34),
( 2020, "Chevrolet","Spark","Gas",16244.94);

Select * From car_driver;
Select * From cars;
Select * From driver;
ALTER TABLE cars
drop primary key;

INSERT INTO driver ( firstname, lastname)
VALUES 
("James","Smith");

INSERT INTO car_driver ( carid, driverid)
VALUES 
(10,6);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    username varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `role` varchar(255) NOT NULL,
    Primary Key (username) 
);

INSERT INTO users ( username, `password`,`role`)
VALUES 
("admin1","test1","ADMIN"),("user2","test2","USER");

Select * From users;

DROP TABLE IF EXISTS garages;
CREATE TABLE garages (
    garageid int AUTO_INCREMENT,
    spaces int NOT NULL,
    city varchar(255) NOT NULL,
    state varchar(255) NOT NULL,
    Primary Key (garageid) 
);

Select * From garages;

INSERT INTO garages ( spaces, city,state)
VALUES 
(5,"Austin","Texas"),(20,"Miami","Florida");

Update cars set garage = 1 where make = "Ford";
Update cars set garage = 2 where make = "Toyota";

DROP TABLE IF EXISTS car_info;
CREATE TABLE car_info (
    carid int,
    vin varchar(255) NOT NULL,
    lic varchar(255) NOT NULL,
    foreign key (carid) references cars(carid)
);

Select * From car_info;

INSERT INTO car_info (carid,vin,lic)
VALUES 
(5,"HG54242XT54","DGT-3213"),(12,"TDG4324FFG4","JKI-65H3");
