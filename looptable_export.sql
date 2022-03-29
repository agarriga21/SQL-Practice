#Looping procedure to create a huge table in database_sample to make large CSV

CREATE TABLE looping_table (
    ID int AUTO_INCREMENT,
    ID2 int,
    ID3 int,
    ID4 int,
    ID5 int,
    ID6 int,
    ID7 int,
    ID8 int,
    ID9 int,
    ID10 int,
    testvarchar varchar(255),
    testchar char(4),
    testdate date,
    testdecimal DECIMAL(65, 2),
    
    Primary Key (ID)
) AUTO_INCREMENT=1000;

drop procedure InsertLoopingTable;
DELIMITER $$

CREATE PROCEDURE InsertLoopingTable()
BEGIN
	DECLARE x INT;
    DECLARE y INT;
    SET x = 1;
     SET y = 23;
     
    insert_loop:  LOOP
		IF  x > 10000 THEN 
			LEAVE  insert_loop;
		END  IF;
            
		SET  x = x + 1;
        SET  y = y - 1;
INSERT INTO looping_table (ID2,ID3,ID4,ID5,ID6,ID7,ID8,ID9,ID10,testvarchar,testchar,testdate,testdecimal)
VALUES (x,x*2,x-100,(x*y),y,y+x,y-x,y-23,abs(y),"this is a test","TEST",CURRENT_DATE(),123.23);
		
	END LOOP;
	SELECT count(ID) from looping_table;
END$$
DELIMITER ;

CALL InsertLoopingTable();

SELECT * from looping_table;

#Export to CSV
SHOW VARIABLES LIKE "secure_file_priv";

#To view column names
SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'database_sample' 
AND table_name = 'looping_table';

#Creating the file
(Select 'ID','ID2','ID3','ID4','ID5','ID6','ID7','ID8','ID9','ID10','testvarchar','testchar','testdate','testdecimal')
UNION
SELECT * from looping_table
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/looping_table.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';