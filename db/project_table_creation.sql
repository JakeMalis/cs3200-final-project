CREATE DATABASE projectdb;
USE projectdb;

CREATE TABLE Song (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    bpm INT,
    danceability DECIMAL(3,2),
    duration INT,
    streams BIGINT,
    release_date DATE,
    artist_id INT,
    album_id INT,
    genre_id INT,
    chart_id INT
);

CREATE TABLE Artist (
    id INT PRIMARY KEY,
    legal_name VARCHAR(255) NOT NULL,
    stage_name VARCHAR(255) NOT NULL,
    age INT,
    ranking INT,
    region_id INT,
    number_of_streams BIGINT,
    chart_id INT
);

CREATE TABLE Album (
    id INT PRIMARY KEY,
    release_date DATE,
    number_of_tracks INT,
    ranking INT,
    streams BIGINT,
    distributor VARCHAR(255),
    chart_id INT
);

CREATE TABLE Playlist (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    number_of_tracks INT,
    listening_time INT
);

CREATE TABLE Genre (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ranking INT,
    chart_id INT
);

CREATE TABLE Region (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    continent VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

CREATE TABLE Label (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    artist_id INT
);

CREATE TABLE Producer (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    artist_id INT
);

CREATE TABLE Tours (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date DATE,
    artist_id INT,
    region_id INT
);

CREATE TABLE Socials (
    artist_id INT PRIMARY KEY,
    instagram VARCHAR(255),
    twitter VARCHAR(255),
    youtube VARCHAR(255),
    tiktok VARCHAR(255)
);

CREATE TABLE Merchandise (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    merchandise_type VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2)
);

CREATE TABLE Chart (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ranking INT,
    streams BIGINT
);

ALTER TABLE Song ADD FOREIGN KEY (artist_id) REFERENCES Artist(id);
ALTER TABLE Song ADD FOREIGN KEY (album_id) REFERENCES Album(id);
ALTER TABLE Song ADD FOREIGN KEY (genre_id) REFERENCES Genre(id);
ALTER TABLE Song ADD FOREIGN KEY (chart_id) REFERENCES Chart(id);
ALTER TABLE Artist ADD FOREIGN KEY (region_id) REFERENCES Region(id);
ALTER TABLE Artist ADD FOREIGN KEY (chart_id) REFERENCES Chart(id);
ALTER TABLE Album ADD FOREIGN KEY (chart_id) REFERENCES Chart(id);
ALTER TABLE Genre ADD FOREIGN KEY (chart_id) REFERENCES Chart(id);
ALTER TABLE Label ADD FOREIGN KEY (artist_id) REFERENCES Artist(id);
ALTER TABLE Producer ADD FOREIGN KEY (artist_id) REFERENCES Artist(id);
ALTER TABLE Tours ADD FOREIGN KEY (artist_id) REFERENCES Artist(id);
ALTER TABLE Tours ADD FOREIGN KEY (region_id) REFERENCES Region(id);
ALTER TABLE Socials ADD FOREIGN KEY (artist_id) REFERENCES Artist(id);