CREATE DATABASE IF NOT EXISTS SeatWise;

USE SeatWise;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Venues;

CREATE TABLE Venues (
    VenueID int PRIMARY KEY auto_incremenet,
    VenueName varchar(255) NOT NULL,
    PhoneNumber varchar(25) UNIQUE,
    Email varchar(255) UNIQUE,
    Street varchar(255) NOT NULL,
    City varchar(255) NOT NULL,
    State varchar(255) NOT NULL,
    Zipcode varchar(255) NOT NULL,
    Country varchar(255) NOT NULL,
    OwnerID int NOT NULL,
    FOREIGN KEY (OwnerID) REFERENCES VenueOwner(OwnerID),
    CONSTRAINT u_email UNIQUE (Email),
    CONSTRAINT u_ph UNIQUE (PhoneNumber)
);

DROP TABLE IF EXISTS VenueOwner;

CREATE TABLE VenueOwner (
    OwnerID int PRIMARY KEY auto_incremenet,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    PhoneNumber varchar(25) UNIQUE NOT NULL,
    Email varchar(255) UNIQUE NOT NULL,
    CONSTRAINT u_email UNIQUE (Email),
    CONSTRAINT u_ph UNIQUE (PhoneNumber)
);

DROP TABLE IF EXISTS Artists;

CREATE TABLE Artists (
    ArtistID int PRIMARY KEY auto_incremenet,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    PhoneNumber varchar(25) UNIQUE NOT NULL,
    Email varchar(255) UNIQUE NOT NULL,
    Description varchar(255),
    CONSTRAINT u_email UNIQUE (Email),
    CONSTRAINT u_ph UNIQUE (PhoneNumber)
);

DROP TABLE IF EXISTS Contract;

CREATE TABLE Contract (
    ContractID int PRIMARY KEY auto_incremenet,
    Date_Signed datetime,
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
    CustomerID int PRIMARY KEY auto_increment,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    PhoneNumber varchar(25) UNIQUE NOT NULL,
    Email varchar(255) UNIQUE NOT NULL,
    DOB date NOT NULL,
    Street varchar(255),
    City varchar(255),
    State varchar(255),
    Zipcode varchar(255),
    Country varchar(255),
    CONSTRAINT u_email UNIQUE (Email),
    CONSTRAINT u_ph UNIQUE (PhoneNumber)
);

DROP TABLE IF EXISTS Tickets;

CREATE TABLE Tickets (
    TicketID int NOT NULL auto_increment,
    VenueID int NOT NULL,
    Price double NOT NULL,
    Seat_Row varchar(25) NOT NULL,
    Section varchar(25) NOT NULL,
    Seat_Column varchar(25) NOT NULL,
    Type varchar(255) NOT NULL,
    CustomerID int,
    PRIMARY KEY (TicketID, VenueID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

DROP TABLE IF EXISTS Dependent;

CREATE TABLE Dependent (
    DependentID int PRIMARY KEY,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    PhoneNumber varchar(25)  UNIQUE NOT NULL,
    Email varchar(255) UNIQUE NOT NULL,
    Street varchar(255),
    City varchar(255),
    State varchar(255),
    Zipcode varchar(255),
    Country varchar(255),
    Relationship varchar(255) NOT NULL,
    Parent int NOT NULL,
    FOREIGN KEY (Parent) REFERENCES Customers(CustomerID),
    CONSTRAINT u_email UNIQUE (Email),
    CONSTRAINT u_ph UNIQUE (PhoneNumber)
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

INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (1,'Sebastien','Horstead','824-398-9165','shorstead0@shinystat.com');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (2,'Lita','Burchell','409-685-1992','lburchell1@gmpg.org');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (3,'Sal','Orbon','680-111-5896','sorbon2@opera.com');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (4,'Ramon','Scroggie','188-237-5589','rscroggie3@networkadvertising.org');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (5,'Sallyanne','Netherwood','126-882-6972','snetherwood4@yellowbook.com');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (6,'Birch','Bottrill','687-954-0785','bbottrill5@cbslocal.com');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (7,'Teressa','Basile','621-710-5829','tbasile6@biblegateway.com');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (8,'Joletta','Durtnal','623-357-1115','jdurtnal7@hp.com');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (9,'Nance','Campana','463-161-8262','ncampana8@pagesperso-orange.fr');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (10,'Ilyssa','Brimble','373-824-0842','ibrimble9@e-recht24.de');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (11,'Leonore','Sapshed','966-444-0330','lsapsheda@redcross.org');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (12,'Romona','Haggie','932-582-7119','rhaggieb@irs.gov');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (13,'Alva','Dodman','141-178-3435','adodmanc@rediff.com');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (14,'Clint','Cleal','773-158-2562','ccleald@about.com');
INSERT INTO VenueOwner(OwnerID,FirstName,LastName,PhoneNumber,Email) VALUES (15,'Gwenora','Adamik','978-361-1456','gadamike@wisc.edu');

INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (1,'Beryle','214-903-0190','bfinker0@dyndns.org','0 Stang Lane','Dallas','TX',89226,'US',11);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (2,'Helenelizabeth','315-546-2853','htregoning1@indiegogo.com','251 Basil Way','Utica','NY',95134,'US',5);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (3,'Gayle','508-670-4462','gbudgen2@tuttocitta.it','620 Lyons Park','Worcester','MA',05508,'US',1);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (4,'Ced','808-508-8454','cschapero3@odnoklassniki.ru','9 Blaine Pass','Honolulu','HI',52416,'US',3);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (5,'Read','804-671-1454','rkinvan4@artisteer.com','3759 Pearson Court','Richmond','VA',65954,'US',14);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (6,'Margy','212-188-4916','mbolliver5@nature.com','06 Arizona Trail','New York City','NY',86297,'US',12);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (7,'Javier','704-794-8080','jnanetti6@abc.net.au','63623 Charing Cross Terrace','Charlotte','NC',27605,'US',6);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (8,'Webb','651-238-9844','wcowwell7@github.io','61031 Brown Circle','Saint Paul','MN',88856,'US',7);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (9,'Alisha','763-256-2800','alonghorn8@home.pl','63692 High Crossing Circle','Loretto','MN',54666,'US',10);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (10,'Laetitia','315-230-9288','ldrohun9@un.org','96 Continental Lane','Syracuse','NY',54429,'US',2);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (11,'Elysia','619-473-6053','emettsa@yellowbook.com','068 Lillian Center','San Diego','CA',61675,'US',13);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (12,'Cynthy','216-413-0211','cduffieldb@clickbank.net','9939 Tennyson Drive','Cleveland','OH',40350,'US',15);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (13,'Vitia','949-549-2216','vbetchleyc@odnoklassniki.ru','70 Bowman Plaza','Irvine','CA',83684,'US',9);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (14,'Woodie','916-109-4222','wbeedelld@apache.org','80 Merry Way','Sacramento','CA',72453,'US',8);
INSERT INTO Venues(VenueID,VenueName,PhoneNumber,Email,Street,City,State,Zipcode,Country,OwnerID) VALUES (15,'Yvor','678-380-3107','yspillinge@sakura.ne.jp','7 Cherokee Court','Atlanta','GA',14660,'US',4);

INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (1,'Glynn','Garfield','248-727-0750','ggarfield0@mit.edu','magna at nunc commodo placerat praesent blandit nam nulla integer pede');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (2,'Gilly','Elderidge','230-159-6114','gelderidge1@upenn.edu','purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (3,'Rupert','Hubbucke','513-880-6669','rhubbucke2@vistaprint.com','primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (4,'Vera','Grubey','682-153-9129','vgrubey3@examiner.com','at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (5,'Helsa','Kimbly','787-182-8475','hkimbly4@hexun.com','orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (6,'Aurilia','Lansdowne','609-911-1211','alansdowne5@goodreads.com','sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (7,'Kamilah','Dow','947-114-4210','kdow6@issuu.com','nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (8,'Dorie','Morson','922-122-1891','dmorson7@zdnet.com','luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (9,'Kyle','Marlor','813-621-1587','kmarlor8@devhub.com','nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (10,'Rochette','Bompass','325-851-2958','rbompass9@tumblr.com','dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (11,'Hilario','Broyd','645-662-4355','hbroyda@ed.gov','pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (12,'Sayre','Longmuir','376-543-7119','slongmuirb@nature.com','primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (13,'Clementia','Stoneley','772-655-2640','cstoneleyc@rambler.ru','vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (14,'Orland','Finlaison','355-206-3341','ofinlaisond@craigslist.org','placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget');
INSERT INTO Artists(ArtistID,FirstName,LastName,PhoneNumber,Email,Description) VALUES (15,'Pierrette','Morilla','221-345-1586','pmorillae@hao123.com','eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan');

INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (1,'2022-12-27','leo maecenas pulvinar lobortis est phasellus sit amet erat nulla',15,2);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (2,'2022-06-13','vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue',7,5);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (3,'2022-11-04','nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel',4,9);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (4,'2022-09-08','amet lobortis sapien sapien non mi integer ac neque duis bibendum',14,15);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (5,'2022-08-21','nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac',1,4);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (6,'2022-05-12','aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit',3,7);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (7,'2023-03-13','nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante',12,14);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (8,'2022-09-27','posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec',2,12);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (9,'2022-04-10','nulla ut erat id mauris vulputate elementum nullam varius nulla',13,6);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (10,'2023-02-02','montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id',6,13);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (11,'2023-01-26','eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat',10,11);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (12,'2022-07-29','nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam',5,10);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (13,'2022-10-16','turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in',8,8);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (14,'2022-10-22','dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia',11,3);
INSERT INTO Contract(ContractID,Date_Signed,Description,ArtistID,VenueID) VALUES (15,'2022-07-05','nulla quisque arcu libero rutrum ac lobortis vel dapibus at',9,1);

INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (2,12);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (4,14);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (15,3);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (13,5);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (8,8);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (7,2);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (12,7);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (9,15);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (1,1);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (11,11);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (5,9);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (10,13);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (14,4);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (3,6);
INSERT INTO Venues_Artist(ArtistID,VenueID) VALUES (6,10);

INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (1,'Randene','Brimm','405-746-9513','rbrimm0@bizjournals.com','2001-07-08','549 Northfield Place','Oklahoma City','OK',35277,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (2,'Ashlee','Queripel','859-130-8792','aqueripel1@omniture.com','2004-10-24','3 Anderson Park','Lexington','KY',54868,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (3,'Felic','Sutheran','504-401-9940','fsutheran2@51.la','2015-10-04','45 Hazelcrest Drive','New Orleans','LA',93095,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (4,'Westley','Simeon','703-612-5172','wsimeon3@google.com.br','1990-07-14','9118 Northridge Place','Arlington','VA',47122,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (5,'Gillian','Eberst','570-389-3001','geberst4@discuz.net','2008-04-27','411 Northridge Drive','Wilkes Barre','PA',29953,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (6,'Scarface','Quare','502-536-5046','square5@mit.edu','2022-09-11','96914 Gulseth Avenue','Louisville','KY',12614,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (7,'Adriaens','Melody','661-615-1769','amelody6@oaic.gov.au','2008-02-17','935 Raven Pass','Bakersfield','CA',49575,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (8,'Kaleb','Godson','480-793-2732','kgodson7@4shared.com','1991-06-02','56 Parkside Alley','Phoenix','AZ',24714,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (9,'Hieronymus','MacNish','916-390-7117','hmacnish8@harvard.edu','1995-04-22','832 Parkside Way','Sacramento','CA',86066,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (10,'Harrietta','Baumer','405-641-9866','hbaumer9@themeforest.net','2007-03-07','24158 New Castle Circle','Oklahoma City','OK',20205,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (11,'Ellissa','Pacheco','843-206-1973','epachecoa@rambler.ru','2015-11-09','0286 Forest Run Parkway','Florence','SC',46281,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (12,'Thom','Danaher','760-276-0217','tdanaherb@scribd.com','1990-11-05','9 Pankratz Trail','Oceanside','CA',12673,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (13,'Edna','Woolen','619-566-0387','ewoolenc@sohu.com','2007-08-10','2718 Longview Point','San Diego','CA',43124,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (14,'Gasparo','Dmisek','210-457-3075','gdmisekd@virginia.edu','2019-02-24','0 Vahlen Trail','San Antonio','TX',79407,'US');
INSERT INTO Customers(CustomerID,FirstName,LastName,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (15,'Arabele','Cockings','812-931-2099','acockingse@moonfruit.com','2003-03-12','65 Lunder Road','Terre Haute','IN',39440,'US');

INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (1,9,982.46,621,'1U',41,'Normal',15);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (2,3,619.04,197,'7I',81,'Normal',5);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (3,4,799.65,037,'8G',33,'Backstage',11);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (4,13,976.69,278,'9B',52,'Normal',7);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (5,6,527.38,407,'4H',62,'Normal',NULL);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (6,10,212.83,725,'1E',46,'Normal',15);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (7,8,884.06,652,'5M',02,'Normal',11);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (8,1,916.17,684,'8V',47,'Normal',3);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (9,15,470.66,770,'2X',91,'Normal',NULL);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (10,14,428.48,823,'1B',66,'Normal',2);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (11,7,414.13,225,'1Z',30,'Backstage',14);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (12,12,031.97,174,'9C',93,'Normal',4);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (13,11,964.57,270,'0J',49,'Backstage',NULL);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (14,2,753.58,207,'0U',36,'Normal',2);
INSERT INTO Tickets(TicketID,VenueID,Price,Seat_Row,Section,Seat_Column,Type,CustomerID) VALUES (15,5,809.06,705,'3E',48,'Normal',14);

INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (1,'Sandro','Engeham','502-782-5734','sengeham0@wiley.com','0 Forest Dale Way','Louisville','KY',59179,'US','4','Emergency Contact');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (2,'Eal','Wallhead','805-498-4138','ewallhead1@wikipedia.org','96820 Gulseth Hill','San Mateo','CA',23258,'US','7','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (3,'Zola','Insull','702-584-7775','zinsull2@walmart.com','71326 Kensington Circle','Las Vegas','NV',88329,'US','1','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (4,'Jaquelin','Pedlingham','952-560-8759','jpedlingham3@spiegel.de','00525 Mandrake Way','Young America','MN',28438,'US','11','Cousin');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (5,'Torin','Pelham','407-104-9062','tpelham4@sogou.com','4 Eagle Crest Center','Orlando','FL',65002,'US','12','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (6,'Isadora','Doughartie','602-219-7497','idoughartie5@yellowpages.com','14 Sloan Pass','Phoenix','AZ',84852,'US','13','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (7,'Preston','Reagan','540-515-4435','preagan6@reference.com','08 Union Parkway','Roanoke','VA',29782,'US','4','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (8,'Harper','Longworth','803-576-9090','hlongworth7@fotki.com','8784 Hanover Way','Columbia','SC',82034,'US','14','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (9,'Flossie','Le Gallo','415-143-9191','flegallo8@i2i.jp','1749 Trailsway Point','San Francisco','CA',38623,'US','11','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (10,'Thelma','Heinke','716-220-8216','theinke9@howstuffworks.com','8487 Sugar Alley','Buffalo','NY',86674,'US','3','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (11,'Annie','Rubrow','318-251-5311','arubrowa@yale.edu','7 Dixon Court','Shreveport','LA',69721,'US','10','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (12,'Franny','Syncke','202-146-8272','fsynckeb@theguardian.com','73106 Red Cloud Street','Washington','DC',21839,'US','3','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (13,'Laurie','Shay','916-290-1034','lshayc@networksolutions.com','8673 Union Center','Sacramento','CA',59336,'US','14','Sister');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (14,'Terri-jo','Coggon','716-210-2638','tcoggond@hugedomains.com','6 Manley Court','Buffalo','NY',89631,'US','15','Friend');
INSERT INTO Dependent(DependentID,FirstName,LastName,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (15,'Elnore','Garnett','336-290-5828','egarnette@webnode.com','20 Basil Street','Greensboro','NC',50032,'US','3','Friend');

INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (1,'2022-02-03','Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.',10,3);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (2,'2022-09-06','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.',13,13);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (3,'2020-04-07','In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.',14,12);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (4,'2020-08-23','Nunc purus. Phasellus in felis. Donec semper sapien a libero.',2,9);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (5,'2023-04-02','In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.',3,1);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (6,'2022-05-13','Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.',11,15);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (7,'2023-09-01','Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.',8,6);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (8,'2024-10-04','Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',6,11);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (9,'2023-06-12','Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',1,10);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (10,'2020-04-14','Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.',7,7);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (11,'2022-09-08','Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.',4,14);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (12,'2020-01-07','In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.',9,8);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (13,'2021-08-22','Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',15,2);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (14,'2022-09-28','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.',5,5);
INSERT INTO Performance(PerformanceID,Date,Description,ArtistID,VenueID) VALUES (15,'2022-07-10','Etiam pretium iaculis justo. In hac habitasse platea dictumst.',12,4);


INSERT INTO Genre(Name) VALUES ('Hip-Hop');
INSERT INTO Genre(Name) VALUES ('Rap');
INSERT INTO Genre(Name) VALUES ('Country');
INSERT INTO Genre(Name) VALUES ('Rock');
INSERT INTO Genre(Name) VALUES ('R&B');
INSERT INTO Genre(Name) VALUES ('Jazz');

INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('R&B',9);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('R&B',2);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('R&B',15);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('R&B',5);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Rock',1);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('R&B',4);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Hip-Hop',12);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('R&B',10);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Country',7);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Jazz',3);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Rap',11);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Rock',14);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Jazz',8);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Jazz',13);
INSERT INTO Artist_Genres(Genre,ArtistID) VALUES ('Hip-Hop',6);

INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Jazz',14);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Rap',13);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('R&B',11);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Rap',2);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Rap',4);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Rock',8);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Rock',1);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Hip-Hop',6);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Rock',15);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Hip-Hop',3);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Jazz',12);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('R&B',7);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Rock',9);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Hip-Hop',10);
INSERT INTO Performance_Genres(Genre,PerformanceID) VALUES ('Country',5);

INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('14',4);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('9',1);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('11',11);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('8',3);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('15',8);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('12',6);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('10',14);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('1',13);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('3',9);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('6',2);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('5',15);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('2',7);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('7',5);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('13',10);
INSERT INTO Fan_Of(ArtistID,CustomerID) VALUES ('4',12);
