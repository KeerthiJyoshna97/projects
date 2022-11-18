##Introduction:olympicsdata gives us an brief introduction about the olympics which had been took place at a certain period of time.
##--various countries had participated in these olympics.The main aim of this dataset is to know how many medals that a particular country has been
##---bagged and also to know the count of gold_medal,silver_medal,brone_medal and total_medal that a person has been awarded with.

create database sakila1;
#Before Creating the multiple tables a data base has to be created,where this multiple tables are stored after creating them.
# a SQL data base can be created by using create database statement
#The syntax for creating database: "create database database name"

#After this the data had been imported from  python into sql with the help of pymysql,sqlachemy packages.

select count(*)from olympicsdata; #count()function returns the number of rows.

#The SQL select statement is used to select the data from a data base.The syntax is as follows:select * from table_name.
select * from olympicsdata;

##1.Apply appropriate normalization techniques (up to 3 NF) to divide it into multiple tables

##1NF--Here am splitting the whole table into multiple tables by converting them into normal forms.

##converting into 1NF. 

##For First Normal Form these rules must be followed.

##1.All rows must be unique(no duplicate rows).
##2.Each cell must only contain a single value(not a list).
##3.Each value should be non divisible(can't be split down further).

##First Normal Form;=>Here am creating two tables in a First normal form.where all rows are unique and each value is non divisible.

#A table in SQL can be created by using statement:CREATE TABLE Tablename `columnname` datatype ()        
#where datatype is used to store the data,while() denotes the no.of characters that is to be stored.

#the Details table is the first normal form-First table.

CREATE TABLE `Details` (	
   `name id`int NOT NULL PRIMARY KEY,    ##name id acts as an primary key.
   `age` int,
   `First_name` varchar(50),
   `Last_Name` varchar(50)
);

##In this table the name column has been splitted into First name and Last name as in 1NF each value should be non divisible.

 drop table `Details`; ## drop table command is used to drop a table from the database.
					   ## After dropping the table we can recreate the table by using CREATE TABLE command.
 
#After creating a table we have to insert the values into the table for it we use Insert into.
# The syntax for this statement:Insert Into table name Values();
 
INSERT INTO Details VALUES (001,23,'Michael','Phelps');
INSERT INTO Details VALUES (002,25,'Natalie','Coughlin');
INSERT INTO Details VALUES (003,24,'Aleksey','Nemov');
INSERT INTO Details VALUES (004,17,'Missy','Franklin');
INSERT INTO Details VALUES (006,27,'Ryan','Lochte');
INSERT INTO Details VALUES (005,22,'Allison','Schmitt');

 select * from `Details`;
 
 ##converting to 1NF-2nd table ##here `Detailssecondtable` is the second table in 1 normal form(1NF). 
							   ##In this table 'age' acts as a primary key constraint while 'name id'acts as a foreign key constraint.
                               
 CREATE TABLE `Detailssecondtable`(	
   `age` int NOT NULL,
   `sports` varchar(50),
   `name id`int,
   PRIMARY KEY(age),
   FOREIGN KEY(`name id`) REFERENCES sakila1.Details(`name id`)
   );
drop table `Detailssecond table`;

INSERT INTO Detailssecondtable VALUES (23,'Swimming',001);
INSERT INTO Detailssecondtable VALUES (25,'Swimming',002);
INSERT INTO Detailssecondtable VALUES (24,'Gymnastics',003);
INSERT INTO Detailssecondtable VALUES (17,'Swimming',004);
INSERT INTO Detailssecondtable VALUES (22,'Swimming',005);
INSERT INTO Detailssecondtable VALUES (27,'Swimming',006);

select * from `Detailssecondtable`;

#=>2--NF
##For second Normal Form these rules must be followed;
##Database must be in First Normal Form.
##Non partial dependency -All non prime attributes should be functionally dependent on the primary key.

##sportsdetails is the first table of 2NF.

CREATE TABLE `sportsDetails`(	##here the sportsid acts an primary key in this table,while Date_given ,sportsid also acts as an composite key.
`sportsid` int PRIMARY KEY,
`Date_Given`varchar(10),
`sports` varchar(50),
`year` int
);
 select * from `sportsDetails`;
 
INSERT INTO sportsDetails VALUES(111,'8/24/2008','Swimming',2008);
INSERT INTO sportsDetails VALUES(222,'8/24/2008','Swimming',2008);
INSERT INTO sportsDetails VALUES(333,'10/01/2000','Gymnastics',2000);
INSERT INTO sportsDetails VALUES(444,'8/12/2012','Swimming',2012);
INSERT INTO sportsDetails VALUES(555,'8/12/2012','Swimming',2012);
INSERT INTO sportsDetails VALUES(666,'8/12/2012','Swimming',2012);
   
##converting into 2NF--2nd table
##Here sportsDetails_secondtable is the 2NF second table.

   CREATE TABLE `sportsDetails_secondtable`(	##here sports acts as an primary key;where we can see that the non prime attribute country
   `sports` varchar(50)NOT NULL,                ## is completely dependent on the primary key named 'sports'.Hence 2NF is satisfied.
   `country`varchar(50)
   );
   
select * from `sportsDetails_secondtable`;

INSERT INTO sportsDetails_secondtable VALUES('Swimming','United States');
INSERT INTO sportsDetails_secondtable VALUES('Swimming','United States');
INSERT INTO sportsDetails_secondtable VALUES('Gymnastics','Russia');
INSERT INTO sportsDetails_secondtable VALUES('Swimming','United States');
INSERT INTO sportsDetails_secondtable VALUES('Swimming','United States');
INSERT INTO sportsDetails_secondtable VALUES('Swimming','United States');
   
## 3---NF
##Olympic_Winners is the first table in the 3NF
##Rules to be followed in 3NF;
##No Transitive Dependencies.
##Database must be in First and Second Normal Form.
##No transitive Dependencies-All fields must only be determinable by the primary/composite key,not by other keys.
 select * from `Olympic_winners`;
 
 CREATE TABLE `Olympic_Winners`(	
   `sports` varchar(50) NOT NULL,        #sports column acts as primary key
   `year` int,                           ##year acts as an composite key.
   `country`varchar(15),
   `First_name`varchar(50),
   `Last_name`varchar(50)
   );
 
 select * from `Olympic_Winners`;
 
INSERT INTO Olympic_Winners VALUES ('Swimming',2008,'United States','Michael','Phelps');
INSERT INTO Olympic_Winners VALUES ('Swimming',2008,'United States','Natalie','Coughlin');
INSERT INTO Olympic_Winners VALUES ('Gymnastics',2000,'Russia','Aleksey','Nemov');
INSERT INTO Olympic_Winners VALUES ('Swimming',2012,'United States','Missy','Franklin');
INSERT INTO Olympic_Winners VALUES ('Swimming',2012,'United States','Allison','Schmitt');
INSERT INTO Olympic_Winners VALUES ('Swimming',2012,'United States','Ryan','Lochte');
 
 
 ##olympic medals--3NF;
 ##Olympic_Winners_secondtable is the second table in 3NF.
 
 CREATE TABLE `Olympic_Winners_secondtable`(	
   `First_name` varchar(50) NOT NULL,           #here First_name acts as an primary key     
   `Last_name` varchar(50),						#while country and Last_name acts as an composite keys.
   `gold_medal`int,
   `silver_medal`int,
   `brone_medal`int,
   `total_medal`int,
   `country`varchar(50)
   );
 
 select * from `Olympic_Winners_secondtable`;
 
 ##In the above 3NF all the fields are determined by  primarykey and by composite keys.
 
INSERT INTO Olympic_Winners_secondtable VALUES('Michael','Phelps',8,0,0,8,'United States');
INSERT INTO Olympic_Winners_secondtable VALUES('Natalie','Coughlin',1,2,3,6,'United States');
INSERT INTO Olympic_Winners_secondtable VALUES('Aleksey','Nemov',2,1,3,6,'Russia');
INSERT INTO Olympic_Winners_secondtable VALUES('Missy','Franklin',4,0,1,5,'United States');
INSERT INTO Olympic_Winners_secondtable VALUES('Allison','Schmitt',3,1,1,5,'United States');
INSERT INTO Olympic_Winners_secondtable VALUES('Ryan','Lochte',2,2,1,5,'United States');

##queries.

##1.Find the average number of medals won by each country

select * from sakila1.olympicsdata;

select avg(total_medal),country  #avg() function returns the average valueof a numeric column.
from olympicsdata			     #group by() clause is used to divide the rows in a table into smaller groups.
group by country;

##2.Display the countries and the number of gold medals they have won in decreasing order

SELECT COUNT(gold_medal), country  #The Count() function returns the number of rows that matches a specified criterion.
FROM olympicsdata
GROUP BY Country
ORDER BY COUNT(gold_medal) DESC;   #ORDER BY keyword sorts the records in ascending order by default.To sort the records in descending
								   #order,use the DESC keyword.

##3.Display the list of people and the medals they have won in descending order, grouped by their country

SELECT name,country,gold_medal,silver_medal,brone_medal,total_medal
FROM olympicsdata								#group by() clause is used to divide the rows in a table into smaller groups.
GROUP BY Country								##ORDER BY keyword sorts the records in ascending order by default.To sort the records in descendingorder,use the DESC keyword.
ORDER BY (gold_medal)DESC,(silver_medal)DESC,(brone_medal)DESC,(total_medal)DESC limit 5;




###Display the list of people with the medals they have won according to their age

SELECT name,age,gold_medal,silver_medal,brone_medal,total_medal  
FROM olympicsdata											#group by() clause is used to divide the rows in a table into smaller groups.
GROUP BY age;


###Which country has won the most number of medals (cumulative).

select country,max(total_medal)from olympicsdata; #max() function returns the largest value of the selected column.










   
   
   
    
   
   
   
   
   
   
   
   
   
   
   
   
   
   