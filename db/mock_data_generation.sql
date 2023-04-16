USE projectdb;

-- Song table data
INSERT INTO Song (id, title, bpm, danceability, duration, streams, release_date, artist_id, album_id, genre_id, chart_id) VALUES
(1, 'Shape of You', 96, 0.825, 233, 1000000000, '2017-01-06', 1, 1, 1, 1),
(2, 'Uptown Funk', 115, 0.864, 270, 750000000, '2014-11-10', 2, 2, 2, 1),
(3, 'Blinding Lights', 171, 0.514, 200, 500000000, '2019-11-29', 3, 3, 3, 1),
(4, 'Don''t Stop Believing', 120, 0.55, 243, 400000000, '1981-06-03', 4, 4, 4, 1),
(5, 'Bohemian Rhapsody', 72, 0.327, 354, 600000000, '1975-10-31', 5, 5, 5, 1);

-- Artist table data
INSERT INTO Artist (id, legal_name, stage_name, age, ranking, region_id, number_of_streams, chart_id) VALUES
(1, 'Edward Christopher Sheeran', 'Ed Sheeran', 31, 1, 1, 10000000000, 1),
(2, 'Mark Daniel Ronson', 'Mark Ronson', 46, 2, 2, 5000000000, 1),
(3, 'Abel Makkonen Tesfaye', 'The Weeknd', 32, 3, 3, 3000000000, 1),
(4, 'Journey', 'Journey', NULL, 4, 4, 1000000000, 1),
(5, 'Queen', 'Queen', NULL, 5, 5, 2000000000, 1);

-- Album table data
INSERT INTO Album (id, release_date, number_of_tracks, ranking, streams, distributor, chart_id) VALUES
(1, '2017-03-03', 12, 1, 5000000000, 'Atlantic Records', 1),
(2, '2015-01-27', 11, 2, 2500000000, 'RCA Records', 1),
(3, '2020-03-20', 14, 3, 2000000000, 'Republic Records', 1),
(4, '1981-07-31', 11, 4, 1000000000, 'Columbia Records', 1),
(5, '1975-11-21', 17, 5, 1500000000, 'EMI Records', 1);

-- Playlist table data
INSERT INTO Playlist (id, name, number_of_tracks, listening_time) VALUES
(1, 'Workout Mix', 15, 120),
(2, 'Chill Vibes', 20, 180),
(3, 'Throwback Jams', 10, 60),
(4, 'Road Trip', 25, 240),
(5, 'Party Anthems', 30, 300);

-- Genre table data
INSERT INTO Genre (id, name, ranking, chart_id) VALUES
(1, 'Pop', 1, 1),
(2, 'R&B', 2, 1),
(3, 'Alternative', 3, 1),
(4, 'Rock', 4, 1),
(5, 'Hip Hop', 5, 1);

-- Region table data
INSERT INTO Region (id, name, continent, country) VALUES
(1, 'United Kingdom', 'Europe', 'England'),
(2, 'United States', 'North America', 'California'),
(3, 'Canada', 'North America', 'Ontario'),
(4, 'Australia', 'Oceania', 'New South Wales'),
(5, 'Japan', 'Asia', 'Tokyo');

-- Label table data
INSERT INTO Label (id, name, artist_id) VALUES
(1, 'Atlantic Records', 1),
(2, 'RCA Records', 2),
(3, 'Republic Records', 3),
(4, 'Columbia Records', 4),
(5, 'EMI Records', 5);

-- Producer table data
INSERT INTO Producer (id, name, artist_id) VALUES
(1, 'Max Martin', 1),
(2, 'Mark Ronson', 2),
(3, 'Illangelo', 3),
(4, 'Mike Clink', 4),
(5, 'Roy Thomas Baker', 5);

-- Tours table data
INSERT INTO Tours (id, name, date, artist_id, region_id) VALUES
(1, 'Divide Tour', '2017-03-16', 1, 1),
(2, 'Uptown Special Tour', '2015-02-25', 2, 2),
(3, 'After Hours Tour', '2022-01-14', 3, 3),
(4, 'Escape Tour', '1981-07-10', 4, 4),
(5, 'A Night at the Opera Tour', '1975-11-14', 5, 5);

-- Socials table data
INSERT INTO Socials (artist_id, instagram, twitter, youtube, tiktok) VALUES
(1, 'edsheeran', 'edsheeran', 'edsheeran', 'edsheeran'),
(2, 'iammarkronson', 'iammarkronson', 'iammarkronson', 'iammarkronson'),
(3, 'theweeknd', 'theweeknd', 'theweeknd', 'theweeknd'),
(4, 'journeymusicofficial', 'journeyofficial', 'journeyVEVO', 'journey'),
(5, 'officialqueenmusic', 'QueenWillRock', 'QueenOfficial', 'queen');

-- Merchandise table data
INSERT INTO Merchandise (id, name, merchandise_type, price) VALUES
(1, 'Divide Hoodie', 'Clothing', 50.00),
(2, 'Mark Ronson Hat', 'Accessories', 25.00),
(3, 'After Hours T-shirt', 'Clothing', 30.00),
(4, 'Escape Album Vinyl', 'Music', 20.00),
(5, 'A Night at the Opera Poster', 'Art', 15.00);

-- Chart table data
INSERT INTO Chart (id, name, ranking, streams) VALUES
(1, 'Top 100', 1, 10000000000),
(2, 'Billboard 200', 2, 5000000000),
(3, 'UK Top 40', 3, 3000000000),
(4, 'Classic Rock',4, 2000000000),
(5, 'Hip Hop/R&B', 5, 1500000000);