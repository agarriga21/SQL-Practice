CREATE DATABASE IF NOT EXISTS apartments_db;
use apartments_db;

DROP TABLE IF EXISTS building;
CREATE Table building(
    ID int AUTO_INCREMENT,
    floors int NOT NULL,
    pool CHAR(1) default "N",
	gym CHAR(1) default "N",
  `addressLine1` varchar(50) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) NOT NULL,
    CHECK (pool="Y" OR pool='N'),
    CHECK (gym="Y" OR gym='N'),
    Primary Key (ID)
);

DROP TABLE IF EXISTS apartments;
CREATE Table apartments(
    ID int AUTO_INCREMENT,
    BuildingID int NOT NULL,
    Bedrooms int NOT NULL,
    Bathrooms int NOT NULL,
    floor int NOT NULL,
    sqft int NOT NULL,
    rent DECIMAL(65, 2),
    occupied CHAR(1) default "N",
    CHECK (occupied="Y" OR occupied='N'),
    Primary Key (ID),
    FOREIGN KEY (BuildingID) REFERENCES building(ID)
);

INSERT INTO building (floors,pool,gym,addressLine1,city,state,postalCode)
Values
(20,"N","N","68-15 Main St","Kew Gardens Hills","NY","11367"),
(3,"Y","N","56 Woodbranch Dr","New Caney","TX","77357"),
(2,"Y","Y","215 Elton Hills Dr NW","Rochester","MN","55901");

#NY Apartment
INSERT INTO apartments (BuildingID,Bedrooms,Bathrooms,floor,sqft,rent,occupied)
Values
(1,1,1,19,455,1800,"N"),
(1,1,1,14,455,1820,"N"),
(1,1,1,18,455,2144,"N"),
(1,1,1,2,455,1950,"N"),
(1,1,1,4,455,1788,"Y"),
(1,1,1,2,455,1850,"Y"),
(1,1,1,10,455,1990,"Y"),
(1,1,1,12,455,2144,"Y"),
(1,1,1,8,455,1900,"Y"),
(1,1,1,9,455,1688,"Y"),
(1,2,1,9,895,2850,"Y"),
(1,2,1,8,895,2813,"Y"),
(1,2,1,10,895,2976,"Y"),
(1,2,1,20,895,3455,"N"),
(1,2,1,19,895,3150,"N"),
(1,2,1,5,895,2769,"N"),
(1,3,2,20,895,5825,"Y");

#TX Apartment
INSERT INTO apartments (BuildingID,Bedrooms,Bathrooms,floor,sqft,rent,occupied)
Values
(2,1,1,1,842,1050,"N"),
(2,1,1,2,842,950,"N"),
(2,1,1,3,842,1000,"N"),
(2,1,1,1,842,1012,"N"),
(2,1,1,1,842,1099,"Y"),
(2,1,1,3,842,975,"Y"),
(2,2,2,3,1455,1622,"Y"),
(2,3,2,1,1788,2155,"Y"),
(2,2,2,2,1455,1440,"Y"),
(2,2,2,1,1455,1688,"N"),
(2,3,2,2,1788,1977,"N"),
(2,2,2,2,1455,1544,"N");

#MN Apartment
INSERT INTO apartments (BuildingID,Bedrooms,Bathrooms,floor,sqft,rent,occupied)
Values
(3,1,1,1,751,875,"N"),
(3,1,1,2,751,900,"N"),
(3,1,1,2,751,775,"N"),
(3,2,1,1,1133,1255,"Y"),
(3,2,1,1,1133,1280,"N"),
(3,2,2,1,1305,1421,"N"),
(3,2,2,2,1305,1399,"N"),
(3,3,3,2,1800,1850,"Y"),
(3,4,3,1,2255,2199,"N");
