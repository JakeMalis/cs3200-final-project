DROP
SCHEMA IF EXISTS musicdb;
CREATE
DATABASE musicdb;
USE musicdb;

CREATE TABLE Artist
(
    ArtistID   INT PRIMARY KEY,
    LegalName  VARCHAR(255),
    StageName  VARCHAR(255),
    Age        INT,
    Popularity FLOAT,
    LabelID    INT REFERENCES Label (LabelID)
);

CREATE TABLE Song
(
    SongID       INT PRIMARY KEY,
    SongTitle    VARCHAR(255),
    BPM          INT,
    Danceability FLOAT,
    Duration     FLOAT,
    NumStreams   INT,
    ReleaseDate  DATE,
    AlbumID      INT REFERENCES Album (AlbumID)
);

CREATE TABLE Album
(
    AlbumID     INT PRIMARY KEY,
    AlbumTitle VARCHAR(255),
    ReleaseDate DATE,
    NumTracks   INT,
    Popularity  FLOAT
);

CREATE TABLE Genre
(
    GenreID    INT PRIMARY KEY,
    GenreName  VARCHAR(255),
    Popularity FLOAT
);

CREATE TABLE SongGenre
(
    PRIMARY KEY (GenreID, SongID),
    GenreID INT REFERENCES Genre (GenreID),
    SongID  INT REFERENCES Song (SongID)
);

CREATE TABLE Chart
(
    ChartID   INT PRIMARY KEY,
    ChartName VARCHAR(255)
);

CREATE TABLE SongChart
(
    PRIMARY KEY (ChartID, SongID),
    ChartID INT REFERENCES Chart (ChartID),
    SongID  INT REFERENCES Song (SongID)
);

CREATE TABLE Playlist
(
    PlaylistID         INT PRIMARY KEY,
    PlaylistName       VARCHAR(255),
    NumTracks          INT,
    TotalListeningTime FLOAT
);

CREATE TABLE SongPlaylist
(
    PRIMARY KEY (PlaylistID, SongID),
    PlaylistID INT REFERENCES Playlist (PlaylistID),
    SongID     INT REFERENCES Song (SongID)
);

CREATE TABLE Tour
(
    TourID      INT PRIMARY KEY,
    Name        VARCHAR(255),
    DateAndTime DATETIME
);

CREATE TABLE ArtistTour
(
    PRIMARY KEY (TourID, ArtistID),
    TourID   INT REFERENCES Tour (TourID),
    ArtistID INT REFERENCES Artist (ArtistID)
);

CREATE TABLE Region
(
    RegionID  INT PRIMARY KEY,
    Name      VARCHAR(255),
    Location  VARCHAR(255),
    Continent VARCHAR(255),
    Country   VARCHAR(255),
    State     VARCHAR(255),
    City      VARCHAR(255)
);

CREATE TABLE TourRegion
(
    PRIMARY KEY (TourID, RegionID),
    TourID   INT REFERENCES Tour (TourID),
    RegionID INT REFERENCES Region (RegionID)
);

CREATE TABLE Merchandise
(
    MerchandiseID   INT PRIMARY KEY,
    MerchandiseName VARCHAR(255),
    MerchandiseType VARCHAR(255),
    Price           FLOAT
);

CREATE TABLE MerchandiseArtist
(
    PRIMARY KEY (MerchandiseID, ArtistID),
    MerchandiseID INT REFERENCES Merchandise (MerchandiseID),
    ArtistID      INT REFERENCES Artist (ArtistID)
);

CREATE TABLE Label
(
    LabelID   INT PRIMARY KEY,
    LabelName VARCHAR(255)
);

CREATE TABLE ArtistProducer
(
    PRIMARY KEY (ProducerID, ArtistID),
    ProducerID INT REFERENCES Producer (ProducerID),
    ArtistID   INT REFERENCES Artist (ArtistID)
);

CREATE TABLE Producer
(
    ProducerID   INT PRIMARY KEY,
    ProducerName VARCHAR(255)
);

CREATE TABLE SocialMedia
(
    PRIMARY KEY (Instagram, GenreID, Name),
    Instagram  VARCHAR(255),
    Name       VARCHAR(255),
    Popularity FLOAT,
    GenreID    INT REFERENCES Genre (GenreID),
    ArtistID   INT REFERENCES Artist (ArtistID)
);

INSERT INTO Artist (ArtistID, LegalName, StageName, Age, Popularity, LabelID) VALUES
(1, 'John Smith', 'J-Smith', 25, 0.7, 1),
(2, 'Jane Doe', 'J-Doe', 30, 0.9, 2),
(3, 'David Lee', 'D-Lee', 40, 0.6, 3),
(4, 'Sarah Brown', 'S-Brown', 27, 0.8, 2),
(5, 'Kevin Kim', 'K-Kim', 35, 0.5, 1);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (6,'Lorne Shinefield','Aerified',13,69.53,267);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (7,'Fred Garett','Overhold',48,98.23,366);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (8,'Ebonee Tams','Alphazap',58,59.99,499);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (9,'Rosie McGeorge','Regrant',28,27.65,27);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (10,'Guillermo Glandfield','Stronghold',51,80.89,592);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (11,'Leena Salzberger','Y-Solowarm',25,21.7,6);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (12,'Fenelia Keig','Domainer',47,91.35,478);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (13,'Cinderella Gabbitus','Hatity',61,63.62,872);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (14,'Vevay Hucker','Matsoft',54,95.99,974);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (15,'Devlin Esgate','Redhold',51,75.27,939);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (16,'Baxy Revens','Voyatouch',53,99.63,276);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (17,'Pepillo Hampshaw','Sonair',46,72.7,308);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (18,'Brandice Govinlock','Cardify',11,45.62,977);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (19,'Reidar Sparshott','Cardguard',61,10.06,479);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (20,'Estrellita Ceschi','Y-Solowarm',56,96.19,746);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (21,'Adey Salkild','Bitchip',43,38.32,616);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (22,'Kali Bunning','Treeflex',11,89.5,10);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (23,'Mick Pflieger','Flowdesk',16,42.13,518);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (24,'Obidiah Mergue','Subin',34,14.86,138);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (25,'Romain Bickerstasse','Bytecard',57,78.83,280);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (26,'Kaylee Triplett','Biodex',53,72.5,68);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (27,'Case Moogan','Cardify',41,18.91,233);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (28,'Gladi Greensted','Viva',53,32.3,2);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (29,'Magdaia Bartolomeazzi','Prodder',30,13.61,352);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (30,'Janek Caine','Redhold',30,56.84,170);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (31,'Richmound Acutt','Andalax',62,98.78,737);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (32,'Andrej Duxbury','Viva',57,15.08,928);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (33,'Raff Ebi','Aerified',29,83.98,846);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (34,'Lanny Arnopp','Quo Lux',29,48.78,68);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (35,'Olvan Briereton','Matsoft',67,50.67,285);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (36,'Allene Balser','Y-Solowarm',30,86.46,992);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (37,'Dewain Haughey','Alphazap',68,71.86,984);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (38,'Agnese Venditti','Rank',64,35.58,824);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (39,'Kirk Dobbin','Cardguard',45,6.28,805);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (40,'Rosina Hennemann','Fixflex',52,7.01,777);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (41,'Teirtza Ortiga','Voyatouch',16,52.28,269);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (42,'Marni Morden','Bytecard',67,95.43,936);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (43,'Lemar Lillo','Duobam',64,10.48,969);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (44,'Traver Symington','Bitwolf',43,90.72,555);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (45,'Dona Whitney','Viva',67,96.62,970);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (46,'Nye Bimson','Ronstring',27,18.64,665);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (47,'Delmar Ellwand','Mat Lam Tam',24,31.91,978);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (48,'Ingemar Sturman','Bytecard',36,63.64,870);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (49,'Geraldine Yeskov','Holdlamis',51,99.09,558);
INSERT INTO Artist(ArtistID,LegalName,StageName,Age,Popularity,LabelID) VALUES (50,'Bonnee Bullivant','Stringtough',35,43.62,474);


INSERT INTO Song (SongID, SongTitle, BPM, Danceability, Duration, NumStreams, ReleaseDate, AlbumID) VALUES
(1, 'Stacy', 120, 0.8, 3.5, 1000000, '2020-01-01', 1),
(2, 'Daisy', 100, 0.6, 4.2, 800000, '2019-05-15', 2),
(3, 'Rosalia', 140, 0.9, 2.8, 500000, '2021-02-28', 3),
(4, 'Maria', 80, 0.5, 5.1, 1200000, '2018-10-10', 2),
(5, 'Hello', 160, 0.7, 3.9, 900000, '2022-03-20', 1);

INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (6,'Gordan',46,64.03,9.55,629125914,'2022-10-31',4);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (7,'Marven',43,59.43,4.64,293653205,'2023-02-26',25);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (8,'Menard',23,25.76,6.07,277236017,'2023-02-11',12);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (9,'Avis',88,20.87,9.08,326474850,'2022-10-10',44);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (10,'Harold',54,47.56,9.59,189234657,'2023-01-28',10);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (11,'Nat',64,73.87,3.37,184145442,'2023-02-04',5);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (12,'Ellissa',77,89.33,2.07,284896490,'2022-07-27',37);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (13,'Homer',37,32.17,7.34,368355810,'2022-10-12',30);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (14,'Jennifer',70,5.81,5.29,847261904,'2022-12-11',24);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (15,'Aylmar',9,72.22,6.48,758859010,'2022-11-07',37);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (16,'Mel',59,22.87,2.4,214366222,'2022-06-02',1);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (17,'Nonie',1,52.19,3.33,234064970,'2023-01-14',46);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (18,'Nady',59,27.07,8.69,812324784,'2022-09-25',5);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (19,'Gerry',71,57.3,8.3,615181623,'2022-06-30',29);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (20,'Carmita',47,68.12,5.27,229627727,'2022-09-30',32);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (21,'Heda',9,72.33,9.4,351082415,'2022-04-20',42);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (22,'Dav',13,31.39,1.91,325046138,'2022-08-14',16);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (23,'Hakeem',99,85.36,6.74,868123509,'2023-03-28',34);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (24,'Ulrica',79,34.27,8.85,624050578,'2022-11-10',9);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (25,'Cherida',9,1.42,5.42,877391300,'2022-08-17',34);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (26,'Jolene',68,73.53,9.41,28433370,'2022-06-14',12);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (27,'Luigi',24,60.69,9.47,102062369,'2022-08-11',48);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (28,'Candy',88,85.74,8.03,660201346,'2022-08-23',25);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (29,'Wang',42,86.84,2.78,714713891,'2022-06-03',8);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (30,'Tudor',93,74.13,3.2,623517191,'2022-08-27',19);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (31,'Charis',2,43.9,2.98,453670987,'2022-06-23',50);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (32,'Miriam',72,7.73,3.6,509201888,'2022-08-02',23);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (33,'Henrieta',26,86.78,6.38,298564304,'2022-06-05',42);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (34,'Lilly',74,51.54,2.13,452162039,'2022-06-06',32);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (35,'Egon',28,77.53,4.35,68196344,'2023-02-14',47);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (36,'Ulrikaumeko',56,43.03,3.42,588862536,'2023-03-25',6);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (37,'Thibaut',33,71.9,7.79,254352175,'2022-07-17',46);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (38,'Joly',53,58.86,4.26,668829239,'2022-11-14',4);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (39,'Burk',19,21.05,8.9,787956839,'2022-12-09',3);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (40,'Ermin',62,31.62,9.92,278261974,'2022-05-13',48);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (41,'Anastassia',56,25.2,6.2,193383860,'2022-08-23',22);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (42,'Kaia',65,8.38,9.56,62728073,'2022-11-24',15);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (43,'Aldin',56,44.56,4.35,543252954,'2022-12-25',36);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (44,'Violante',91,34.19,5.35,620511856,'2022-09-22',28);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (45,'Ethelred',55,61.55,6.66,444630885,'2022-10-04',25);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (46,'Stace',85,79.58,5.2,335777609,'2022-05-24',49);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (47,'Durward',58,39.13,5.05,860345561,'2023-02-15',39);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (48,'Marchelle',1,49.79,5.88,98206579,'2022-08-13',37);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (49,'Ericka',16,41.4,3.0,691963765,'2022-05-30',12);
INSERT INTO Song(SongID,SongTitle,BPM,Danceability,Duration,NumStreams,ReleaseDate,AlbumID) VALUES (50,'Ivory',62,62.88,6.86,635502386,'2022-06-23',50);


INSERT INTO Album (AlbumID, AlbumTitle, ReleaseDate, NumTracks, Popularity) VALUES
(1, 'Album A', '2020-01-01', 10, 0.7),
(2, 'Album B', '2019-05-15', 12, 0.9),
(3, 'Album C', '2021-02-28', 8, 0.6),
(4, 'Album D', '2018-10-10', 14, 0.8),
(5, 'Album E', '2022-03-20', 9, 0.5);

INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (6,'Namfix','2022-10-05',4,72.54);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (7,'Temp','1992-08-23',13,21.56);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (8,'Y-Solowarm','1995-10-15',12,35.05);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (9,'Holdlamis','1973-10-30',27,93.04);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (10,'Transcof','1970-11-04',22,11.54);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (11,'Holdlamis','2010-04-17',27,79.84);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (12,'Hatity','1989-05-22',18,77.26);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (13,'Zontrax','2018-02-11',6,85.1);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (14,'Flowdesk','2012-09-06',18,59.08);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (15,'Zathin','2022-10-31',5,86.15);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (16,'Zamit','2003-01-05',27,79.13);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (17,'Bytecard','1971-05-13',11,14.24);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (18,'Tres-Zap','1989-11-25',9,38.16);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (19,'Subin','2018-04-19',10,83.67);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (20,'Cookley','2007-01-06',5,30.88);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (21,'Voyatouch','1994-02-06',15,18.03);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (22,'Span','2005-12-11',2,12.07);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (23,'Trippledex','2021-06-10',12,96.69);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (24,'Konklab','2005-09-17',19,14.87);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (25,'Voltsillam','1993-03-07',14,60.16);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (26,'Voltsillam','1980-10-31',24,10.27);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (27,'Aerified','1978-06-15',21,76.69);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (28,'Transcof','1995-08-09',21,55.42);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (29,'Alpha','1993-08-25',11,71.71);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (30,'Kanlam','1972-06-22',24,26.57);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (31,'Sonair','2002-08-31',7,75.58);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (32,'Lotlux','1978-01-23',28,1.18);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (33,'Domainer','2007-04-23',19,85.82);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (34,'Namfix','1996-02-29',1,51.43);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (35,'Biodex','2013-04-21',26,38.77);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (36,'Tres-Zap','1974-11-09',23,5.8);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (37,'Hatity','2015-10-13',18,80.78);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (38,'Transcof','1988-06-26',8,48.93);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (39,'Solarbreeze','1977-07-03',17,19.25);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (40,'Tin','1997-07-08',2,96.92);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (41,'Latlux','1992-10-29',18,49.24);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (42,'Home Ing','1977-03-26',24,2.24);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (43,'Quo Lux','1989-08-29',17,88.53);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (44,'Flowdesk','1973-12-12',22,84.29);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (45,'Bitwolf','1974-09-11',5,65.18);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (46,'Fintone','1988-03-08',21,20.65);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (47,'Job','2006-03-12',3,41.14);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (48,'Wrapsafe','2023-01-29',1,6.66);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (49,'Zaam-Dox','1999-10-01',10,38.37);
INSERT INTO Album(AlbumID,AlbumTitle,ReleaseDate,NumTracks,Popularity) VALUES (50,'Tempsoft','1986-11-15',23,80.4);


INSERT INTO Genre (GenreID, GenreName, Popularity) VALUES
(1, 'Pop', 0.8),
(2, 'Rock', 0.7),
(3, 'Hip-hop', 0.6),
(4, 'Country', 0.5),
(5, 'Electronic', 0.4);

INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (6,'Comedy|Drama',44.33);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (7,'Drama',48.27);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (8,'Comedy',30.63);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (9,'Horror|Thriller',78.55);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (10,'Comedy|Drama|Romance',16.74);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (11,'Action|Sci-Fi',85.48);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (12,'Action|Crime|Drama',45.28);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (13,'Adventure|Comedy|Crime',38.19);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (14,'Comedy|Drama|Fantasy',29.31);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (15,'Adventure|Drama|Romance',77.34);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (16,'Comedy|Crime|Thriller',46.82);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (17,'Documentary',9.2);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (18,'Comedy|Drama',64.29);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (19,'(no genres listed)',79.99);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (20,'Drama|War',22.32);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (21,'Action|Adventure|Sci-Fi',54.69);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (22,'Comedy|Drama|Romance',17.21);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (23,'Action|Drama',11.63);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (24,'Crime|Drama|Mystery|Thriller',55.61);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (25,'Action',62.9);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (26,'Drama',72.92);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (27,'Documentary',12.6);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (28,'Drama',37.37);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (29,'Drama',62.14);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (30,'Adventure|Horror|Sci-Fi',20.33);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (31,'Drama',65.91);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (32,'Animation|Children',59.73);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (33,'Action|Thriller|War',54.19);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (34,'Comedy|Horror',57.19);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (35,'Horror|Sci-Fi',21.1);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (36,'Drama',22.0);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (37,'Drama|Mystery|Romance|Thriller',81.12);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (38,'Comedy|Romance',6.34);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (39,'Documentary',28.44);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (40,'Comedy|Drama|Romance',96.09);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (41,'Action',72.12);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (42,'Comedy|Drama',67.63);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (43,'Comedy|Musical|Romance',61.18);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (44,'Sci-Fi',16.13);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (45,'Drama',82.22);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (46,'Comedy|Drama|Romance',4.64);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (47,'Drama',61.99);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (48,'(no genres listed)',25.75);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (49,'Drama',50.32);
INSERT INTO Genre(GenreID,GenreName,Popularity) VALUES (50,'Western',38.13);


INSERT INTO SongGenre (GenreID, SongID) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 2),
(2, 4),
(2, 5),
(3, 1),
(3, 3),
(3, 4),
(4, 1),
(4, 3),
(5, 2),
(5, 5);

INSERT INTO SongGenre(SongID,GenreID) VALUES (34,48);
INSERT INTO SongGenre(SongID,GenreID) VALUES (33,26);
INSERT INTO SongGenre(SongID,GenreID) VALUES (43,38);
INSERT INTO SongGenre(SongID,GenreID) VALUES (47,44);
INSERT INTO SongGenre(SongID,GenreID) VALUES (38,47);
INSERT INTO SongGenre(SongID,GenreID) VALUES (18,40);
INSERT INTO SongGenre(SongID,GenreID) VALUES (24,3);
INSERT INTO SongGenre(SongID,GenreID) VALUES (27,46);
INSERT INTO SongGenre(SongID,GenreID) VALUES (32,27);
INSERT INTO SongGenre(SongID,GenreID) VALUES (46,10);
INSERT INTO SongGenre(SongID,GenreID) VALUES (13,24);
INSERT INTO SongGenre(SongID,GenreID) VALUES (45,47);
INSERT INTO SongGenre(SongID,GenreID) VALUES (32,33);
INSERT INTO SongGenre(SongID,GenreID) VALUES (20,19);
INSERT INTO SongGenre(SongID,GenreID) VALUES (3,20);
INSERT INTO SongGenre(SongID,GenreID) VALUES (48,11);
INSERT INTO SongGenre(SongID,GenreID) VALUES (43,14);
INSERT INTO SongGenre(SongID,GenreID) VALUES (47,23);
INSERT INTO SongGenre(SongID,GenreID) VALUES (18,11);
INSERT INTO SongGenre(SongID,GenreID) VALUES (33,20);
INSERT INTO SongGenre(SongID,GenreID) VALUES (12,8);
INSERT INTO SongGenre(SongID,GenreID) VALUES (5,10);
INSERT INTO SongGenre(SongID,GenreID) VALUES (34,41);
INSERT INTO SongGenre(SongID,GenreID) VALUES (39,42);
INSERT INTO SongGenre(SongID,GenreID) VALUES (11,10);
INSERT INTO SongGenre(SongID,GenreID) VALUES (4,22);
INSERT INTO SongGenre(SongID,GenreID) VALUES (26,8);
INSERT INTO SongGenre(SongID,GenreID) VALUES (13,12);
INSERT INTO SongGenre(SongID,GenreID) VALUES (12,36);
INSERT INTO SongGenre(SongID,GenreID) VALUES (18,27);
INSERT INTO SongGenre(SongID,GenreID) VALUES (30,41);
INSERT INTO SongGenre(SongID,GenreID) VALUES (10,20);
INSERT INTO SongGenre(SongID,GenreID) VALUES (2,36);
INSERT INTO SongGenre(SongID,GenreID) VALUES (43,49);
INSERT INTO SongGenre(SongID,GenreID) VALUES (50,38);
INSERT INTO SongGenre(SongID,GenreID) VALUES (20,14);
INSERT INTO SongGenre(SongID,GenreID) VALUES (10,16);
INSERT INTO SongGenre(SongID,GenreID) VALUES (3,27);
INSERT INTO SongGenre(SongID,GenreID) VALUES (9,29);
INSERT INTO SongGenre(SongID,GenreID) VALUES (15,19);
INSERT INTO SongGenre(SongID,GenreID) VALUES (29,30);
INSERT INTO SongGenre(SongID,GenreID) VALUES (32,32);
INSERT INTO SongGenre(SongID,GenreID) VALUES (47,35);
INSERT INTO SongGenre(SongID,GenreID) VALUES (1,11);
INSERT INTO SongGenre(SongID,GenreID) VALUES (8,12);
INSERT INTO SongGenre(SongID,GenreID) VALUES (50,1);
INSERT INTO SongGenre(SongID,GenreID) VALUES (14,30);
INSERT INTO SongGenre(SongID,GenreID) VALUES (40,25);
INSERT INTO SongGenre(SongID,GenreID) VALUES (23,7);
INSERT INTO SongGenre(SongID,GenreID) VALUES (25,50);
INSERT INTO SongGenre(SongID,GenreID) VALUES (7,2);
INSERT INTO SongGenre(SongID,GenreID) VALUES (14,12);
INSERT INTO SongGenre(SongID,GenreID) VALUES (33,49);
INSERT INTO SongGenre(SongID,GenreID) VALUES (22,11);
INSERT INTO SongGenre(SongID,GenreID) VALUES (21,45);
INSERT INTO SongGenre(SongID,GenreID) VALUES (16,31);
INSERT INTO SongGenre(SongID,GenreID) VALUES (31,40);
INSERT INTO SongGenre(SongID,GenreID) VALUES (34,39);
INSERT INTO SongGenre(SongID,GenreID) VALUES (7,44);
INSERT INTO SongGenre(SongID,GenreID) VALUES (43,32);
INSERT INTO SongGenre(SongID,GenreID) VALUES (24,32);
INSERT INTO SongGenre(SongID,GenreID) VALUES (21,48);
INSERT INTO SongGenre(SongID,GenreID) VALUES (39,29);
INSERT INTO SongGenre(SongID,GenreID) VALUES (48,8);
INSERT INTO SongGenre(SongID,GenreID) VALUES (35,43);
INSERT INTO SongGenre(SongID,GenreID) VALUES (37,34);
INSERT INTO SongGenre(SongID,GenreID) VALUES (47,20);
INSERT INTO SongGenre(SongID,GenreID) VALUES (44,32);
INSERT INTO SongGenre(SongID,GenreID) VALUES (8,46);
INSERT INTO SongGenre(SongID,GenreID) VALUES (2,7);
INSERT INTO SongGenre(SongID,GenreID) VALUES (20,30);
INSERT INTO SongGenre(SongID,GenreID) VALUES (3,36);
INSERT INTO SongGenre(SongID,GenreID) VALUES (10,2);
INSERT INTO SongGenre(SongID,GenreID) VALUES (4,13);
INSERT INTO SongGenre(SongID,GenreID) VALUES (50,41);
INSERT INTO SongGenre(SongID,GenreID) VALUES (2,43);
INSERT INTO SongGenre(SongID,GenreID) VALUES (6,19);
INSERT INTO SongGenre(SongID,GenreID) VALUES (5,22);
INSERT INTO SongGenre(SongID,GenreID) VALUES (48,9);
INSERT INTO SongGenre(SongID,GenreID) VALUES (31,24);
INSERT INTO SongGenre(SongID,GenreID) VALUES (1,21);
INSERT INTO SongGenre(SongID,GenreID) VALUES (9,35);
INSERT INTO SongGenre(SongID,GenreID) VALUES (19,27);
INSERT INTO SongGenre(SongID,GenreID) VALUES (21,16);
INSERT INTO SongGenre(SongID,GenreID) VALUES (35,18);
INSERT INTO SongGenre(SongID,GenreID) VALUES (27,26);
INSERT INTO SongGenre(SongID,GenreID) VALUES (11,5);
INSERT INTO SongGenre(SongID,GenreID) VALUES (23,20);
INSERT INTO SongGenre(SongID,GenreID) VALUES (38,14);
INSERT INTO SongGenre(SongID,GenreID) VALUES (16,12);
INSERT INTO SongGenre(SongID,GenreID) VALUES (18,31);
INSERT INTO SongGenre(SongID,GenreID) VALUES (45,32);
INSERT INTO SongGenre(SongID,GenreID) VALUES (35,10);
INSERT INTO SongGenre(SongID,GenreID) VALUES (27,44);
INSERT INTO SongGenre(SongID,GenreID) VALUES (12,7);
INSERT INTO SongGenre(SongID,GenreID) VALUES (48,18);
INSERT INTO SongGenre(SongID,GenreID) VALUES (14,28);
INSERT INTO SongGenre(SongID,GenreID) VALUES (23,10);
INSERT INTO SongGenre(SongID,GenreID) VALUES (48,45);
INSERT INTO SongGenre(SongID,GenreID) VALUES (49,47);
INSERT INTO SongGenre(SongID,GenreID) VALUES (11,26);
INSERT INTO SongGenre(SongID,GenreID) VALUES (50,23);
INSERT INTO SongGenre(SongID,GenreID) VALUES (24,9);
INSERT INTO SongGenre(SongID,GenreID) VALUES (22,28);
INSERT INTO SongGenre(SongID,GenreID) VALUES (27,42);
INSERT INTO SongGenre(SongID,GenreID) VALUES (31,27);
INSERT INTO SongGenre(SongID,GenreID) VALUES (15,43);
INSERT INTO SongGenre(SongID,GenreID) VALUES (20,35);
INSERT INTO SongGenre(SongID,GenreID) VALUES (35,3);
INSERT INTO SongGenre(SongID,GenreID) VALUES (22,22);
INSERT INTO SongGenre(SongID,GenreID) VALUES (13,34);
INSERT INTO SongGenre(SongID,GenreID) VALUES (34,33);
INSERT INTO SongGenre(SongID,GenreID) VALUES (50,36);
INSERT INTO SongGenre(SongID,GenreID) VALUES (37,30);
INSERT INTO SongGenre(SongID,GenreID) VALUES (3,2);
INSERT INTO SongGenre(SongID,GenreID) VALUES (28,9);
INSERT INTO SongGenre(SongID,GenreID) VALUES (48,14);
INSERT INTO SongGenre(SongID,GenreID) VALUES (37,21);
INSERT INTO SongGenre(SongID,GenreID) VALUES (24,23);
INSERT INTO SongGenre(SongID,GenreID) VALUES (11,12);

INSERT INTO Chart (ChartID, ChartName) VALUES
(1, 'Billboard Hot 100'),
(2, 'UK Top 40'),
(3, 'Oricon');

INSERT INTO Chart(ChartID,ChartName) VALUES (4,'Jacobs');
INSERT INTO Chart(ChartID,ChartName) VALUES (5,'Johnston-Ondricka');
INSERT INTO Chart(ChartID,ChartName) VALUES (6,'Schulist-LLC');
INSERT INTO Chart(ChartID,ChartName) VALUES (7,'Hammes-Buckridge');
INSERT INTO Chart(ChartID,ChartName) VALUES (8,'Tromp');
INSERT INTO Chart(ChartID,ChartName) VALUES (9,'Nolan');
INSERT INTO Chart(ChartID,ChartName) VALUES (10,'Mitchell-Botsford');
INSERT INTO Chart(ChartID,ChartName) VALUES (11,'Daniel');
INSERT INTO Chart(ChartID,ChartName) VALUES (12,'Hansen');
INSERT INTO Chart(ChartID,ChartName) VALUES (13,'Bauch');
INSERT INTO Chart(ChartID,ChartName) VALUES (14,'Hauck-Inc');
INSERT INTO Chart(ChartID,ChartName) VALUES (15,'Stanton-Anderson');
INSERT INTO Chart(ChartID,ChartName) VALUES (16,'Kemmer');
INSERT INTO Chart(ChartID,ChartName) VALUES (17,'Hammes-Group');
INSERT INTO Chart(ChartID,ChartName) VALUES (18,'Welch-Inc');
INSERT INTO Chart(ChartID,ChartName) VALUES (19,'Yundt-Kub');
INSERT INTO Chart(ChartID,ChartName) VALUES (20,'Stokes');
INSERT INTO Chart(ChartID,ChartName) VALUES (21,'Turner-Group');
INSERT INTO Chart(ChartID,ChartName) VALUES (22,'Grimes');
INSERT INTO Chart(ChartID,ChartName) VALUES (23,'Lubowitz-Stracke');
INSERT INTO Chart(ChartID,ChartName) VALUES (24,'Zboncak-Group');
INSERT INTO Chart(ChartID,ChartName) VALUES (25,'Rolfson');
INSERT INTO Chart(ChartID,ChartName) VALUES (26,'Hamill');
INSERT INTO Chart(ChartID,ChartName) VALUES (27,'Thiel-Sons');
INSERT INTO Chart(ChartID,ChartName) VALUES (28,'Hara-Schultz');
INSERT INTO Chart(ChartID,ChartName) VALUES (29,'Gislason-Stehr');
INSERT INTO Chart(ChartID,ChartName) VALUES (30,'Corkery-LLC');
INSERT INTO Chart(ChartID,ChartName) VALUES (31,'Ledner-Krajcik');
INSERT INTO Chart(ChartID,ChartName) VALUES (32,'MertzUpton');
INSERT INTO Chart(ChartID,ChartName) VALUES (33,'Kutch-Howell');
INSERT INTO Chart(ChartID,ChartName) VALUES (34,'Emmerich-Inc');
INSERT INTO Chart(ChartID,ChartName) VALUES (35,'Bartell-LLC');
INSERT INTO Chart(ChartID,ChartName) VALUES (36,'Maggio-Sawayn');
INSERT INTO Chart(ChartID,ChartName) VALUES (37,'Huels-Wehner');
INSERT INTO Chart(ChartID,ChartName) VALUES (38,'Ratke-Sons');
INSERT INTO Chart(ChartID,ChartName) VALUES (39,'Haag-Romaguera');
INSERT INTO Chart(ChartID,ChartName) VALUES (40,'Jacobson-Inc');
INSERT INTO Chart(ChartID,ChartName) VALUES (41,'Cassin');
INSERT INTO Chart(ChartID,ChartName) VALUES (42,'Gerhold-Group');
INSERT INTO Chart(ChartID,ChartName) VALUES (43,'Ankunding');
INSERT INTO Chart(ChartID,ChartName) VALUES (44,'Bogisich-Sons');
INSERT INTO Chart(ChartID,ChartName) VALUES (45,'Hesse-Hara');
INSERT INTO Chart(ChartID,ChartName) VALUES (46,'Wolff-Borer');
INSERT INTO Chart(ChartID,ChartName) VALUES (47,'Lehner-Feest');
INSERT INTO Chart(ChartID,ChartName) VALUES (48,'Rempel-Carroll');
INSERT INTO Chart(ChartID,ChartName) VALUES (49,'Koch-Inc');
INSERT INTO Chart(ChartID,ChartName) VALUES (50,'Kreiger-Inc');


INSERT INTO SongChart (ChartID, SongID) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(2, 3),
(2, 5),
(3, 2),
(3, 3),
(3, 5);

INSERT INTO SongChart(ChartID,SongID) VALUES (4,34);
INSERT INTO SongChart(ChartID,SongID) VALUES (20,1);
INSERT INTO SongChart(ChartID,SongID) VALUES (27,47);
INSERT INTO SongChart(ChartID,SongID) VALUES (40,38);
INSERT INTO SongChart(ChartID,SongID) VALUES (37,32);
INSERT INTO SongChart(ChartID,SongID) VALUES (25,30);
INSERT INTO SongChart(ChartID,SongID) VALUES (46,11);
INSERT INTO SongChart(ChartID,SongID) VALUES (6,22);
INSERT INTO SongChart(ChartID,SongID) VALUES (23,49);
INSERT INTO SongChart(ChartID,SongID) VALUES (32,39);
INSERT INTO SongChart(ChartID,SongID) VALUES (8,2);
INSERT INTO SongChart(ChartID,SongID) VALUES (48,29);
INSERT INTO SongChart(ChartID,SongID) VALUES (35,32);
INSERT INTO SongChart(ChartID,SongID) VALUES (32,1);
INSERT INTO SongChart(ChartID,SongID) VALUES (12,23);
INSERT INTO SongChart(ChartID,SongID) VALUES (26,12);
INSERT INTO SongChart(ChartID,SongID) VALUES (33,46);
INSERT INTO SongChart(ChartID,SongID) VALUES (16,9);
INSERT INTO SongChart(ChartID,SongID) VALUES (42,48);
INSERT INTO SongChart(ChartID,SongID) VALUES (4,38);
INSERT INTO SongChart(ChartID,SongID) VALUES (18,43);
INSERT INTO SongChart(ChartID,SongID) VALUES (8,17);
INSERT INTO SongChart(ChartID,SongID) VALUES (31,29);
INSERT INTO SongChart(ChartID,SongID) VALUES (30,48);
INSERT INTO SongChart(ChartID,SongID) VALUES (2,7);
INSERT INTO SongChart(ChartID,SongID) VALUES (10,39);
INSERT INTO SongChart(ChartID,SongID) VALUES (32,24);
INSERT INTO SongChart(ChartID,SongID) VALUES (49,19);
INSERT INTO SongChart(ChartID,SongID) VALUES (31,6);
INSERT INTO SongChart(ChartID,SongID) VALUES (44,40);
INSERT INTO SongChart(ChartID,SongID) VALUES (8,10);
INSERT INTO SongChart(ChartID,SongID) VALUES (39,33);
INSERT INTO SongChart(ChartID,SongID) VALUES (50,36);
INSERT INTO SongChart(ChartID,SongID) VALUES (31,45);
INSERT INTO SongChart(ChartID,SongID) VALUES (7,16);
INSERT INTO SongChart(ChartID,SongID) VALUES (25,1);
INSERT INTO SongChart(ChartID,SongID) VALUES (35,7);
INSERT INTO SongChart(ChartID,SongID) VALUES (2,30);
INSERT INTO SongChart(ChartID,SongID) VALUES (33,48);
INSERT INTO SongChart(ChartID,SongID) VALUES (42,37);
INSERT INTO SongChart(ChartID,SongID) VALUES (17,13);
INSERT INTO SongChart(ChartID,SongID) VALUES (44,35);
INSERT INTO SongChart(ChartID,SongID) VALUES (49,16);
INSERT INTO SongChart(ChartID,SongID) VALUES (34,17);
INSERT INTO SongChart(ChartID,SongID) VALUES (16,31);
INSERT INTO SongChart(ChartID,SongID) VALUES (9,9);
INSERT INTO SongChart(ChartID,SongID) VALUES (25,26);
INSERT INTO SongChart(ChartID,SongID) VALUES (27,27);
INSERT INTO SongChart(ChartID,SongID) VALUES (22,45);
INSERT INTO SongChart(ChartID,SongID) VALUES (26,4);
INSERT INTO SongChart(ChartID,SongID) VALUES (45,1);
INSERT INTO SongChart(ChartID,SongID) VALUES (15,2);
INSERT INTO SongChart(ChartID,SongID) VALUES (37,8);
INSERT INTO SongChart(ChartID,SongID) VALUES (29,28);
INSERT INTO SongChart(ChartID,SongID) VALUES (29,17);
INSERT INTO SongChart(ChartID,SongID) VALUES (48,12);
INSERT INTO SongChart(ChartID,SongID) VALUES (46,45);
INSERT INTO SongChart(ChartID,SongID) VALUES (2,44);
INSERT INTO SongChart(ChartID,SongID) VALUES (15,6);
INSERT INTO SongChart(ChartID,SongID) VALUES (40,22);
INSERT INTO SongChart(ChartID,SongID) VALUES (35,18);
INSERT INTO SongChart(ChartID,SongID) VALUES (26,9);
INSERT INTO SongChart(ChartID,SongID) VALUES (21,10);
INSERT INTO SongChart(ChartID,SongID) VALUES (42,40);
INSERT INTO SongChart(ChartID,SongID) VALUES (12,19);
INSERT INTO SongChart(ChartID,SongID) VALUES (4,39);
INSERT INTO SongChart(ChartID,SongID) VALUES (22,9);
INSERT INTO SongChart(ChartID,SongID) VALUES (45,45);
INSERT INTO SongChart(ChartID,SongID) VALUES (25,36);
INSERT INTO SongChart(ChartID,SongID) VALUES (40,46);
INSERT INTO SongChart(ChartID,SongID) VALUES (41,25);
INSERT INTO SongChart(ChartID,SongID) VALUES (29,35);
INSERT INTO SongChart(ChartID,SongID) VALUES (39,2);
INSERT INTO SongChart(ChartID,SongID) VALUES (36,8);
INSERT INTO SongChart(ChartID,SongID) VALUES (42,38);
INSERT INTO SongChart(ChartID,SongID) VALUES (5,8);
INSERT INTO SongChart(ChartID,SongID) VALUES (7,25);
INSERT INTO SongChart(ChartID,SongID) VALUES (35,47);
INSERT INTO SongChart(ChartID,SongID) VALUES (10,44);
INSERT INTO SongChart(ChartID,SongID) VALUES (17,36);
INSERT INTO SongChart(ChartID,SongID) VALUES (9,39);
INSERT INTO SongChart(ChartID,SongID) VALUES (22,50);
INSERT INTO SongChart(ChartID,SongID) VALUES (14,1);
INSERT INTO SongChart(ChartID,SongID) VALUES (37,14);
INSERT INTO SongChart(ChartID,SongID) VALUES (20,42);
INSERT INTO SongChart(ChartID,SongID) VALUES (9,50);
INSERT INTO SongChart(ChartID,SongID) VALUES (4,15);
INSERT INTO SongChart(ChartID,SongID) VALUES (24,34);
INSERT INTO SongChart(ChartID,SongID) VALUES (29,36);
INSERT INTO SongChart(ChartID,SongID) VALUES (12,44);
INSERT INTO SongChart(ChartID,SongID) VALUES (2,9);
INSERT INTO SongChart(ChartID,SongID) VALUES (33,18);
INSERT INTO SongChart(ChartID,SongID) VALUES (34,21);
INSERT INTO SongChart(ChartID,SongID) VALUES (37,24);
INSERT INTO SongChart(ChartID,SongID) VALUES (14,28);
INSERT INTO SongChart(ChartID,SongID) VALUES (42,3);
INSERT INTO SongChart(ChartID,SongID) VALUES (40,36);
INSERT INTO SongChart(ChartID,SongID) VALUES (17,21);
INSERT INTO SongChart(ChartID,SongID) VALUES (24,12);


INSERT INTO Playlist (PlaylistID,
PlaylistName, NumTracks, TotalListeningTime) VALUES
(1, 'Workout Mix', 15, 45.2),
(2, 'Relaxing Songs', 12, 36.8),
(3, 'Driving Playlist', 20, 60.5),
(4, 'Party Tunes', 25, 77.3),
(5, 'Road Trip', 18, 53.2);

INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (6,'Streamlined',14,15.64);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (7,'Automated',99,39.54);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (8,'customer loyalty',57,59.35);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (9,'open system',34,33.19);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (10,'internet solution',5,49.31);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (11,'frame',54,8.07);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (12,'Switchable',49,13.41);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (13,'contextually-based',58,51.23);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (14,'collaboration',94,47.83);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (15,'Customer-focused',24,34.8);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (16,'attitude-oriented',46,5.68);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (17,'logistical',45,38.37);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (18,'Extended',35,33.27);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (19,'Versatile',73,53.89);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (20,'Vision-oriented',75,55.71);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (21,'Synchronised',67,35.51);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (22,'Universal',69,48.91);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (23,'Multi-lateral',50,52.68);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (24,'Function-based',27,59.42);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (25,'artificial intelligence',17,27.66);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (26,'Open-source',41,7.84);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (27,'Multi-layered',59,45.0);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (28,'full-range',74,16.14);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (29,'application',64,21.94);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (30,'emulation',12,18.81);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (31,'contingency',61,55.02);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (32,'ability',15,20.94);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (33,'modular',20,13.34);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (34,'Face to face',74,8.3);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (35,'Organized',49,58.9);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (36,'leverage',17,58.75);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (37,'circuit',25,56.52);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (38,'incremental',75,56.32);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (39,'client-driven',13,40.6);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (40,'hub',35,57.47);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (41,'Intuitive',21,15.4);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (42,'asymmetric',5,36.89);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (43,'stable',84,9.6);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (44,'User-centric',45,20.13);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (45,'Cross-platform',14,52.43);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (46,'algorithm',5,13.76);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (47,'synergy',97,13.38);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (48,'hybrid',15,26.66);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (49,'dynamic',63,4.13);
INSERT INTO Playlist(PlaylistID,PlaylistName,NumTracks,TotalListeningTime) VALUES (50,'Virtual',93,2.43);


INSERT INTO SongPlaylist (PlaylistID, SongID) VALUES
(1, 1),
(1, 3),
(1, 5),
(2, 2),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 3),
(5, 4),
(5, 5);

INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (28,31);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (49,38);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (3,20);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (2,14);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (36,32);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (40,1);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (8,12);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (42,6);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (23,8);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (35,26);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (7,46);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (27,24);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (22,13);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (44,34);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (31,36);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (17,42);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (19,44);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (8,18);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (21,8);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (14,24);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (26,1);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (10,3);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (24,22);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (22,48);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (16,7);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (30,47);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (2,38);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (27,13);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (49,41);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (20,3);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (37,37);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (15,43);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (23,26);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (11,2);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (6,10);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (2,21);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (37,32);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (32,13);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (45,50);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (29,38);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (39,6);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (1,9);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (36,14);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (34,19);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (22,18);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (11,27);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (3,26);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (30,41);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (41,30);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (13,5);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (29,8);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (47,22);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (17,9);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (11,49);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (19,23);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (38,34);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (27,48);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (50,8);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (10,14);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (11,37);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (29,39);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (38,5);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (32,42);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (37,27);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (16,49);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (40,8);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (41,8);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (49,6);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (38,23);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (30,25);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (8,19);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (20,26);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (42,45);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (5,29);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (37,42);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (22,15);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (4,17);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (40,40);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (26,21);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (11,31);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (21,29);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (46,44);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (42,11);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (3,35);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (44,6);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (39,35);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (26,41);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (38,24);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (34,17);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (24,49);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (26,29);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (48,26);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (44,50);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (10,4);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (24,19);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (22,33);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (19,39);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (50,16);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (35,44);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (10,42);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (17,8);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (9,24);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (8,49);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (16,31);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (1,30);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (47,8);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (48,5);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (26,16);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (26,49);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (24,12);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (17,2);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (50,41);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (16,17);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (30,34);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (49,45);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (14,9);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (21,30);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (6,25);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (24,15);
INSERT INTO SongPlaylist(PlaylistID,SongID) VALUES (1,31);


INSERT INTO Tour (TourID, Name, DateAndTime) VALUES
(1, 'World Tour 2022', '2022-06-15 20:00:00'),
(2, 'Summer Tour 2023', '2023-07-01 18:30:00'),
(3, 'Fall Tour 2024', '2024-10-01 19:00:00'),
(4, 'Winter Tour 2025', '2025-12-15 21:00:00'),
(5, 'Spring Tour 2026', '2026-04-01 17:30:00');

INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (6,'Europe/Stockholm','1972-05-31 14:13:10');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (7,'Asia/Jakarta','2022-04-29 17:22:01');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (8,'Europe/Moscow','1984-04-18 10:44:13');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (9,'Asia/Urumqi','2021-07-22 08:58:25');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (10,'Europe/Warsaw','2000-07-12 03:15:08');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (11,'America/Santo_Domingo','1989-03-11 08:59:39');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (12,'America/El_Salvador','2022-04-17 17:20:22');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (13,'Asia/Tokyo','1986-11-27 20:05:10');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (14,'Asia/Shanghai','1988-12-19 07:38:08');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (15,'Europe/Moscow','1980-04-01 19:43:30');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (16,'Asia/Jakarta','1977-06-10 17:19:28');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (17,'Europe/Lisbon','1990-10-26 03:19:11');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (18,'Asia/Tokyo','2010-09-27 10:54:53');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (19,'Asia/Shanghai','1978-02-13 09:49:55');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (20,'Europe/Moscow','1998-04-30 03:43:06');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (21,'America/Bogota','1993-09-29 20:01:27');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (22,'Asia/Chongqing','2021-12-19 20:10:30');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (23,'Asia/Colombo','1989-11-12 06:13:58');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (24,'Africa/Lagos','1971-11-05 08:42:02');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (25,'America/Los_Angeles','1980-09-14 07:34:27');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (26,'America/Bogota','2004-06-16 12:17:19');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (27,'Europe/Prague','2003-03-16 09:42:54');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (28,'Europe/Warsaw','2015-10-10 08:43:29');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (29,'Europe/Prague','2005-09-09 01:00:57');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (30,'Europe/Prague','2020-04-14 09:34:19');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (31,'Africa/Douala','2008-09-13 11:16:36');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (32,'Asia/Jakarta','2017-12-16 15:10:13');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (33,'Africa/Nairobi','2012-02-17 13:33:58');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (34,'Europe/Prague','1988-12-10 14:11:02');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (35,'Asia/Shanghai','1998-07-08 03:24:40');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (36,'Europe/Berlin','2015-01-20 16:54:44');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (37,'Asia/Chongqing','2022-12-24 08:35:07');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (38,'Europe/Lisbon','1984-05-30 15:38:46');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (39,'Asia/Bangkok','2011-04-02 04:49:18');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (40,'Asia/Hebron','1981-02-26 11:11:52');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (41,'America/New_York','2021-08-22 15:17:54');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (42,'Europe/Skopje','2005-04-30 18:06:38');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (43,'Africa/Luanda','1987-08-26 18:17:18');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (44,'Europe/Berlin','1992-03-05 14:16:22');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (45,'Europe/Lisbon','1980-02-21 05:13:06');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (46,'Asia/Jakarta','2019-03-02 13:09:15');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (47,'America/Porto_Velho','2017-08-30 17:46:59');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (48,'Asia/Shanghai','2003-12-21 17:32:15');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (49,'Asia/Chongqing','1986-12-02 15:18:02');
INSERT INTO Tour(TourID,Name,DateAndTime) VALUES (50,'America/Bogota','1987-04-29 00:51:42');


INSERT INTO ArtistTour (TourID, ArtistID) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(4, 2),
(4, 4),
(4, 5),
(5, 1),
(5, 3),
(5, 4),
(5, 5);

INSERT INTO ArtistTour(TourID,ArtistID) VALUES (46,35);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (26,43);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (1,46);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (36,34);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (14,12);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (17,37);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (2,35);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (50,39);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (43,14);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (38,28);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (8,43);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (42,31);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (7,48);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (13,4);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (40,10);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (5,23);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (39,37);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (16,36);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (31,33);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (41,7);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (34,23);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (23,25);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (20,21);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (30,11);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (36,47);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (12,13);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (1,6);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (29,24);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (24,33);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (21,41);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (50,18);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (9,32);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (25,2);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (49,17);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (41,50);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (48,15);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (45,42);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (23,23);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (31,15);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (11,34);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (26,48);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (6,12);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (22,24);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (41,44);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (37,45);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (27,15);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (48,8);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (49,16);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (15,49);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (12,14);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (26,15);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (25,8);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (21,13);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (49,4);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (26,31);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (18,50);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (39,36);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (13,10);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (17,20);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (16,45);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (42,18);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (5,40);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (11,7);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (27,39);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (49,37);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (31,20);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (27,48);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (39,11);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (48,5);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (18,22);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (28,27);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (32,28);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (34,1);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (11,8);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (25,29);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (42,7);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (2,36);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (37,23);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (25,34);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (18,24);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (26,44);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (47,13);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (5,36);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (38,49);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (21,10);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (25,14);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (26,7);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (42,1);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (39,13);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (4,18);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (31,48);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (46,6);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (2,18);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (50,1);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (21,21);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (45,25);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (13,13);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (28,24);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (24,5);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (4,11);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (8,26);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (17,41);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (35,43);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (2,50);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (30,15);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (7,33);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (22,25);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (33,8);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (31,6);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (28,1);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (34,45);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (17,38);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (42,9);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (11,48);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (5,44);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (1,24);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (26,20);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (16,43);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (9,38);
INSERT INTO ArtistTour(TourID,ArtistID) VALUES (29,46);


INSERT INTO Region (RegionID, Name, Location, Continent, Country, State, City) VALUES
(1, 'North America', 'NA', 'North America', 'United States', 'California', 'Los Angeles'),
(2, 'South America', 'SA', 'South America', 'Brazil', 'São Paulo', 'São Paulo'),
(3, 'Europe', 'EU', 'Europe', 'United Kingdom', 'England', 'London'),
(4, 'Asia', 'AS', 'Asia', 'Japan', 'Tokyo', 'Tokyo'),
(5, 'Oceania', 'OC', 'Oceania', 'Australia', 'New South Wales', 'Sydney');

INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (6,'NA','America/Lima','NA','Peru',NULL,'Juli');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (7,'AF','Europe/Warsaw','EU','Poland',NULL,'Wiązownica');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (8,'NA','Asia/Jakarta','SA','Indonesia',NULL,'Hegarsari');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (9,'NA','Asia/Almaty','NA','Kazakhstan',NULL,'Abay');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (10,'SA','Asia/Kabul','NA','Afghanistan',NULL,'Pārūn');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (11,'NA','Europe/Lisbon','AF','Portugal','Viseu','Antas');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (12,'AF','Asia/Jakarta','NA','Indonesia',NULL,'Pende');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (13,'EU','America/Sao_Paulo','EU','Brazil',NULL,'Baixo Guandu');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (14,'NA','Asia/Jakarta','NA','Indonesia',NULL,'Krajanpagowan');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (15,'NA','America/Havana','NA','Cuba',NULL,'Cacocum');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (16,'EU','America/Anguilla','AS','Anguilla',NULL,'Stoney Ground');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (17,'NA','Europe/Tirane','EU','Albania',NULL,'Qelëz');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (18,'SA','Asia/Makassar','AF','Indonesia',NULL,'Palla');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (19,'SA','America/Bogota','NA','Colombia',NULL,'Guaitarilla');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (20,'AF','Asia/Shanghai','NA','China',NULL,'Jintao');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (21,'SA','Asia/Shanghai','NA','China',NULL,'Jinrui');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (22,'NA','Europe/Warsaw','SA','Poland',NULL,'Kazimierz Dolny');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (23,'AS','Europe/Dublin','EU','Ireland',NULL,'Oranmore');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (24,'OC','Asia/Jakarta','EU','Indonesia',NULL,'Pasirjengkol');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (25,'EU','Asia/Makassar','NA','Indonesia',NULL,'Seoam');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (26,'NA','Asia/Chongqing','NA','China',NULL,'Lishui');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (27,'SA','Europe/Paris','EU','France','Bretagne','Lorient');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (28,'AF','America/New_York','OC','United States','Florida','Seminole');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (29,'AF','Europe/Riga','NA','Latvia',NULL,'Cesvaine');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (30,'AS','Europe/Helsinki','AF','Sweden','Norrbotten','Haparanda');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (31,'EU','Asia/Manila','NA','Indonesia',NULL,'Lirung');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (32,'EU','Europe/Belgrade','OC','Serbia',NULL,'Padina');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (33,'NA','America/Bogota','AF','Colombia',NULL,'Montelíbano');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (34,'NA','America/Sao_Paulo','SA','Brazil',NULL,'Araçatuba');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (35,'NA','America/Lima','OC','Peru',NULL,'Santa Cruz');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (36,'EU','Asia/Chongqing','AS','China',NULL,'Shilin');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (37,'NA','Asia/Manila','AS','Philippines',NULL,'Almaguer North');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (38,'NA','America/Sao_Paulo','OC','Brazil',NULL,'Pouso Alegre');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (39,'OC','Asia/Shanghai','EU','China',NULL,'Xilin');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (40,'AS','Asia/Shanghai','NA','China',NULL,'Gaotang');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (41,'AS','Asia/Dhaka','AF','Bangladesh',NULL,'Nowlamary');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (42,'NA','Africa/Brazzaville','OC','Republic of the Congo',NULL,'Makoua');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (43,'OC','Europe/Berlin','SA','Czech Republic',NULL,'Klenčí pod Čerchovem');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (44,'NA','Asia/Karachi','AS','Pakistan',NULL,'Karak');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (45,'NA','Asia/Karachi','EU','Pakistan',NULL,'Wārāh');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (46,'AS','Asia/Shanghai','AS','China',NULL,'Dunhou');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (47,'SA','Asia/Harbin','AS','China',NULL,'Shuangshan');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (48,'NA','Europe/Riga','SA','Latvia',NULL,'Pāvilosta');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (49,'EU','Europe/Warsaw','AF','Poland',NULL,'Barwałd Górny');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (50,'NA','Asia/Shanghai','AS','China',NULL,'Huabeitun');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (51,'AF','Europe/Sofia','AS','Bulgaria',NULL,'Burgas');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (52,'AF','Europe/Moscow','NA','Russia',NULL,'Ivanovskoye');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (53,'EU','Europe/Stockholm','OC','Sweden','Värmland','Kil');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (54,'SA','Asia/Shanghai','OC','China',NULL,'Fucun');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (55,'AF','Africa/Kampala','NA','Uganda',NULL,'Napak');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (56,'AS','Asia/Ho_Chi_Minh','NA','Vietnam',NULL,'K Bang');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (57,'NA','Asia/Shanghai','OC','China',NULL,'Songjiang');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (58,'SA','Europe/Paris','SA','France','Île-de-France','Fresnes');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (59,'AS','Asia/Chongqing','AF','China',NULL,'Yonggu');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (60,'AF','Asia/Damascus','AF','Syria',NULL,'Al Quţayfah');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (61,'AF','Europe/Stockholm','OC','Sweden','Stockholm','Johanneshov');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (62,'AS','Europe/Athens','NA','Greece',NULL,'Mykonos');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (63,'AF','Asia/Chongqing','OC','China',NULL,'Sangba');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (64,'NA','America/Caracas','NA','Venezuela',NULL,'La Esmeralda');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (65,'AS','America/Asuncion','OC','Paraguay',NULL,'Coronel Martínez');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (66,'AS','Asia/Chongqing','AS','China',NULL,'Nansheng');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (67,'SA','Europe/Warsaw','AS','Russia',NULL,'Pravdinsk');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (68,'SA','Asia/Jakarta','OC','Indonesia',NULL,'Dalamdesa Kalapadua');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (69,'AS','Asia/Jakarta','AS','Indonesia',NULL,'Bojongsarung');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (70,'NA','Europe/Stockholm','AF','Sweden','Halland','Varberg');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (71,'AS','Asia/Chongqing','NA','China',NULL,'Sanchahe');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (72,'EU','Asia/Shanghai','AF','China',NULL,'Fengdian');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (73,'NA','Europe/Prague','OC','Czech Republic',NULL,'Líně');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (74,'OC','Asia/Chongqing','NA','China',NULL,'Changzheng');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (75,'AS','Europe/Moscow','NA','Russia',NULL,'Donetsk');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (76,'OC','Asia/Makassar','OC','Indonesia',NULL,'Dawe');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (77,'OC','Asia/Makassar','NA','Indonesia',NULL,'Mangga Dua');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (78,'EU','Europe/Moscow','SA','Russia',NULL,'Kuvshinovo');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (79,'OC','America/Guatemala','NA','Guatemala',NULL,'Salamá');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (80,'AS','Asia/Jakarta','NA','Indonesia',NULL,'Padangtiji');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (81,'EU','Asia/Manila','AS','Philippines',NULL,'Sarrat');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (82,'AS','Europe/Berlin','AS','Germany','Hamburg','Hamburg Harvestehude');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (83,'SA','Europe/Warsaw','AF','Poland',NULL,'Węgierska Górka');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (84,'OC','Asia/Chongqing','AF','China',NULL,'Youdian');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (85,'SA','Asia/Makassar','SA','Indonesia',NULL,'Pergan');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (86,'NA','Africa/Gaborone','NA','Botswana',NULL,'Janeng');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (87,'NA','Europe/Moscow','NA','Russia',NULL,'Chemodanovka');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (88,'NA','Asia/Chongqing','AF','China',NULL,'Yuwang');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (89,'OC','Asia/Kabul','AF','Afghanistan',NULL,'Khudāydād Khēl');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (90,'OC','America/Campo_Grande','OC','Brazil',NULL,'Dourados');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (91,'NA','America/New_York','AS','United States','Virginia','Norfolk');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (92,'NA','Asia/Yekaterinburg','OC','Russia',NULL,'Chusovoy');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (93,'NA','Asia/Chongqing','OC','China',NULL,'Longjie');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (94,'SA','Europe/Warsaw','EU','Poland',NULL,'Łąck');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (95,'AS','Asia/Jakarta','EU','Indonesia',NULL,'Muara');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (96,'OC','Africa/Khartoum','SA','Sudan',NULL,'Wagar');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (97,'NA','Asia/Chongqing','AF','China',NULL,'Huanggexi');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (98,'OC','Europe/Sofia','NA','Bulgaria',NULL,'Samokov');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (99,'SA','Asia/Manila','SA','Philippines',NULL,'New Cebu');
INSERT INTO Region(RegionID,Name,Location,Continent,Country,State,City) VALUES (100,'EU','Asia/Shanghai','AF','China',NULL,'Leijiadian');


INSERT INTO TourRegion (TourID, RegionID) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 3),
(3, 5),
(4, 2),
(4, 4),
(4, 5),
(5, 1),
(5, 3),
(5, 5);

INSERT INTO TourRegion(TourID,RegionID) VALUES (20,100);
INSERT INTO TourRegion(TourID,RegionID) VALUES (42,68);
INSERT INTO TourRegion(TourID,RegionID) VALUES (47,66);
INSERT INTO TourRegion(TourID,RegionID) VALUES (1,40);
INSERT INTO TourRegion(TourID,RegionID) VALUES (14,54);
INSERT INTO TourRegion(TourID,RegionID) VALUES (43,42);
INSERT INTO TourRegion(TourID,RegionID) VALUES (41,51);
INSERT INTO TourRegion(TourID,RegionID) VALUES (2,58);
INSERT INTO TourRegion(TourID,RegionID) VALUES (28,78);
INSERT INTO TourRegion(TourID,RegionID) VALUES (42,70);
INSERT INTO TourRegion(TourID,RegionID) VALUES (21,74);
INSERT INTO TourRegion(TourID,RegionID) VALUES (45,47);
INSERT INTO TourRegion(TourID,RegionID) VALUES (47,40);
INSERT INTO TourRegion(TourID,RegionID) VALUES (19,3);
INSERT INTO TourRegion(TourID,RegionID) VALUES (39,37);
INSERT INTO TourRegion(TourID,RegionID) VALUES (13,8);
INSERT INTO TourRegion(TourID,RegionID) VALUES (46,17);
INSERT INTO TourRegion(TourID,RegionID) VALUES (4,60);
INSERT INTO TourRegion(TourID,RegionID) VALUES (28,83);
INSERT INTO TourRegion(TourID,RegionID) VALUES (46,59);
INSERT INTO TourRegion(TourID,RegionID) VALUES (32,100);
INSERT INTO TourRegion(TourID,RegionID) VALUES (9,22);
INSERT INTO TourRegion(TourID,RegionID) VALUES (12,84);
INSERT INTO TourRegion(TourID,RegionID) VALUES (50,81);
INSERT INTO TourRegion(TourID,RegionID) VALUES (3,83);
INSERT INTO TourRegion(TourID,RegionID) VALUES (8,3);
INSERT INTO TourRegion(TourID,RegionID) VALUES (49,95);
INSERT INTO TourRegion(TourID,RegionID) VALUES (24,13);
INSERT INTO TourRegion(TourID,RegionID) VALUES (25,12);
INSERT INTO TourRegion(TourID,RegionID) VALUES (11,62);
INSERT INTO TourRegion(TourID,RegionID) VALUES (12,15);
INSERT INTO TourRegion(TourID,RegionID) VALUES (1,6);
INSERT INTO TourRegion(TourID,RegionID) VALUES (29,29);
INSERT INTO TourRegion(TourID,RegionID) VALUES (28,74);
INSERT INTO TourRegion(TourID,RegionID) VALUES (41,68);
INSERT INTO TourRegion(TourID,RegionID) VALUES (43,31);
INSERT INTO TourRegion(TourID,RegionID) VALUES (47,17);
INSERT INTO TourRegion(TourID,RegionID) VALUES (7,18);
INSERT INTO TourRegion(TourID,RegionID) VALUES (46,20);
INSERT INTO TourRegion(TourID,RegionID) VALUES (35,39);
INSERT INTO TourRegion(TourID,RegionID) VALUES (34,21);
INSERT INTO TourRegion(TourID,RegionID) VALUES (18,19);
INSERT INTO TourRegion(TourID,RegionID) VALUES (16,39);
INSERT INTO TourRegion(TourID,RegionID) VALUES (5,75);
INSERT INTO TourRegion(TourID,RegionID) VALUES (4,7);
INSERT INTO TourRegion(TourID,RegionID) VALUES (29,24);
INSERT INTO TourRegion(TourID,RegionID) VALUES (40,10);
INSERT INTO TourRegion(TourID,RegionID) VALUES (23,91);
INSERT INTO TourRegion(TourID,RegionID) VALUES (6,35);
INSERT INTO TourRegion(TourID,RegionID) VALUES (2,60);
INSERT INTO TourRegion(TourID,RegionID) VALUES (8,27);
INSERT INTO TourRegion(TourID,RegionID) VALUES (29,92);
INSERT INTO TourRegion(TourID,RegionID) VALUES (25,61);
INSERT INTO TourRegion(TourID,RegionID) VALUES (20,39);
INSERT INTO TourRegion(TourID,RegionID) VALUES (9,62);
INSERT INTO TourRegion(TourID,RegionID) VALUES (26,94);
INSERT INTO TourRegion(TourID,RegionID) VALUES (3,49);
INSERT INTO TourRegion(TourID,RegionID) VALUES (1,53);
INSERT INTO TourRegion(TourID,RegionID) VALUES (46,31);
INSERT INTO TourRegion(TourID,RegionID) VALUES (24,41);
INSERT INTO TourRegion(TourID,RegionID) VALUES (34,69);
INSERT INTO TourRegion(TourID,RegionID) VALUES (12,77);
INSERT INTO TourRegion(TourID,RegionID) VALUES (13,15);
INSERT INTO TourRegion(TourID,RegionID) VALUES (43,92);
INSERT INTO TourRegion(TourID,RegionID) VALUES (14,10);
INSERT INTO TourRegion(TourID,RegionID) VALUES (41,55);
INSERT INTO TourRegion(TourID,RegionID) VALUES (37,78);
INSERT INTO TourRegion(TourID,RegionID) VALUES (34,47);
INSERT INTO TourRegion(TourID,RegionID) VALUES (48,98);
INSERT INTO TourRegion(TourID,RegionID) VALUES (23,77);
INSERT INTO TourRegion(TourID,RegionID) VALUES (27,38);
INSERT INTO TourRegion(TourID,RegionID) VALUES (22,53);
INSERT INTO TourRegion(TourID,RegionID) VALUES (3,97);
INSERT INTO TourRegion(TourID,RegionID) VALUES (37,14);
INSERT INTO TourRegion(TourID,RegionID) VALUES (48,88);
INSERT INTO TourRegion(TourID,RegionID) VALUES (38,50);
INSERT INTO TourRegion(TourID,RegionID) VALUES (34,39);
INSERT INTO TourRegion(TourID,RegionID) VALUES (25,74);
INSERT INTO TourRegion(TourID,RegionID) VALUES (46,36);
INSERT INTO TourRegion(TourID,RegionID) VALUES (36,49);
INSERT INTO TourRegion(TourID,RegionID) VALUES (43,15);
INSERT INTO TourRegion(TourID,RegionID) VALUES (8,53);
INSERT INTO TourRegion(TourID,RegionID) VALUES (22,52);
INSERT INTO TourRegion(TourID,RegionID) VALUES (48,17);
INSERT INTO TourRegion(TourID,RegionID) VALUES (2,33);
INSERT INTO TourRegion(TourID,RegionID) VALUES (50,77);
INSERT INTO TourRegion(TourID,RegionID) VALUES (40,23);
INSERT INTO TourRegion(TourID,RegionID) VALUES (42,38);
INSERT INTO TourRegion(TourID,RegionID) VALUES (28,39);
INSERT INTO TourRegion(TourID,RegionID) VALUES (41,100);
INSERT INTO TourRegion(TourID,RegionID) VALUES (45,55);
INSERT INTO TourRegion(TourID,RegionID) VALUES (16,96);
INSERT INTO TourRegion(TourID,RegionID) VALUES (9,19);
INSERT INTO TourRegion(TourID,RegionID) VALUES (40,15);
INSERT INTO TourRegion(TourID,RegionID) VALUES (6,74);
INSERT INTO TourRegion(TourID,RegionID) VALUES (32,30);
INSERT INTO TourRegion(TourID,RegionID) VALUES (7,59);
INSERT INTO TourRegion(TourID,RegionID) VALUES (3,31);
INSERT INTO TourRegion(TourID,RegionID) VALUES (47,55);
INSERT INTO TourRegion(TourID,RegionID) VALUES (1,65);
INSERT INTO TourRegion(TourID,RegionID) VALUES (50,92);
INSERT INTO TourRegion(TourID,RegionID) VALUES (28,85);
INSERT INTO TourRegion(TourID,RegionID) VALUES (49,82);
INSERT INTO TourRegion(TourID,RegionID) VALUES (50,38);
INSERT INTO TourRegion(TourID,RegionID) VALUES (25,94);
INSERT INTO TourRegion(TourID,RegionID) VALUES (45,70);
INSERT INTO TourRegion(TourID,RegionID) VALUES (19,31);
INSERT INTO TourRegion(TourID,RegionID) VALUES (12,10);
INSERT INTO TourRegion(TourID,RegionID) VALUES (3,92);
INSERT INTO TourRegion(TourID,RegionID) VALUES (16,26);
INSERT INTO TourRegion(TourID,RegionID) VALUES (4,85);
INSERT INTO TourRegion(TourID,RegionID) VALUES (37,12);
INSERT INTO TourRegion(TourID,RegionID) VALUES (42,19);
INSERT INTO TourRegion(TourID,RegionID) VALUES (32,65);
INSERT INTO TourRegion(TourID,RegionID) VALUES (49,32);
INSERT INTO TourRegion(TourID,RegionID) VALUES (35,37);
INSERT INTO TourRegion(TourID,RegionID) VALUES (27,36);
INSERT INTO TourRegion(TourID,RegionID) VALUES (40,18);
INSERT INTO TourRegion(TourID,RegionID) VALUES (20,29);
INSERT INTO TourRegion(TourID,RegionID) VALUES (7,83);


INSERT INTO Merchandise (MerchandiseID, MerchandiseName, MerchandiseType, Price) VALUES
(1, 'T-Shirt', 'Clothing', 20.99),
(2, 'Cap', 'Accessories', 12.50),
(3, 'CD', 'Music', 9.99),
(4, 'Poster', 'Home Decor', 7.99),
(5, 'Vinyl Record', 'Music', 24.99);

INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (6,'elit','Grocery',85.84);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (7,'nam','Automotive',18.06);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (8,'sem','Sports',91.63);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (9,'mus','Grocery',34.19);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (10,'massa','Movies',40.2);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (11,'quam','Grocery',47.05);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (12,'posuere','Health',81.54);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (13,'nulla','Baby',55.28);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (14,'justo','Toys',89.3);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (15,'a','Computers',18.9);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (16,'vulputate','Computers',36.99);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (17,'nisi','Kids',18.6);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (18,'sapien','Books',60.43);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (19,'in','Computers',39.55);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (20,'luctus','Home',46.86);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (21,'sociis','Music',66.99);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (22,'habitasse','Clothing',47.31);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (23,'lacus','Computers',56.84);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (24,'ultricies','Health',72.98);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (25,'pede','Movies',43.77);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (26,'condimentum','Home',37.98);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (27,'erat','Computers',20.42);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (28,'aliquet','Games',38.04);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (29,'etiam','Outdoors',83.42);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (30,'orci','Garden',45.46);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (31,'arcu','Garden',7.41);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (32,'est','Beauty',87.0);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (33,'pharetra','Shoes',44.77);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (34,'maecenas','Electronics',97.6);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (35,'commodo','Beauty',14.93);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (36,'tempus','Computers',63.53);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (37,'consequat','Industrial',23.45);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (38,'tempus','Outdoors',11.67);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (39,'elementum','Baby',26.42);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (40,'volutpat','Kids',90.02);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (41,'lacinia','Industrial',32.23);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (42,'nisl','Baby',83.28);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (43,'nunc','Shoes',71.2);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (44,'morbi','Automotive',30.0);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (45,'in','Sports',37.3);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (46,'lacinia','Tools',28.82);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (47,'non','Kids',90.26);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (48,'dapibus','Garden',49.65);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (49,'et','Health',66.29);
INSERT INTO Merchandise(MerchandiseID,MerchandiseName,MerchandiseType,Price) VALUES (50,'et','Baby',37.15);


INSERT INTO MerchandiseArtist (MerchandiseID, ArtistID) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 4),
(3, 1),
(3, 3),
(4, 2),
(4, 5),
(5, 1),
(5, 4);

INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (16,35);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (25,28);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (19,4);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (34,42);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (7,47);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (27,16);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (29,24);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (16,44);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (7,38);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (40,9);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (50,10);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (12,29);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (44,31);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (1,50);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (20,33);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (25,13);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (47,32);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (28,6);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (38,2);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (8,23);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (49,3);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (1,38);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (15,8);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (11,34);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (35,21);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (15,12);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (10,10);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (46,46);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (21,23);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (30,45);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (31,10);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (42,12);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (41,24);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (37,49);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (20,34);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (46,9);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (19,6);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (48,39);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (22,50);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (38,13);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (46,37);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (29,40);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (40,17);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (28,39);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (38,28);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (47,34);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (5,41);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (13,6);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (39,45);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (7,2);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (37,26);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (35,49);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (50,39);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (45,47);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (46,15);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (42,27);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (49,12);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (15,49);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (6,33);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (23,19);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (47,2);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (46,13);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (31,4);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (39,27);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (20,49);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (33,43);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (42,15);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (24,40);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (14,47);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (3,10);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (31,35);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (18,43);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (3,45);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (50,28);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (6,47);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (19,9);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (40,16);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (28,4);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (32,2);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (3,9);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (34,6);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (14,38);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (35,16);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (30,29);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (5,45);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (23,32);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (25,46);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (36,2);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (49,50);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (8,11);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (32,30);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (26,23);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (48,38);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (41,31);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (18,16);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (22,12);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (9,43);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (15,30);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (16,1);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (25,21);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (32,33);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (46,17);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (45,34);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (32,40);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (42,18);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (29,13);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (27,21);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (46,31);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (27,12);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (9,11);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (41,3);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (2,36);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (21,42);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (6,6);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (48,17);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (34,18);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (4,1);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (27,3);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (10,47);
INSERT INTO MerchandiseArtist(MerchandiseID,ArtistID) VALUES (26,13);


INSERT INTO Label (LabelID, LabelName) VALUES
(1, 'Universal Music Group'),
(2, 'Sony Music Entertainment'),
(3, 'Warner Music Group'),
(4, 'EMI'),
(5, 'Atlantic Records');

INSERT INTO Label(LabelID,LabelName) VALUES (6,'Dicki-Herman');
INSERT INTO Label(LabelID,LabelName) VALUES (7,'Wolf, Jacobi and Pollich');
INSERT INTO Label(LabelID,LabelName) VALUES (8,'MacGyver-Lind');
INSERT INTO Label(LabelID,LabelName) VALUES (9,'Kautzer, Littel and Nader');
INSERT INTO Label(LabelID,LabelName) VALUES (10,'Johns-Zulauf');
INSERT INTO Label(LabelID,LabelName) VALUES (11,'Armstrong, Dibbert and Runolfsson');
INSERT INTO Label(LabelID,LabelName) VALUES (12,'Swaniawski Group');
INSERT INTO Label(LabelID,LabelName) VALUES (13,'Jacobi Inc');
INSERT INTO Label(LabelID,LabelName) VALUES (14,'Wintheiser, Tromp and Moore');
INSERT INTO Label(LabelID,LabelName) VALUES (15,'Lehner and Sons');
INSERT INTO Label(LabelID,LabelName) VALUES (16,'McKenzie-Kohler');
INSERT INTO Label(LabelID,LabelName) VALUES (17,'Langosh, Witting and Herman');
INSERT INTO Label(LabelID,LabelName) VALUES (18,'Berge, Walter and Bartell');
INSERT INTO Label(LabelID,LabelName) VALUES (19,'Murray, Koepp and Hamill');
INSERT INTO Label(LabelID,LabelName) VALUES (20,'Schmeler Group');
INSERT INTO Label(LabelID,LabelName) VALUES (21,'Emmerich Inc');
INSERT INTO Label(LabelID,LabelName) VALUES (22,'Zieme, Hirthe and White');
INSERT INTO Label(LabelID,LabelName) VALUES (23,'Reichel-Ankunding');
INSERT INTO Label(LabelID,LabelName) VALUES (24,'Hickle, Leuschke and Mann');
INSERT INTO Label(LabelID,LabelName) VALUES (25,'Mante-Strosin');
INSERT INTO Label(LabelID,LabelName) VALUES (26,'Durgan Inc');
INSERT INTO Label(LabelID,LabelName) VALUES (27,'Bernhard-Wisoky');
INSERT INTO Label(LabelID,LabelName) VALUES (28,'Armstrong, Weimann and Parisian');
INSERT INTO Label(LabelID,LabelName) VALUES (29,'Ledner LLC');
INSERT INTO Label(LabelID,LabelName) VALUES (30,'Nolan, Konopelski and Hane');
INSERT INTO Label(LabelID,LabelName) VALUES (31,'Corwin, Koelpin and Carter');
INSERT INTO Label(LabelID,LabelName) VALUES (32,'Gislason Inc');
INSERT INTO Label(LabelID,LabelName) VALUES (33,'Yost-Adams');
INSERT INTO Label(LabelID,LabelName) VALUES (34,'Predovic, Stroman and Hammes');
INSERT INTO Label(LabelID,LabelName) VALUES (35,'Gottlieb Group');
INSERT INTO Label(LabelID,LabelName) VALUES (36,'D''Amore, O''Reilly and Leffler');
INSERT INTO Label(LabelID,LabelName) VALUES (37,'Boyle, Bailey and Kautzer');
INSERT INTO Label(LabelID,LabelName) VALUES (38,'Rohan Group');
INSERT INTO Label(LabelID,LabelName) VALUES (39,'Bauch, Gislason and Dach');
INSERT INTO Label(LabelID,LabelName) VALUES (40,'Bartell, Herzog and Graham');
INSERT INTO Label(LabelID,LabelName) VALUES (41,'Kunze, Treutel and Medhurst');
INSERT INTO Label(LabelID,LabelName) VALUES (42,'Cassin-Bradtke');
INSERT INTO Label(LabelID,LabelName) VALUES (43,'Anderson, Wintheiser and Rath');
INSERT INTO Label(LabelID,LabelName) VALUES (44,'Terry, Grady and Bauch');
INSERT INTO Label(LabelID,LabelName) VALUES (45,'Klein and Sons');
INSERT INTO Label(LabelID,LabelName) VALUES (46,'Lueilwitz, Bruen and Little');
INSERT INTO Label(LabelID,LabelName) VALUES (47,'Beatty, Corkery and Rice');
INSERT INTO Label(LabelID,LabelName) VALUES (48,'Schimmel-Cruickshank');
INSERT INTO Label(LabelID,LabelName) VALUES (49,'Cassin-Yost');
INSERT INTO Label(LabelID,LabelName) VALUES (50,'Mohr, Harvey and Dach');

INSERT INTO ArtistProducer (ProducerID, ArtistID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4),
(4, 2),
(5, 5),
(5, 3);

INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (36,6);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (25,31);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (45,20);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (44,29);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (21,49);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (24,14);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (37,46);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (16,23);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (17,38);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (23,10);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (36,15);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (22,36);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (49,19);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (2,37);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (6,27);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (1,23);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (46,21);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (22,29);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (41,7);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (38,12);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (33,24);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (1,10);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (26,3);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (12,45);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (18,11);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (28,18);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (40,19);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (4,1);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (14,45);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (29,37);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (28,31);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (29,4);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (30,24);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (37,20);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (11,35);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (33,25);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (33,15);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (28,26);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (47,27);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (19,41);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (42,49);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (14,35);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (2,36);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (48,5);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (33,23);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (1,47);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (37,30);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (38,37);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (6,17);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (38,23);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (39,19);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (27,14);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (44,41);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (12,43);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (25,35);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (34,25);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (10,3);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (50,47);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (42,37);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (2,16);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (28,22);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (22,43);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (23,42);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (14,24);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (35,18);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (4,13);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (7,45);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (15,11);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (32,35);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (25,47);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (44,32);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (28,9);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (30,6);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (40,5);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (2,12);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (47,20);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (18,44);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (3,48);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (17,50);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (18,49);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (11,46);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (9,21);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (21,7);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (2,35);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (6,40);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (17,6);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (1,12);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (47,17);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (7,32);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (15,10);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (3,21);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (20,23);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (27,15);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (33,17);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (48,24);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (40,3);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (19,15);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (50,37);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (27,30);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (8,49);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (1,32);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (47,11);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (43,23);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (4,48);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (36,49);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (38,29);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (39,11);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (22,27);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (19,5);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (8,17);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (23,32);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (39,16);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (11,40);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (48,43);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (40,49);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (49,24);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (41,17);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (3,42);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (5,44);
INSERT INTO ArtistProducer(ProducerID,ArtistID) VALUES (47,5);


INSERT INTO Producer (ProducerID, ProducerName) VALUES
(1, 'Max Martin'),
(2, 'Dr. Luke'),
(3, 'Timbaland'),
(4, 'Rick Rubin'),
(5, 'Calvin Harris');

INSERT INTO Producer(ProducerID,ProducerName) VALUES (6,'Edie Robberecht');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (7,'Nataline O''Connel');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (8,'Warde Gollin');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (9,'Nikolaus Scapelhorn');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (10,'Alwin Gofforth');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (11,'Raychel Kharchinski');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (12,'Halsey Kleanthous');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (13,'Vittoria Puttick');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (14,'Rochelle Harmar');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (15,'Jacquie Filchakov');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (16,'Hyacinth Dall');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (17,'Barrie Dunley');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (18,'Filberte Sidnell');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (19,'Norton Scantleberry');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (20,'Letti Simonelli');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (21,'Chev Traill');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (22,'Cicely Mersh');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (23,'Nelie Gyves');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (24,'Nita Scamp');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (25,'Lauritz Comini');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (26,'Leland Maxstead');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (27,'Cassandra Filpi');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (28,'Myrtle Wigan');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (29,'Clarabelle O''Mullally');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (30,'Meredithe Ruppele');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (31,'Odilia Southerns');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (32,'Gage Daventry');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (33,'Ignatius Seeds');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (34,'Birgitta Newlove');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (35,'Roch Boon');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (36,'Ninnetta Gobert');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (37,'Sande Archell');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (38,'Merwyn Crossingham');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (39,'Bart Myrtle');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (40,'Jacqueline Tutin');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (41,'Denver McGoogan');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (42,'Codi Bee');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (43,'Nerty Faulks');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (44,'Kesley Leese');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (45,'Rochette Rysom');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (46,'Herta Greatbanks');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (47,'Alaine Bohl');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (48,'Toddie McKernan');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (49,'Gloriane Coath');
INSERT INTO Producer(ProducerID,ProducerName) VALUES (50,'Eula Yuryichev');


INSERT INTO SocialMedia (Instagram, Name, Popularity, GenreID, ArtistID) VALUES
('j_smith', 'John Smith', 0.8, 1, 1),
('j_doe', 'Jane Doe', 0.7, 2, 2),
('d_lee', 'David Lee', 0.6, 3, 3),
('s_brown', 'Sarah Brown', 0.5, 4, 4),
('k_kim', 'Kevin Kim', 0.4, 5, 5);

INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('pstanbrooke0','Pavel Stanbrooke',14.04,14,48);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('mscraney1','Mata Scraney',24.55,19,14);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('llerigo2','Lutero Lerigo',26.55,39,25);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('lhanniger3','Link Hanniger',97.5,6,13);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('hstaggs4','Henderson Staggs',39.42,17,5);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('nlankford5','Nani Lankford',7.21,35,44);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('nduckhouse6','Nikita Duckhouse',14.09,6,2);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('cpaddington7','Cary Paddington',23.47,44,48);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('djeavon8','Daniele Jeavon',74.97,12,40);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jhamlett9','Jaimie Hamlett',19.83,42,47);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('bsainsburya','Briant Sainsbury',42.25,5,23);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('kgouldebyb','Kit Gouldeby',62.18,36,7);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('dnewardc','Dirk Neward',31.44,21,38);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('imcilwreathd','Issie McIlwreath',79.44,44,32);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('mshurmane','Muriel Shurman',7.18,33,12);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jovernellf','Jacquelynn Overnell',93.77,6,28);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('klydsterg','Klemens Lydster',59.31,12,36);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('sbernardih','Sandi Bernardi',14.33,35,18);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('cderretti','Claudine Derrett',12.94,47,43);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('ctregunnahj','Clara Tregunnah',93.4,43,3);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jmatusk','Josee Matus',41.25,50,23);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('vbannardl','Vern Bannard',3.59,22,31);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('bkurtm','Bernetta Kurt',74.83,46,43);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('tfittonn','Thor Fitton',79.58,20,46);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('aberthomiero','Amy Berthomier',51.94,29,45);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('stweedlep','Shauna Tweedle',65.7,26,5);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('htranmerq','Henderson Tranmer',91.71,49,10);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('gyoullr','Gigi Youll',15.18,35,40);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('athurmans','Augustin Thurman',73.25,20,35);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('atonkinsont','Agustin Tonkinson',96.91,31,14);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('tyuryaevu','Tiffany Yuryaev',22.49,30,33);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('wgelsthorpev','Wilmette Gelsthorpe',99.86,39,26);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('hwalesbyw','Hannah Walesby',89.86,24,9);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('dpoytressx','Damara Poytress',1.57,38,34);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('dpomphretty','Deedee Pomphrett',97.97,44,19);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('twoltersz','Tobe Wolters',27.86,23,24);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('ttollerfield10','Trefor Tollerfield',36.99,50,8);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('lluca11','Leora Luca',24.38,18,27);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('mglazebrook12','Milicent Glazebrook',70.32,29,47);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('bkivelhan13','Buddy Kivelhan',70.53,14,22);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('hcawse14','Henrieta Cawse',52.56,16,22);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('lmccrachen15','Lily McCrachen',65.67,19,5);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('leaster16','Leroi Easter',87.27,44,18);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('rprew17','Reinhold Prew',52.14,46,33);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('aamerici18','Andrea Americi',78.44,6,24);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jschaumaker19','Jennette Schaumaker',50.96,25,29);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jpalfrie1a','Jeralee Palfrie',63.83,49,34);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jsiveter1b','Joela Siveter',65.7,36,23);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('pbidewel1c','Phelia Bidewel',17.4,14,49);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('kmcfater1d','Karim McFater',61.67,39,16);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('sandrivot1e','Sadie Andrivot',98.87,37,3);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('braddan1f','Brittney Raddan',80.89,40,44);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('dheinzler1g','Darla Heinzler',32.79,3,49);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('rlate1h','Rog Late',93.59,24,42);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('tpadginton1i','Tobit Padginton',32.71,22,18);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('fbedson1j','Forbes Bedson',22.08,15,11);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('wcrace1k','Welbie Crace',92.21,27,30);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('hbernocchi1l','Holly-anne Bernocchi',28.17,29,32);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('ttreher1m','Tiertza Treher',93.3,25,16);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('fgalloway1n','Forest Galloway',79.85,39,43);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('vdunkerley1o','Valina Dunkerley',60.7,25,22);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('igowland1p','Issi Gowland',14.48,33,10);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('kcookes1q','Katherina Cookes',55.49,12,46);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('vlailey1r','Valene Lailey',87.58,41,27);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('kpeddie1s','Kania Peddie',30.53,1,3);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jberthod1t','Jacynth Berthod',70.93,48,35);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('igohn1u','Immanuel Gohn',16.25,39,34);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('ootterwell1v','Odette Otterwell',83.31,8,44);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('forgen1w','Fremont Orgen',36.2,36,1);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('rmcnea1x','Roberto McNea',62.58,24,9);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jcastelletti1y','Jules Castelletti',7.81,2,26);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jtullis1z','Jean Tullis',35.55,27,7);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('fpietruszka20','Flin Pietruszka',99.15,48,6);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jbartalin21','Jemimah Bartalin',35.01,40,19);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('mimms22','Maisie Imms',47.86,35,31);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('gmaidens23','Grier Maidens',14.19,41,23);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jburkman24','Jolee Burkman',1.11,19,37);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('ewyer25','Earvin Wyer',33.53,27,22);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('ngerold26','Nell Gerold',12.97,11,38);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('avenney27','Andie Venney',96.72,47,2);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('lcorns28','Loren Corns',64.06,1,29);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('lgulliman29','Lizzie Gulliman',45.16,20,12);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('bgammett2a','Benedict Gammett',16.35,34,42);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('blequeux2b','Beilul Lequeux',39.73,32,18);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('kswedeland2c','Kelly Swedeland',27.16,24,11);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('gdunbabin2d','Glenn Dunbabin',56.74,2,31);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('lhows2e','Lenore Hows',43.35,20,34);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('kjenks2f','Kimbra Jenks',21.52,40,40);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('gfetteplace2g','Gay Fetteplace',15.19,3,47);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('eattlee2h','Elias Attlee',89.45,4,21);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('asummergill2i','Aubrette Summergill',22.97,16,45);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('khans2j','Kinny Hans',94.28,42,49);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('lbrome2k','Loy Brome',77.44,38,42);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('nmccartan2l','Ninnetta McCartan',21.1,43,9);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('tdinnington2m','Templeton Dinnington',61.41,37,6);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('mdoyly2n','Martie D''Oyly',5.8,28,9);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jtrebilcock2o','Joni Trebilcock',82.4,22,38);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('jpawsey2p','Juliet Pawsey',48.69,19,6);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('btomsu2q','Boot Tomsu',17.38,34,30);
INSERT INTO SocialMedia(Instagram,Name,Popularity,GenreID,ArtistID) VALUES ('kince2r','Kevin Ince',72.64,4,42);
