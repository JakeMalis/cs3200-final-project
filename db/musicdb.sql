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
(1, 'Song A', 120, 0.8, 3.5, 1000000, '2020-01-01', 1),
(2, 'Song B', 100, 0.6, 4.2, 800000, '2019-05-15', 2),
(3, 'Song C', 140, 0.9, 2.8, 500000, '2021-02-28', 3),
(4, 'Song D', 80, 0.5, 5.1, 1200000, '2018-10-10', 2),
(5, 'Song E', 160, 0.7, 3.9, 900000, '2022-03-20', 1);

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
(3, 'Hip Hop', 0.6),
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

INSERT INTO Chart (ChartID, ChartName) VALUES
(1, 'Billboard Hot 100'),
(2, 'UK Top 40'),
(3, 'Oricon');

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
INSERT INTO SongGenre(SongID,GenreID) VALUES (31,24);
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

INSERT INTO Tour (TourID, Name, DateAndTime) VALUES
(1, 'World Tour 2022', '2022-06-15 20:00:00'),
(2, 'Summer Tour 2023', '2023-07-01 18:30:00'),
(3, 'Fall Tour 2024', '2024-10-01 19:00:00'),
(4, 'Winter Tour 2025', '2025-12-15 21:00:00'),
(5, 'Spring Tour 2026', '2026-04-01 17:30:00');

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

INSERT INTO Region (RegionID, Name, Location, Continent, Country, State, City) VALUES
(1, 'North America', 'NA', 'North America', 'United States', 'California', 'Los Angeles'),
(2, 'South America', 'SA', 'South America', 'Brazil', 'São Paulo', 'São Paulo'),
(3, 'Europe', 'EU', 'Europe', 'United Kingdom', 'England', 'London'),
(4, 'Asia', 'AS', 'Asia', 'Japan', 'Tokyo', 'Tokyo'),
(5, 'Oceania', 'OC', 'Oceania', 'Australia', 'New South Wales', 'Sydney');

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

INSERT INTO Merchandise (MerchandiseID, MerchandiseName, MerchandiseType, Price) VALUES
(1, 'T-Shirt', 'Clothing', 20.99),
(2, 'Cap', 'Accessories', 12.50),
(3, 'CD', 'Music', 9.99),
(4, 'Poster', 'Home Decor', 7.99),
(5, 'Vinyl Record', 'Music', 24.99);

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

INSERT INTO Label (LabelID, LabelName) VALUES
(1, 'Universal Music Group'),
(2, 'Sony Music Entertainment'),
(3, 'Warner Music Group'),
(4, 'EMI'),
(5, 'Atlantic Records');

INSERT INTO ArtistProducer (ProducerID, ArtistID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4),
(4, 2),
(5, 5),
(5, 3);

INSERT INTO Producer (ProducerID, ProducerName) VALUES
(1, 'Max Martin'),
(2, 'Dr. Luke'),
(3, 'Timbaland'),
(4, 'Rick Rubin'),
(5, 'Calvin Harris');

INSERT INTO SocialMedia (Instagram, Name, Popularity, GenreID, ArtistID) VALUES
('j_smith', 'John Smith', 0.8, 1, 1),
('j_doe', 'Jane Doe', 0.7, 2, 2),
('d_lee', 'David Lee', 0.6, 3, 3),
('s_brown', 'Sarah Brown', 0.5, 4, 4),
('k_kim', 'Kevin Kim', 0.4, 5, 5);


INSERT INTO Chart (ChartID, ChartName) VALUES
(1, 'Billboard Hot 100'),
(2, 'UK Top 40'),
(3, 'Oricon');

INSERT INTO Chart(ChartID,ChartName) VALUES (4,'Chart 4');