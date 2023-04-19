from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db
from datetime import datetime

songs = Blueprint('songs', __name__)


## ------------------------------------ GET METHODS ------------------------------------------------------------------------------------------------
## ------------------------------------ Working in Song METHODS ------------------------------------------------------------------------------------

# Get all songs from the database
@songs.route('/getAllSongs', methods=['GET'])
def get_all_songs():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Song')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)

# Get Song details for a song with a particular SongID
@songs.route('/getSong', methods=['GET'])
def get_song_by_songId():
    cursor = db.get_db().cursor()
    songID = request.args.get('song_id')
    query = '''
select * from Song 
         where SongID =
'''
    query += str(songID)

    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# get the top 10 songs from a genre
@songs.route('/mostStreamed', methods=['GET'])
def get_most_pop_songs():
    cursor = db.get_db().cursor()
    genre_name = request.args.get('genre_name')
    query = '''
        SELECT SongTitle, NumStreams
        FROM Song s
            JOIN SongGenre sg on s.SongID = sg.SongID
            JOIN Genre g on sg.GenreID = g.GenreID
        WHERE GenreName = 
    '''
    query += str(genre_name)

    query += "        order by NumStreams DESC" + "\nlimit 10"

    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


## ------------------------------------ Working in Chart METHODS ------------------------------------------------------------------------------------

# Get all the songs in a given chart
@songs.route('/getChartSongs', methods=['GET'])
def get_songs_chart():
    cursor = db.get_db().cursor()
    chart_name = request.args.get('chart_name')
    query = '''
Select SongTitle
        FROM Song s
            JOIN SongChart sc on s.SongID = sc.SongID
            JOIN Chart c on sc.ChartID = c.ChartID
        WHERE ChartName =
'''
    query += str(chart_name)

    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


## ------------------------------------ Working in playlist METHODS ------------------------------------------------------------------------------------

# Get all songs from a given playlist
@songs.route('/getPlaylistSongs', methods=['GET'])
def get_songs_playlist():
    cursor = db.get_db().cursor()
    playlist_name = request.args.get('playlist_name')
    query = '''
        Select SongTitle
        FROM Song s
            JOIN SongPlaylist sp on s.SongID = sp.SongID
            JOIN Playlist p on sp.PlaylistID = p.PlaylistID
        WHERE PlaylistName =
'''
    query += str(playlist_name)

    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data) 



## ------------------------------------ POST METHODS ------------------------------------------------------------------------------------

# Add new artist to the DB -- working
@songs.route('/addArtist', methods=['POST'])
def add_artist():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Artist (ArtistID, LegalName, StageName, Age, Popularity, LabelID) \
                    VALUES (%s, %s, %s, %s, %s, %s)', 
                    (data['ArtistID'], data['LegalName'], data['StageName'], data['Age'], data['Popularity'], data['LabelID']))
    db.get_db().commit()
    return 'Success'

# add new song
@songs.route('/addSong', methods=['POST'])
def add_new_song():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Song (SongID, SongTitle, BPM, Danceability, Duration, NumStreams, ReleaseDate, AlbumID) \
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)', 
                    (data['SongID'], data['SongTitle'], data['BPM'], data['Danceability'], data['Duration'], data['NumStreams'], data['ReleaseDate'], data['AlbumID'] ))
    db.get_db().commit()

    return 'Success!'




## ------------------------------------ PUT METHODS ------------------------------------------------------------------------------------

# Update an existing artist in the DB
@songs.route('/updateArtist', methods=['PUT'])
def update_artist():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE Artist SET Age=%s \
                    WHERE ArtistID=%s',
                    (data['Age'], data['artistID']))
    db.get_db().commit()
    return 'Success'


# Add a new song to a specified playlist -- WORKING but hard coded
@songs.route('/addNewSongToPlaylist', methods=['PUT'])
def add_new_song_to_playlist():
    the_data = request.json
    current_app.logger.info(the_data)

    # fields in app smith need to be named the exact same way in order for extraction to work
    playlist_ID = the_data['playlist_id']
    song_ID = the_data['song_id']


    query = 'insert into SongPlaylist (PlaylistID, SongID) values ("'
    query += str(playlist_ID) + '", "'
    query += str(song_ID) + '")'

    query2 = '''
        UPDATE Playlist
        SET NumTracks = NumTracks + 1
        WHERE PlaylistID = 
    
    '''
    query2 += str(playlist_ID)

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor1 = db.get_db().cursor()
    cursor.execute(query)
    cursor1.execute(query2)
    db.get_db().commit()

    return 'Success!'


## ------------------------------------ DELETE METHODS ------------------------------------------------------------------------------------

# Delete an artist from the DB -- working but codwd
@songs.route('/deleteArtist', methods=['DELETE'])
def delete_artist():
    cursor = db.get_db().cursor()
    artist_id = request.args.get('artist_id')
    cursor.execute('DELETE FROM Artist WHERE ArtistID=' + artist_id)
    db.get_db().commit()
    return 'Success'

# Delete an artist from the DB -- working but hard coded
@songs.route('/deleteSong', methods=['DELETE'])
def delete_song():
    cursor = db.get_db().cursor()
    song_id = request.args.get('song_id')
    cursor.execute('DELETE FROM Song WHERE SongID=' + song_id)
    db.get_db().commit()
    return 'Success'