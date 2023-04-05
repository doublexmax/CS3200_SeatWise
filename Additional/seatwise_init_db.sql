CREATE DATABASE IF NOT EXISTS SeatWise;

USE SeatWise;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Venues;

CREATE TABLE Venues (
    VenueID int PRIMARY KEY,
    VenueName varchar(255) NOT NULL,
    PhoneNumber varchar(25),
    Email varchar(255),
    Street varchar(255) NOT NULL,
    City varchar(255) NOT NULL,
    State varchar(255) NOT NULL,
    Zipcode varchar(255) NOT NULL,
    Country varchar(255) NOT NULL,
    OwnerID int NOT NULL,
    FOREIGN KEY (OwnerID) REFERENCES VenueOwner(OwnerID)
);

DROP TABLE IF EXISTS VenueOwner;

CREATE TABLE VenueOwner (
    OwnerID int PRIMARY KEY,
    OwnerName varchar(255) NOT NULL,
    PhoneNumber varchar(25),
    Email varchar(255)
);

DROP TABLE IF EXISTS Artists;

CREATE TABLE Artists (
    ArtistID int PRIMARY KEY,
    ArtistName varchar(255) NOT NULL,
    PhoneNumber varchar(25),
    Email varchar(255),
    Description varchar(255)
);

DROP TABLE IF EXISTS Contract;

CREATE TABLE Contract (
    ContractID int PRIMARY KEY,
    Date_Signed date,
    Description varchar(255),
    ArtistID int NOT NULL,
    VenueID int NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

DROP TABLE IF EXISTS Venues_Artist;

CREATE TABLE Venues_Artist (
    ArtistID int NOT NULL,
    VenueID int NOT NULL,
    PRIMARY KEY (ArtistID, VenueID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    Name varchar(255) NOT NULL,
    PhoneNumber varchar(25),
    Email varchar(255),
    DOB date NOT NULL,
    Street varchar(255),
    City varchar(255),
    State varchar(255),
    Zipcode varchar(255),
    Country varchar(255)
);

DROP TABLE IF EXISTS Tickets;

CREATE TABLE Tickets (
    TicketID int PRIMARY KEY,
    Price double NOT NULL,
    Seat_Row varchar(25) NOT NULL,
    Section varchar(25) NOT NULL,
    Seat_Column varchar(25) NOT NULL,
    Type varchar(255) NOT NULL,
    CustomerID int NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

DROP TABLE IF EXISTS Dependent;

CREATE TABLE Dependent (
    Name varchar(255) PRIMARY KEY,
    PhoneNumber varchar(25),
    Email varchar(255),
    Street varchar(255),
    City varchar(255),
    State varchar(255),
    Zipcode varchar(255),
    Country varchar(255),
    Relationship varchar(255) NOT NULL,
    Parent int NOT NULL,
    FOREIGN KEY (Parent) REFERENCES Customers(CustomerID)
);

DROP TABLE IF EXISTS Performance;

CREATE TABLE Performance (
    PerformanceID int PRIMARY KEY,
    Date datetime,
    Description varchar(255),
    ArtistID int NOT NULL,
    VenueID int NOT NULL,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

DROP TABLE IF EXISTS Genre;

CREATE TABLE Genre (
    Name varchar(255) PRIMARY KEY
);

DROP TABLE IF EXISTS Artist_Genres;

CREATE TABLE Artist_Genres (
    Genre varchar(255) NOT NULL,
    ArtistID int NOT NULL,
    PRIMARY KEY (Genre, ArtistID),
    FOREIGN KEY (Genre) REFERENCES Genre(Name),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

DROP TABLE IF EXISTS Performance_Genres;

CREATE TABLE Performance_Genres (
    Genre varchar(255) NOT NULL,
    PerformanceID int NOT NULL,
    PRIMARY KEY (Genre, PerformanceID),
    FOREIGN KEY (Genre) REFERENCES Genre(Name),
    FOREIGN KEY (PerformanceID) REFERENCES Performance(PerformanceID)
);

DROP TABLE IF EXISTS Fan_Of;

CREATE TABLE Fan_Of (
    ArtistID int NOT NULL,
    CustomerID int NOT NULL,
    PRIMARY KEY (ArtistID, CustomerID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

SET FOREIGN_KEY_CHECKS=1;
