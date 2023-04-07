CREATE DATABASE IF NOT EXISTS SeatWise;

USE SeatWise;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Venues;

CREATE TABLE Venues (
    VenueID int PRIMARY KEY,
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
    OwnerID int PRIMARY KEY,
    OwnerName varchar(255) NOT NULL,
    PhoneNumber varchar(25) UNIQUE NOT NULL,
    Email varchar(255) UNIQUE NOT NULL,
    CONSTRAINT u_email UNIQUE (Email),
    CONSTRAINT u_ph UNIQUE (PhoneNumber)
);

DROP TABLE IF EXISTS Artists;

CREATE TABLE Artists (
    ArtistID int PRIMARY KEY,
    ArtistName varchar(255) NOT NULL,
    PhoneNumber varchar(25) UNIQUE NOT NULL,
    Email varchar(255) UNIQUE NOT NULL,
    Description varchar(255),
    CONSTRAINT u_email UNIQUE (Email),
    CONSTRAINT u_ph UNIQUE (PhoneNumber)
);

DROP TABLE IF EXISTS Contract;

CREATE TABLE Contract (
    ContractID int PRIMARY KEY,
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
    CustomerID int PRIMARY KEY,
    Name varchar(255) NOT NULL,
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
    TicketID int NOT NULL,
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
    Name varchar(255) NOT NULL,
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

INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (1,'Shamus','796-285-5583','skildahl0@senate.gov');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (2,'Kali','883-615-8625','kainsbury1@hp.com');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (3,'Brunhilda','232-669-3355','bgertz2@parallels.com');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (4,'Annaliese','112-960-4668','afeldmann3@illinois.edu');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (5,'Samaria','654-645-2125','sspuffard4@imageshack.us');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (6,'Lyndell','682-327-3718','lsiflet5@livejournal.com');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (7,'Alvera','535-876-4181','alazenbury6@cbc.ca');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (8,'Minny','875-452-8024','mdadds7@ucla.edu');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (9,'Bar','481-706-7057','brickis8@uol.com.br');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (10,'Maegan','203-418-4874','mkenworth9@jigsy.com');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (11,'Laural','658-605-3847','lbiddlestona@webeden.co.uk');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (12,'Matilde','193-380-1626','miornsb@paginegialle.it');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (13,'Marshal','227-242-9297','mwyethc@bluehost.com');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (14,'Sherline','838-979-8348','shusselld@constantcontact.com');
INSERT INTO VenueOwner(OwnerID,OwnerName,PhoneNumber,Email) VALUES (15,'Selby','599-360-1301','seschellee@parallels.com');

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

INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (1,'Olly','176-778-8884','omennell0@nbcnews.com','elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (2,'Leonie','663-661-9293','lgrubb1@irs.gov','lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (3,'Petronella','604-810-9515','pdanett2@redcross.org','tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (4,'Mortie','561-740-8672','mchastel3@instagram.com','montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (5,'Giff','262-653-6444','gslocombe4@china.com.cn','elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (6,'Drake','804-319-7416','ddebernardis5@npr.org','vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (7,'Flossy','861-270-9209','fbolstridge6@tamu.edu','erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (8,'Rik','587-350-3737','rhattrick7@hhs.gov','tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (9,'Michaelina','386-198-5471','mpeete8@taobao.com','convallis nunc proin at turpis a pede posuere nonummy integer');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (10,'Ernaline','642-527-3294','etry9@histats.com','quisque ut erat curabitur gravida nisi at nibh in hac');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (11,'Ephrayim','243-467-3629','eblakemorea@wordpress.com','vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (12,'Rodney','220-110-8757','raspinallb@deliciousdays.com','phasellus sit amet erat nulla tempus vivamus in felis eu');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (13,'Stephan','620-918-1669','smeldingc@washingtonpost.com','est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (14,'Krissie','831-281-7935','kspellworthd@xrea.com','sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor');
INSERT INTO Artists(ArtistID,ArtistName,PhoneNumber,Email,Description) VALUES (15,'Cahra','854-750-3767','cspeedine@alibaba.com','leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero');

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

INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (1,'Ruperta','415-281-1408','relliston0@nymag.com','2004-07-04','7 Old Shore Way','San Francisco','CA',69959,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (2,'Olwen','509-428-9971','obubear1@washington.edu','2013-05-09','94586 Kropf Trail','Yakima','WA',85865,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (3,'Lin','541-953-2574','lokker2@msn.com','1992-01-19','08 Carey Avenue','Eugene','OR',43773,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (4,'Laurent','813-728-5891','lhaighton3@cafepress.com','2013-05-01','5 Dorton Street','Tampa','FL',00901,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (5,'Guss','214-403-2062','gapfler4@infoseek.co.jp','1993-04-08','98 Lerdahl Terrace','Dallas','TX',08793,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (6,'Courtnay','419-926-3256','crispen5@flickr.com','2010-01-28','3575 Mallard Parkway','Lima','OH',51308,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (7,'Aldridge','405-249-1720','aibbott6@omniture.com','2020-11-19','35 Comanche Place','Norman','OK',79474,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (8,'Carly','713-285-4563','csalter7@phoca.cz','2015-08-22','8446 Rockefeller Terrace','Houston','TX',87470,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (9,'Nadeen','941-862-8218','nbracco8@oaic.gov.au','2021-05-03','62769 Shoshone Drive','Bonita Springs','FL',57864,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (10,'Jackquelin','952-257-3525','jtulloch9@163.com','1996-07-30','17098 Birchwood Circle','Young America','MN',13020,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (11,'Karry','757-912-1024','kwiddecombea@bigcartel.com','1990-06-16','8 Pankratz Avenue','Norfolk','VA',60097,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (12,'Cacilia','309-499-0379','csnarttb@marriott.com','1996-05-30','117 Dunning Hill','Carol Stream','IL',96149,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (13,'Nanete','330-603-1642','npaquetc@opera.com','2014-11-12','5 Forster Center','Akron','OH',88089,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (14,'Tuesday','806-887-0488','trotted@cnbc.com','2014-04-07','8 Lakewood Court','Lubbock','TX',68959,'US');
INSERT INTO Customers(CustomerID,Name,PhoneNumber,Email,DOB,Street,City,State,Zipcode,Country) VALUES (15,'Annabella','860-457-2330','ahenlone@jalbum.net','2015-07-29','42540 Welch Crossing','Hartford','CT',28193,'US');

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

INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (1,'Mufinella','812-582-4678','msimoneton0@ask.com','85668 Arizona Way','Evansville','IN',41789,'US',5,'Friend');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (2,'Delphinia','904-135-7028','dmeriel1@godaddy.com','41493 American Ash Pass','Jacksonville','FL',32946,'US',6,'Friend');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (3,'Lurline','317-742-0801','lturfrey2@devhub.com','264 Grayhawk Parkway','Indianapolis','IN',94258,'US',11,'Friend');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (4,'Forrester','585-581-1528','fnaseby3@furl.net','6 Service Court','Rochester','NY',60468,'US',9,'Parent');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (5,'Brina','775-513-4173','bmoyers4@sina.com.cn','8 Holy Cross Road','Reno','NV',50408,'US',13,'Brother');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (6,'Tracey','518-575-2482','tjosefs5@twitpic.com','87115 Havey Circle','Albany','NY',03172,'US',4,'Emergency Contact');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (7,'Gae','973-416-8214','gwyer6@imdb.com','05 Maywood Center','Paterson','NJ',56313,'US',2,'Emergency Contact');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (8,'Emlen','832-801-3167','esawell7@so-net.ne.jp','106 Delladonna Trail','Houston','TX',48709,'US',10,'Emergency Contact');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (9,'Starla','404-685-5950','svideler8@scientificamerican.com','9 Knutson Drive','Atlanta','GA',45100,'US',7,'Friend');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (10,'Shepard','952-816-5980','smannock9@wisc.edu','801 Ronald Regan Parkway','Young America','MN',22655,'US',3,'Parent');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (11,'Trista','770-722-4891','tcogmana@webeden.co.uk','8151 Magdeline Street','Norcross','GA',59728,'US',12,'Cousin');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (12,'Kelley','502-122-0937','knassaub@earthlink.net','7 Hansons Way','Louisville','KY',94375,'US',1,'Emergency Contact');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (13,'Jaimie','610-292-6162','jtaggartc@drupal.org','90823 Brickson Park Court','Bethlehem','PA',88949,'US',8,'Friend');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (14,'Appolonia','206-593-2587','abirksd@gizmodo.com','86077 Lukken Street','Bellevue','WA',14436,'US',15,'Friend');
INSERT INTO Dependent(DependentID,Name,PhoneNumber,Email,Street,City,State,Zipcode,Country,Parent,Relationship) VALUES (15,'Mohandas','816-753-8524','mwhitlame@indiatimes.com','11 Kenwood Center','Kansas City','MO',51409,'US',14,'Emergency Contact');

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
