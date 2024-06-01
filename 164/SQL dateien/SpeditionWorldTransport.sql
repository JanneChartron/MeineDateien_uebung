DROP DATABASE IF EXISTS WorldTransport;
CREATE DATABASE WorldTransport;
USE WorldTransport;

CREATE TABLE Employee (
    employeeid int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    prename varchar(30) NOT NULL,
    PRIMARY KEY (employeeid)
);

CREATE TABLE Truck (
    truckid int NOT NULL AUTO_INCREMENT,
    brand varchar(30) NOT NULL,
    payload int NOT NULL,
    PRIMARY KEY (truckid)
);

CREATE TABLE Team (
    teamid int NOT NULL,
    employeeidfs int NOT NULL, 
    truckidfs int NOT NULL, 
    PRIMARY KEY (teamid),
    KEY (employeeidfs),
    KEY (truckidfs),
    CONSTRAINT fk_teamtruck FOREIGN KEY (truckidfs)
       REFERENCES Truck(truckid), 
    CONSTRAINT fk_teamemployee FOREIGN KEY (employeeidfs)
       REFERENCES Employee(employeeid)
);

CREATE TABLE Company (
    companyid int NOT NULL AUTO_INCREMENT,
    companyname varchar(30) NOT NULL,
    contactname varchar(30) NOT NULL,
    email varchar(30) NOT NULL,
    PRIMARY KEY (companyid)
);

CREATE TABLE Deliveryorder (
    orderid int NOT NULL AUTO_INCREMENT,
    orderdate Date,
    companyidfs int NOT NULL,
    teamidfs int NOT NULL,
    PRIMARY KEY (orderid),
    KEY (companyidfs),
    KEY (teamidfs),
    CONSTRAINT fk_ordercompany FOREIGN KEY (companyidfs)
       REFERENCES Company(companyid),
    CONSTRAINT fk_orderteam FOREIGN KEY (teamidfs)
       REFERENCES Team(teamid)
);