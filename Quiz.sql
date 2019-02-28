--- PLEASE EXECUTE THE FOLLOWING SCRIPTS TO CREATE TABLE AND INSERT DATA 
--- Then answer the data questions below 
--- Please submit your SQL Script for each data question and screenshots of your results in a PDF file.

CREATE TABLE Users
(User_ID      CHAR(4)  CONSTRAINT Users_userID_PK PRIMARY KEY,
 User_LName   VARCHAR(20),
 User_FName   VARCHAR(20),
 Email        VARCHAR(25));

CREATE TABLE Location
(Location_ID   CHAR(2)  CONSTRAINT Location_locationID_PK  PRIMARY KEY,
 Loc_Bldg      VARCHAR(20),
 Loc_Room      CHAR(7));

CREATE TABLE Item
(Item_ID     CHAR(4) CONSTRAINT Item_itemID_PK PRIMARY KEY,
 Item_Manuf  VARCHAR(30),
 Item_Model  VarCHAR(30));

CREATE TABLE Computer
(Comp_ID      CHAR(3),
 Comp_Name    VARCHAR(20),
 Location_ID  CHAR(2),
 Item_ID      CHAR(4),
 Price		  INT,
 CONSTRAINT computer_compID_PK  PRIMARY KEY (Comp_ID),
 CONSTRAINT computer_location_FK   FOREIGN KEY (Location_ID) 
            REFERENCES  Location (Location_ID),
 CONSTRAINT computer_item_FK   FOREIGN KEY (Item_ID) 
            REFERENCES  Item (Item_ID));

CREATE TABLE Loan
(User_ID       CHAR(4),
 Comp_ID       CHAR(3),
 Start_Date    DATE,
 Date_Returned DATE,
 CONSTRAINT loan_PK  PRIMARY KEY (User_ID, Comp_ID, Start_date),
 CONSTRAINT loan_user_FK   FOREIGN KEY (User_ID) REFERENCES  users (User_ID),
 CONSTRAINT loan_comp_FK   FOREIGN KEY (Comp_ID) REFERENCES  computer (Comp_ID));

 INSERT INTO USERS VALUES ('241', 'Singh',     'Vijay', 'vijay@campus.uni.edu');
INSERT INTO USERS VALUES ('207', 'Guerra',    'Richard','rg11@campus.uni.edu');
INSERT INTO USERS VALUES ('213', 'Miller',    'Sandra', 'sm5o@campus.uni.edu');
INSERT INTO USERS VALUES ('231', 'Holin',     'John',   'john3@campus.uni.edu');
INSERT INTO USERS VALUES ('238', 'Johnson',   'Richard','jr9f@campus.uni.edu');
INSERT INTO USERS VALUES ('323', 'Nimoy',     'Joan',   'joan@campus.uni.edu');
INSERT INTO USERS VALUES ('320', 'Tavernier', 'Anna',   'anna@campus.uni.edu');
INSERT INTO USERS VALUES ('360', 'Bevens',    'John',   'jb23@campus.uni.edu');
INSERT INTO USERS VALUES ('362', 'Couples',   'Fred',   'fred@campus.uni.edu');
INSERT INTO USERS VALUES ('425', 'Pepper',    'Angela', 'angie@campus.uni.edu');
INSERT INTO USERS VALUES ('407', 'Lee',       'Bing',   'binlee@campus.uni.edu');

INSERT INTO LOCATION VALUES ('L1', 'HBH', '112');
INSERT INTO LOCATION VALUES ('L2', 'HBH', '116');
INSERT INTO LOCATION VALUES ('L3', 'NSH', '116');
INSERT INTO LOCATION VALUES ('L4', 'HBH', '253');
INSERT INTO LOCATION VALUES ('L5', 'NSH', '305');
INSERT INTO LOCATION VALUES ('L6', 'HBH', '3015');

INSERT INTO item VALUES ('15', 'Dell',   'Alienware');
INSERT INTO item VALUES ('17', 'HP',     'Envy 14');
INSERT INTO item VALUES ('19', 'Lenovo', 'Ideacentre');
INSERT INTO item VALUES ('21', 'Lenovo', 'Essential');
INSERT INTO item VALUES ('23', 'HP',     'Envy Spectre');
INSERT INTO item VALUES ('25', 'HP',     'TouchSmart Elite');

INSERT INTO COMPUTER VALUES ('C8', 'Newell', 'L3', '15', 1000);
INSERT INTO COMPUTER VALUES ('C30', 'Barnaby', 'L2', '17', 2000);
INSERT INTO COMPUTER VALUES ('C19', 'Simon',   'L1', '19', 1500);
INSERT INTO COMPUTER VALUES ('C18', 'Bell',    'L2', '21', 800);
INSERT INTO COMPUTER VALUES ('C29', 'Deb',     'L1', '15', 1200);
INSERT INTO COMPUTER VALUES ('C10', 'Caracas', 'L2', '23', 1300);
INSERT INTO COMPUTER VALUES ('C28', 'Dinar',   'L3', '19', 1800);
INSERT INTO COMPUTER VALUES ('C22', 'Kerr',    'L3', '25', 500);
INSERT INTO COMPUTER VALUES ('C25', 'Gun',     'L3', '17', 600);
INSERT INTO COMPUTER VALUES ('C21', 'Kahn',    'L1', '17', 1100);
INSERT INTO COMPUTER VALUES ('C31', 'SIMON2',   'L4', '21', 2000);

INSERT INTO LOAN VALUES ('241', 'C8', '2014-06-15', '2014-09-03');
INSERT INTO LOAN VALUES ('207', 'C30', '2014-09-20', '2015-01-20');
INSERT INTO LOAN VALUES ('213', 'C19', '2014-08-21', '2014-09-11');
INSERT INTO LOAN VALUES ('207', 'C18', '2014-08-21', '2015-04-12');
INSERT INTO LOAN VALUES ('231', 'C29', '2014-08-21','2015-02-08');
INSERT INTO LOAN VALUES ('238', 'C10', '2014-08-21','2015-05-21'); 
INSERT INTO LOAN VALUES ('360', 'C8', '2014-10-10', '2015-04-21');
INSERT INTO LOAN VALUES ('323', 'C28', '2014-09-11', '2015-04-25');
INSERT INTO LOAN VALUES ('207', 'C19', '2014-09-03', '2015-01-01');
INSERT INTO LOAN VALUES ('425', 'C10', '2014-01-21', NULL); 
INSERT INTO LOAN VALUES ('407', 'C8', '2014-07-10', NULL);
INSERT INTO LOAN VALUES ('362', 'C28', '2014-05-11', NULL);

SELECT * FROM Location;
SELECT * FROM COMPUTER;
SELECT * FROM LOAN;
SELECT * FROM USERS;
SELECT * FROM ITEM;

--0.25pt- Q1: What is the Maximum and Minimum price of the Computers? 

--0.5pt- Q2: Count the number of computers in each type of manufactured item (HP, Dell, Lenovo). 
-- 			  Show item_manuf and number of computers, the result should be presented in ascending order of the number of computers. 

--0.75 pt- Q3: Show all the users who have computer loans that were returned before 2015-04-12. 
------		Your results should include user_FName, user_LName, Email, comp_id, loan start_date, and Date_Returned. 

--1pt- Q4: Show the details of the users who have not made any computer loans.

--1.25pt- Q5: Show the total number of computers in each building and the average prices of those computers. 
---		return the Loc_Bldg, the number of computers, average prices 

--1.25pt- Q6: Which computer model is loaned for less than 4 times (<4)? 
---		show the Item_Model and the total number of loans of that computer model 


select max(Price) 'Maximum Price'
from Computer;

select min(Price) 'Minimum Price'
from Computer;


select item_manuf, count(i.Item_ID) 'Number of Computers'
from Item i
Left Join Computer c on i.Item_ID = c.Item_ID
group by Item_Manuf 
order by count(i.Item_ID);


select u.User_FName, u.User_LName, u.Email, l.Comp_ID, l.Start_Date, l.Date_Returned
from LOAN l
left Join Users u ON l.User_ID = u.User_ID
where l.Date_Returned < '2015-04-12';

select u.*
from Users u
left join Loan l On u.User_ID = l.User_ID
Where l.User_ID IS NULL;

select lo.Loc_Bldg, count(c.Item_ID) 'Number of Computers', avg(Price) 'Average Price'
from Computer c
Left Join Location lo on c.Location_ID = lo.Location_ID
group by lo.Loc_Bldg; 


select Item_Model, count(l.Comp_ID) 'Number of Loans'
from Item i
Inner Join Computer c on i.Item_ID = c.Item_ID
Inner Join Loan l on c.Comp_ID = l.Comp_ID
group by Item_Model
Having count(l.Comp_ID)< 4;






