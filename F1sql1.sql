Select * From circuits;
Select * From constructorresults;
Select * From constructors;
Select * From constructorstandings;
Select * From drivers;
Select * From driverstandings;
Select * From laptimes;
Select * From pitstops;
Select * From qualifying;
Select * From races;
Select * From results;
Select * From seasons;
Select * From sprintresults;
Select * From `status`;

#create processed db
Create database f1dbprocessed;

#Process circuits
Create table f1dbprocessed.circuits as
Select circuitId as "circuit_id",circuitRef as "circuit_ref",name,location,country,lat as "latitude",lng as "longitude",alt as "altitude" From circuits;

Select * From f1dbprocessed.circuits;

#Process constructors
Create table f1dbprocessed.constructors as
Select constructorId as "constructor_id",constructorRef as "constructor_ref",name,nationality From constructors;

Select * From f1dbprocessed.constructors;

#Process drivers
Create table f1dbprocessed.drivers as
Select driverId as "driver_id",driverRef as "driver_ref",number,code,concat(forename," ",surname) as name,dob,nationality From drivers;

Select * From f1dbprocessed.drivers;

#Process laptimes
Create table f1dbprocessed.laptimes as
Select raceID as "race_id",driverId as "driver_id",lap,position,time,milliseconds From laptimes;

Select * From f1dbprocessed.laptimes;

#Process qualifying
Create table f1dbprocessed.qualifying as
Select qualifyId as "qualify_id",raceID as "race_id",driverId as "driver_id",constructorId as "constructor_id",number,position,q1,q2,q3 From qualifying;

Select * From f1dbprocessed.qualifying;

#Process races
Create table f1dbprocessed.races as
Select raceID as "race_id",year as "race_year",round,circuitId as "circuit_id",name,convert(concat(date, " ",time),datetime) as race_timestamp From races;

Select * From f1dbprocessed.races;

#Process pitstops
Create table f1dbprocessed.pitstops as
Select raceID as "race_id",driverId as "driver_id",stop,lap,time,duration,milliseconds From pitstops;

Select * From f1dbprocessed.pitstops;

#Process results
Create table f1dbprocessed.results as
Select resultId as "result_id",raceID as "race_id",driverId as "driver_id",constructorId as "constructor_id",
number,grid,position,positionText as position_text,positionOrder as position_order,points,laps,time,milliseconds,
fastestLap as fastest_lap,`rank`,fastestLapTime as fastest_lap_time,fastestLapSpeed as fastest_lap_speed From results;

Select * From f1dbprocessed.results;




