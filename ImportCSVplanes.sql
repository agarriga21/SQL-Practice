#Example of how to import a CSV files data into MySQL
#There is an issue with MySql Workbench 8 in permissions to use infile
#To remove restrictions, you must go:
#Edit the connection, on the Connection tab, go to the 'Advanced' sub-tab, and in the 'Others:' box add the line 'OPT_LOCAL_INFILE=1'

CREATE TABLE planes (
ID int AUTO_INCREMENT,
Model varchar(255) Unique,
InService int,
PriceMil DECIMAL(65, 2),
RangeKM INT,
Passengers int,
Speed int,
YearsOld int,
Primary Key (ID)
);

#This should be done in the connection as stated in the previous comment, but you can check the status here. Should be ON
SHOW GLOBAL VARIABLES LIKE 'local_infile';
#SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE "C:/Users/Alex Garriga/Downloads/airlinerdata(variables) - airlinerdata(variables).csv" INTO TABLE database_sample.planes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Model, InService, PriceMil, RangeKM, Passengers, Speed,YearsOld);

Truncate table planes;
Select * From planes;