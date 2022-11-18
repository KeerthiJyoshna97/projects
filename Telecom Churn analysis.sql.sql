
##--Introduction :
-#---Telco_customer_churn data gives us a brief idea about the customer churn rate in the Telecommunications industry across the
-#--world.Now a days Telecommunications plays an prominent role in our day to day life.The main aim of this dataset is to predict the customer
-#--Churn data that is the number of customers who left the company this quarter and the number of customers who remained in the company and to
-#--suggest the solutions to prevent the considerable churns.

#1.Analyze the dataset given and create multiple tables separating data about customer and services provided.
#A.Before Creating the multiple tables a data base has to be created,where this multiple tables are stored after creating them.
# a SQL data base can be created by using create database statement
#The syntax for creating database: "create database database name"
create database telecom_customers_churn_data;  
											   											
#A table in SQL can be created by using statement:CREATE TABLE Tablename `columnname` datatype ()        
#where datatype is used to store the data,while() denotes the no.of characters that is to be stored.
										
CREATE TABLE `Customer` (							 
  `customer_id` varchar(50)NOT NULL PRIMARY KEY,
  `count` tinyint,
  `gender` varchar(10),
  `Senior_Citizen` varchar(5),
  `Partner` varchar(5),
  `Dependents`varchar(5)
);

#The SQL select statement is used to select the data from a data base.The syntax is as follows:select * from table_name.
select * from Customer;  

#After creating a table we have to insert the values into the table for it we use Insert into.
# The syntax for this statement:Insert Into table name Values();

INSERT INTO Customer VALUES ('8773-HHUOZ',1,'Female','No','No','No');
INSERT INTO Customer VALUES ('6047-YHPVI',1,'Male','No','No','Yes');
INSERT INTO Customer VALUES ('5380-WJKOV',1,'Male','No','No','Yes');
INSERT INTO Customer VALUES ('8168-UQWWF',1,'Female','No','No','Yes');
INSERT INTO Customer VALUES ('7760-OYPDY',1,'Female','No','No','Yes');
INSERT INTO Customer VALUES ('9420-LOJKX',1,'Female','No','No','Yes');
INSERT INTO Customer VALUES ('7495-OOKFY',1,'Female','Yes','Yes','Yes');
INSERT INTO Customer VALUES ('1658-BYGOY',1,'Male','Yes','No','Yes');
INSERT INTO Customer VALUES ('5698-BQJOH',1,'Female','No','No','Yes');
INSERT INTO Customer VALUES ('5919-TMRGD',1,'Female','No','No','Yes');


CREATE TABLE `Customer_Services` (
  `Service_id` int NOT NULL,
  `Multiple_Lines` varchar(50),
  `Tenure_Months` int,
  `Phone_Service` varchar(5),
  `Internet_Service` varchar(50),
  `Online_Security` varchar(5),
  `Online_Backup` varchar(5),
  `Device_Protection` varchar(5),
  `Streaming_TV` varchar(5),
  `Streaming_Movies` varchar(5),
  `tech_support` varchar(5),
  `Contract` varchar(20),
  `Churn_label` varchar(5),
  `Churn_Score` int,
  `CLTV` int,
  `churn_reason` varchar(50),
  `customer_id` varchar(50),
  PRIMARY KEY(Service_id),
 FOREIGN KEY(`customer_id`) REFERENCES telecom_customers_churn_data.customer(`customer_id`)
 );
 
 drop table Customer_Services;  ## drop table command is used to drop a table from the database.
								## After dropping the table we can recreate the table by using CREATE TABLE command.
 
  select * from Customer_Services;
  
INSERT INTO Customer_services VALUES ('1111','No','17','Yes','DSL','No','No','No','Yes','Yes','No','Month-to-month','Yes',74,3022,'Competitor offered higher download speeds','8773-HHUOZ');
INSERT INTO Customer_services VALUES ('2222','No','5','Yes','Fiber optic','No','No','No','No','No','No','Month-to-month','Yes',66,2454,'Competitor offered higher download speeds','6047-YHPVI');
INSERT INTO Customer_services VALUES ('3333','Yes','34','Yes','Fiber optic','No','Yes','Yes','Yes','Yes','No','Month-to-month','Yes',65,2941,'Competitor offered higher download speeds','5380-WJKOV');
INSERT INTO Customer_services VALUES ('4444','yes','11','Yes','Fiber optic','No','No','Yes','Yes','yes','No','Month-to-month','Yes',70,5674,'Competitor offered more data','8168-UQWWF');
INSERT INTO Customer_services VALUES ('5555','No','2','Yes','Fiber optic','No','No','No','Yes','No','No','Month-to-month','Yes',90,5586,'Competitor offered more data','7760-OYPDY');
INSERT INTO Customer_services VALUES ('6666','No','15','Yes','Fiber optic','Yes','Yes','No','yes','Yes','No','Month-to-month','Yes',82,2966,'Competitor offered more data','9420-LOJKX');
INSERT INTO Customer_services VALUES ('7777','Yes','8','Yes','Fiber optic','Yes','Yes','No','No','No','No','Month-to-month','Yes',69,5302,'Competitor made better offer','7495-OOKFY');
INSERT INTO Customer_services VALUES ('8888','Yes','18','Yes','Fiber optic','No','No','No','Yes','Yes','No','Month-to-month','Yes',81,3179,'Competitor made better offer','1658-BYGOY');
INSERT INTO Customer_services VALUES ('9999','Yes','9','Yes','Fiber optic','No','No','No','yes','Yes','No','Month-to-month','Yes',96,5571,'Price too high','5698-BQJOH');
INSERT INTO Customer_services VALUES ('10000','No','1','Yes','Fiber optic','No','No','No','Yes','No','No','Month-to-month','Yes',87,2483,'Product dissatisfaction','5919-TMRGD');

CREATE TABLE `Customer_address` (
  `Customer_address_id` int PRIMARY KEY,
  `City` varchar(50),
  `state` varchar(50),
  `country` varchar(50),
  `Zip_Code` varchar(50),
  `latitude` varchar(50),
  `longitude` varchar(50),
  `customer_id` varchar(50),
  FOREIGN KEY(`customer_id`) REFERENCES telecom_customers_churn_data.customer(`customer_id`)
);
  
  drop table Customer_address;
  
select * from Customer_address;
  
INSERT INTO Customer_address VALUES ('001','Los Angeles','California','United States','90032','34.078821','-118.177576','8773-HHUOZ');
INSERT INTO Customer_address VALUES ('002','Los Angeles','California','United States','90039','34.110845','-118.259595','6047-YHPVI');
INSERT INTO Customer_address VALUES ('003','Los Angeles','California','United States','90041','34.137412','-118.207607','5380-WJKOV');
INSERT INTO Customer_address VALUES ('004','Los Angeles','California','United States','90042','34.115720','-118.192754','8168-UQWWF');
INSERT INTO Customer_address VALUES ('005','Los Angeles','California','United States','90056','33.987945','-118.370442','7760-OYPDY');
INSERT INTO Customer_address VALUES ('006','Los Angeles','California','United States','90061','33.921280','-118.274186','9420-LOJKX');
INSERT INTO Customer_address VALUES ('007','Los Angeles','California','United States','90063','34.044271','-118.185237','7495-OOKFY');
INSERT INTO Customer_address VALUES ('008','Los Angeles','California','United States','90065','34.108833','-118.229715','1658-BYGOY');
INSERT INTO Customer_address VALUES ('009','Beverly Hills','California','United States','90211','34.063947','-118.383001','5698-BQJOH');
INSERT INTO Customer_address VALUES ('010','Huntington Par','California','United States','90255','33.978030','-118.217141','5919-TMRGD'); 
  
  
  CREATE TABLE `Customer_Payments` (
  `Payment_id` int PRIMARY KEY,
  `Paperless_Billing` varchar(5),
  `Payment_method` varchar(50),
  `Monthly_charges` varchar(50),
  `Total_charges` varchar(50),
  `customer_id` varchar(50),
FOREIGN KEY(`customer_id`) REFERENCES telecom_customers_churn_data.customer(`customer_id`)
);

select * from `Customer_Payments`;
  
INSERT INTO Customer_Payments VALUES ('2001','Yes','Mailed check','64.7','1093.1','8773-HHUOZ');
INSERT INTO Customer_Payments VALUES ('2002','Yes','Electronic check','69.7','316.9','6047-YHPVI');
INSERT INTO Customer_Payments VALUES ('2003','Yes','Electronic check','106.35','3549.25','5380-WJKOV');
INSERT INTO Customer_Payments VALUES ('2004','Yes','Bank transfer(automatic)','97.85','1105.4','8168-UQWWF');
INSERT INTO Customer_Payments VALUES ('2005','Yes','Electronic check','80.65','144.15','7760-OYPDY');
INSERT INTO Customer_Payments VALUES ('2006','Yes','Credit card (automatic)','99.1','1426.4','9420-LOJKX');
INSERT INTO Customer_Payments VALUES ('2007','Yes','Credit card (automatic)','80.65','633.3','7495-OOKFY');
INSERT INTO Customer_Payments VALUES ('2008','Yes','Electronic check','95.45','1752.55','1658-BYGOY');
INSERT INTO Customer_Payments VALUES ('2009','No','Electronic check','94.4','857.25','5698-BQJOH');
INSERT INTO Customer_Payments VALUES ('2010','Yes','Electronic check','79.35','79.35','5919-TMRGD'); 
  
##2.Feel free to add ID columns as primary keys when you create multiple tables.
#A.ID columns were added as primary keys when the multiple tables were created.
# A Primary key is a column or the group of columns that contain values that are uniquely identified in the row.It is an attribute of column
# where no two rows have a same value.primary keys must contain unique values and they cannot contain null values.Therefore,a primary key
# constraint contains NOT NULL values.
#The primary keys in the above created tables are as follows;
#1.customer_id is a primary key in the created table named customer.
#2.Service_id is a primary key in the created table named customer_services.
#3.Customer_address_id is a primary key in the created table named customer_address.
#4.Payment_id is a primary key in the created table named customer_payments.

##3.If you created multiple tables, mention the foreign keys for each table and the candidate keys.
#A.Foreign key;
#    A foreign key provides the link between two tables to control the data that can be stored in the foreign key table.
#It is to be noted that A primary key present in the parent table can also act as a foreign key in the child table i.e.,in the second table.
#The foreign constarints is used to prevent the actions taht would destroy the link between the two tables.They have null values.

##The foreign keys present in the child or referenced tables;
#1.customer_id  in the tables of customer_services,customer_address,customer_payments act as a foreign key while in the parent table named as
#   customer it is a primary key. 

#Candidate key;
#             Candidate key is a single key or a group of multiple keys that uniquely identify rows in a table.The value for the candidate key
# is Unique and non-null for all tuples.

# the candidate keys in the so formed multiple tables are:
#1.Service_id+Customer_id in the table of customer_services.
#2.Customer_address_id+customer_id in the table of customer_address.
#3.Payment_id+customer_id in the table of customer_payments.

#4.Create an ER diagram/ Schema to refer to when analyzing the database.

#5.Finally, I would like you to add a write up either with each chunk of code or towards the end, about the database created and the steps you had to follow to create it.

#A.In this schema , a data base named telecom_customers_Churn_data has been created to predict the amount of churn in the telecom industry.
#  A database is used to store the data or the information about the tables that are created .
#steps for creating a database;
#  Usually a data base can be created by using create database statement
# the statement  for creating the database is as follows;-'CREATE DATABASE DATABASE NAME'
# First we have to the statement as create database and at the last we have to give the name for which we want to create a data base.



 






























  
  
  
  
  
  
  