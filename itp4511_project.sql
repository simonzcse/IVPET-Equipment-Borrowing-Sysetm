drop database IF EXISTS itp4511_project;
CREATE DATABASE itp4511_project;
use itp4511_project;

drop  TABLE IF EXISTS Account;
create table Account
(
	Account_ID int(8) NOT NULL AUTO_INCREMENT,
	Account_Name Varchar(255) NOT NULL,
	Account_Email Varchar(255) NOT NULL,
	Account_Password varchar(20) NOT NULL,
	Account_DateTimeOfCreation	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Account_Role varchar(20) NOT NULL,
		CONSTRAINT PK_Account PRIMARY KEY (Account_ID),
		CONSTRAINT UC_Account UNIQUE (Account_ID, Account_Email)
 )ENGINE = INNODB;
 	alter table Account auto_increment=20000001;
	insert into Account (`Account_Name`, `Account_Email`, `Account_Password`, `Account_Role`) values ('John Wick','x2001@gmail.com','john12345','Student');
	insert into Account (`Account_Name`, `Account_Email`, `Account_Password`, `Account_Role`) values ('John Weak','x2002@gmail.com','john12345','Student');
	insert into Account (`Account_Name`, `Account_Email`, `Account_Password`, `Account_Role`) values ('Keanu Reeves','x2003@gmail.com','john12345','Technician');
	insert into Account (`Account_Name`, `Account_Email`, `Account_Password`, `Account_Role`) values ('Nero','x2004@gmail.com','john12345','Technician');
	insert into Account (`Account_Name`, `Account_Email`, `Account_Password`, `Account_Role`) values ('Johnny Silverhand','x2005@gmail.com','john12345','Senior Technician');

drop  TABLE IF EXISTS Equipment;
create table Equipment
(
	Equipment_ID int(8) NOT NULL AUTO_INCREMENT,
	Equipment_Name Varchar(255) NOT NULL,
	Equipment_Type Varchar(255) NOT NULL,
	Equipment_DateTimeOfCreation	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
		CONSTRAINT PK_Equipment PRIMARY KEY (Equipment_ID),
		CONSTRAINT UC_Equipment UNIQUE (Equipment_ID, Equipment_Name)
 )ENGINE = INNODB;
	alter table Equipment AUTO_INCREMENT=30000001;
	insert into Equipment (Equipment_Name, Equipment_Type) values('Canon 5D Mark 3 Kit', 'Camera');
	insert into Equipment (Equipment_Name, Equipment_Type) values('Canon 5D Mark 4 Kit', 'Camera');
	insert into Equipment (Equipment_Name, Equipment_Type) values('Canon 50mm f1.2', 'Lens');

drop  TABLE IF EXISTS Equipment_Each;
create table Equipment_Each
(
	Equipment_Each_ID int(9) NOT NULL AUTO_INCREMENT,
	Equipment_ID int(8) NOT NULL,
	Equipment_Each_isBorow BOOLEAN NOT NULL,
	Equipment_Each_isAvailable BOOLEAN NOT NULL,
	Equipment_DateTimeOfCreation	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
		CONSTRAINT PK_Equipment_Each PRIMARY KEY (Equipment_Each_ID),
		CONSTRAINT UC_Equipment_Each UNIQUE (Equipment_Each_ID),
		CONSTRAINT FK_Equipment_Each_Equipment_ID FOREIGN KEY (Equipment_ID)
			REFERENCES Equipment(Equipment_ID)
			ON DELETE CASCADE
 )ENGINE = INNODB;
 	alter table Equipment_Each auto_increment=400000001;
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000001, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000002, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000002, true, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000002, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000002, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000002, false, true);
	insert into Equipment_Each (Equipment_ID, Equipment_Each_isBorow, Equipment_Each_isAvailable) values(30000003, true, true);


drop  TABLE IF EXISTS Reversion;/*Reversion Record*/;
create table Reversion
(
	Reversion_ID int(9) NOT NULL AUTO_INCREMENT,
	Account_ID int(8) NOT NULL,
	Reversion_Status Varchar(255) NOT NULL COMMENT 'To be Confirmed, Approve, Reject, Borrowed',
	Reversion_DateTimeOfCreation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
		CONSTRAINT PK_Reversion PRIMARY KEY (Reversion_ID),
		CONSTRAINT UC_Reversion UNIQUE (Reversion_ID),
		CONSTRAINT FK_Reversion_Account_ID FOREIGN KEY (Account_ID)
			REFERENCES Account(Account_ID)
			ON DELETE CASCADE
 )ENGINE = INNODB;
  	alter table Reversion auto_increment=500000001;
	insert into Reversion (Account_ID, Reversion_Status) values(20000001, 'Reject');
	insert into Reversion (Account_ID, Reversion_Status) values(20000002, 'Borrowed');
	insert into Reversion (Account_ID, Reversion_Status) values(20000001, 'To be Confirmed');

drop  TABLE IF EXISTS Reversion_Equipment;/*Reversion Record, Reversion =1, Reversion_Equipment=>1*/;
create table Reversion_Equipment
(
	Reversion_ID int(9) NOT NULL,
	Equipment_ID int(8) NOT NULL,
	Equipment_Count int(8) NOT NULL,
		CONSTRAINT PK_Reversion_Equipment PRIMARY KEY (Reversion_ID, Equipment_ID),
		CONSTRAINT FK_Reversion_Equipment_Reversion_ID FOREIGN KEY (Reversion_ID)
			REFERENCES Reversion(Reversion_ID)
			ON DELETE CASCADE,
		CONSTRAINT FK_Reversion_Equipment_Equipment FOREIGN KEY (Equipment_ID)
			REFERENCES Equipment(Equipment_ID)
			ON DELETE CASCADE	
 )ENGINE = INNODB;
	insert into Reversion_Equipment values(500000001, 30000003, 2);
	insert into Reversion_Equipment values(500000002, 30000002, 2);
	insert into Reversion_Equipment values(500000002, 30000003, 1);
	insert into Reversion_Equipment values(500000003, 30000001, 1);


drop  TABLE IF EXISTS Borrow;/*Borrow Record*/;
create table Borrow
(
	Borrow_ID int(9) NOT NULL AUTO_INCREMENT,
	Account_ID int(8) NOT NULL,
	Reversion_ID int(9) NOT NULL,
	Borrow_StartDate DATE NOT NULL,
	Borrow_ExpirationDate DATE NOT NULL,
	Borrow_DateTimeOfCreation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
		CONSTRAINT PK_Borrow PRIMARY KEY (Borrow_ID),
		CONSTRAINT UC_Borrow UNIQUE (Borrow_ID),
		CONSTRAINT FK_Borrow_Account_ID FOREIGN KEY (Account_ID)
			REFERENCES Account(Account_ID)
			ON DELETE CASCADE,
		CONSTRAINT FK_Borrow_Reversion_ID FOREIGN KEY (Reversion_ID)
			REFERENCES Reversion(Reversion_ID)
			ON DELETE CASCADE	
 )ENGINE = INNODB;
  	alter table Borrow auto_increment=600000001;
	insert into Borrow(Account_ID, Reversion_ID, Borrow_StartDate, Borrow_ExpirationDate) values(20000002, 500000002,'2020-12-03', '2020-12-10');


drop  TABLE IF EXISTS Borrow_Equipment;/*Borrow Record , Borrow = 1, Borrow_Equipment=>1*/;
create table Borrow_Equipment
(
	Borrow_ID int(9) NOT NULL AUTO_INCREMENT,
	Equipment_Each_ID int(9) NOT NULL,
	Borrow_Equipment_Status Varchar(255) NOT NULL COMMENT 'Borrowing, Returned',
		CONSTRAINT PK_Borrow_Equipment PRIMARY KEY (Borrow_ID, Equipment_Each_ID),
		CONSTRAINT FK_Borrow_Equipment_Borrow_ID FOREIGN KEY (Borrow_ID)
			REFERENCES Borrow(Borrow_ID)
			ON DELETE CASCADE,
		CONSTRAINT FK_Borrow_Equipment_Equipment_Each_ID FOREIGN KEY (Equipment_Each_ID)
			REFERENCES Equipment_Each(Equipment_Each_ID)
			ON DELETE CASCADE	
 )ENGINE = INNODB;
	insert into Borrow_Equipment values(600000001, 400000011, 'Returned');
	insert into Borrow_Equipment values(600000001, 400000012, 'Borrowing');
	insert into Borrow_Equipment values(600000001, 400000016, 'Borrowing');		