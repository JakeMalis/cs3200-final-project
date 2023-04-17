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

INSERT INTO Song (SongID, SongTitle, BPM, Danceability, Duration, NumStreams, ReleaseDate, AlbumID) VALUES
(1, 'Song A', 120, 0.8, 3.5, 1000000, '2020-01-01', 1),
(2, 'Song B', 100, 0.6, 4.2, 800000, '2019-05-15', 2),
(3, 'Song C', 140, 0.9, 2.8, 500000, '2021-02-28', 3),
(4, 'Song D', 80, 0.5, 5.1, 1200000, '2018-10-10', 2),
(5, 'Song E', 160, 0.7, 3.9, 900000, '2022-03-20', 1);

INSERT INTO Album (AlbumID, AlbumTitle, ReleaseDate, NumTracks, Popularity) VALUES
(1, 'Album A', '2020-01-01', 10, 0.7),
(2, 'Album B', '2019-05-15', 12, 0.9),
(3, 'Album C', '2021-02-28', 8, 0.6),
(4, 'Album D', '2018-10-10', 14, 0.8),
(5, 'Album E', '2022-03-20', 9, 0.5);

INSERT INTO Genre (GenreID, GenreName, Popularity) VALUES
(1, 'Pop', 0.8),
(2, 'Rock', 0.7),
(3, 'Hip Hop', 0.6),
(4, 'Country', 0.5),
(5, 'Electronic', 0.4);

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

INSERT INTO Playlist (PlaylistID,
PlaylistName, NumTracks, TotalListeningTime) VALUES
(1, 'Workout Mix', 15, 45.2),
(2, 'Relaxing Songs', 12, 36.8),
(3, 'Driving Playlist', 20, 60.5),
(4, 'Party Tunes', 25, 77.3),
(5, 'Road Trip', 18, 53.2);

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