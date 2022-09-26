select * from productlines;

UPDATE productlines SET image = "https://th.bing.com/th/id/OIP.H4jFLgLxi5p40tSqiuQG1AHaE8?w=248&h=180&c=7&r=0&o=5&pid=1.7" WHERE productLine ="Classic Cars";
UPDATE productlines SET image = "https://th.bing.com/th/id/OIP.uzW77un9MkEvy6gYvg9njgHaFj?w=260&h=195&c=7&r=0&o=5&pid=1.7" WHERE productLine ="Motorcycles";
UPDATE productlines SET image = "https://th.bing.com/th/id/OIP.ZXEQzZYJYxU-RJfLL97SBwHaD4?w=308&h=180&c=7&r=0&o=5&pid=1.7" WHERE productLine ="Planes";
UPDATE productlines SET image = "https://th.bing.com/th/id/OIP.uH_khrRVoK1UuNni37IgYgHaEo?w=302&h=188&c=7&r=0&o=5&pid=1.7" WHERE productLine ="Ships";
UPDATE productlines SET image = "https://th.bing.com/th/id/OIP.-9MLaAodavhr1G0VLBxS0gHaE7?w=279&h=185&c=7&r=0&o=5&pid=1.7" WHERE productLine ="Trains";
UPDATE productlines SET image = "https://th.bing.com/th/id/OIP.IUNbytqlVh6l0NSFKwo_DQHaFy?w=238&h=186&c=7&r=0&o=5&pid=1.7" WHERE productLine ="Trucks and Buses";
UPDATE productlines SET image = "https://th.bing.com/th/id/OIP.Py_xAg6aam8qjH-rz1ChdwHaEK?w=333&h=187&c=7&r=0&o=5&pid=1.7" WHERE productLine ="Vintage Cars";

ALTER TABLE productlines
MODIFY COLUMN image varchar(255);

UPDATE offices SET city = "St Paul" WHERE officeCode =9;
select * from offices;