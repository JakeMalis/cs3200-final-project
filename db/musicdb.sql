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

INSERT INTO Artist (ArtistID, LegalName, StageName, Age, Popularity, LabelID)
VALUES (1, 'Abel Tesfaye', 'The Weeknd', 32, 90, 1);

INSERT INTO Song (SongID, SongTitle, BPM, Danceability, Duration, NumStreams, ReleaseDate, AlbumID)
VALUES (1, 'Blinding Lights', 171, 0.514, 200, 10000000, '2020-11-29', 1);

INSERT INTO Album (AlbumID, AlbumTitle, ReleaseDate, NumTracks, Popularity)
VALUES (1, 'After Hours', '2020-03-20', 14, 85.5);

INSERT INTO Genre (GenreID, GenreName, Popularity)
VALUES (1, 'R&B', 80);

INSERT INTO SongGenre (GenreID, SongID)
VALUES (1, 1);

INSERT INTO Chart (ChartID, ChartName)
VALUES (1, 'Top 100');

INSERT INTO SongChart (ChartID, SongID)
VALUES (1, 1);

INSERT INTO Playlist (PlaylistID, PlaylistName, NumTracks, TotalListeningTime)
VALUES (1, 'My Playlist', 10, 500);

INSERT INTO SongPlaylist (PlaylistID, SongID)
VALUES (1, 1);

INSERT INTO Tour (TourID, Name, DateAndTime)
VALUES (1, 'After Hours Tour', '2022-01-01 20:00:00');

INSERT INTO ArtistTour (TourID, ArtistID)
VALUES (1, 1);

INSERT INTO Region (RegionID, Name, Location, Continent, Country, State, City)
VALUES (1, 'North America', 'Toronto', 'North America', 'Canada', 'Ontario', 'Toronto');

INSERT INTO Merchandise (MerchandiseID, MerchandiseName, MerchandiseType, Price)
VALUES (1, 'After Hours T-Shirt', 'T-Shirt', 30.00);

INSERT INTO MerchandiseArtist (MerchandiseID, ArtistID)
VALUES (1, 1);

INSERT INTO Label (LabelID, LabelName)
VALUES (1, 'Republic Records');

INSERT INTO ArtistProducer (ArtistID, ProducerID)
VALUES (1, 1);

INSERT INTO Producer (ProducerID, ProducerName)
VALUES (1, 'Max Martin');

INSERT INTO SocialMedia (Instagram, GenreID, Name, Popularity, ArtistID)
VALUES ('@theweeknd', 1, 'The Weeknd', 95, 1);

