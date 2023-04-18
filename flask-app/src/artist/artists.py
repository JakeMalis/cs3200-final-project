from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

artists = Blueprint('artists', __name__)


## ------------------------------------ GET METHODS ------------------------------------------------------------------------------------


## ------------------------------------ Working in Artist METHODS ------------------------------------------------------------------------------------

# Get all artists from the DB -- WORKING !
@artists.route('/GetAllartists', methods=['GET'])
def get_artists():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Artist')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)

# Get artist detail for artist with particular artistID
@artists.route('/Getartists/<artistID>', methods=['GET'])
def get_artist(artistID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Artist WHERE ArtistID = {0}'.format(artistID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

## ------------------------------------ Working in Song METHODS ------------------------------------------------------------------------------------

    # get the top 10 songs from a genre -- working but hardcoded
@artists.route('/mostStreamed', methods=['GET'])
def get_most_pop_songs():
    cursor = db.get_db().cursor()
    query = '''
        SELECT SongTitle, NumStreams
        FROM Song s
            JOIN SongGenre sg on s.SongID = sg.SongID
            JOIN Genre g on sg.GenreID = g.GenreID
        WHERE GenreName = 'Pop'
        
        ORDER BY NumStreams DESC
        LIMIT 10
    '''
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

# Get all the songs in a given chart -- working but hard coded
@artists.route('/getChartSongs', methods=['GET'])
def get_songs_chart():
    cursor = db.get_db().cursor()
    query = '''
Select SongTitle
        FROM Song s
            JOIN SongChart sc on s.SongID = sc.SongID
            JOIN Chart c on sc.ChartID = c.ChartID
        WHERE ChartName =
'''
    query += "'Oricon'"

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

# Get all songs from a given playlist -- working but hard coded
@artists.route('/getPlaylistSongs', methods=['GET'])
def get_songs_playlist():
    cursor = db.get_db().cursor()
    query = '''
        Select SongTitle
        FROM Song s
            JOIN SongPlaylist sp on s.SongID = sp.SongID
            JOIN Playlist p on sp.PlaylistID = p.PlaylistID
        WHERE PlaylistName =
'''
    query += "'Relaxing Songs'"

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
@artists.route('/Addartist', methods=['POST'])
def add_artist():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Artist (ArtistID, LegalName, StageName, Age, Popularity, LabelID) \
                    VALUES (%s, %s, %s, %s, %s)', 
                    (data['ArtistID'], data['LegalName'], data['StageName'], data['Age'], data['Popularity'], data[LabelID]))
    db.get_db().commit()
    return 'Success'


## ------------------------------------ PUT METHODS ------------------------------------------------------------------------------------

# Update an existing artist in the DB
@artists.route('/artists/<artistID>', methods=['PUT'])
def update_artist(artistID):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE artist SET LegalName=%s, StageName=%s, Age=%s, Region=%s, Popularity=%s, NumberOfStreams=%s \
                    WHERE ArtistID=%s',
                    (data['LegalName'], data['StageName'], data['Age'], data['Region'], data['Popularity'], data['NumberOfStreams'], artistID))
    db.get_db().commit()
    return 'Success'


# Add a new song to a specified playlist -- WORKING
@artists.route('/addNewSongToPlaylist', methods=['PUT'])
def add_new_song_to_playlist():
    the_data = request.json #request is the object created when this code is executed
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

# Delete an artist from the DB
@artists.route('/DeleteArtist', methods=['DELETE'])
def delete_artist():
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Artist WHERE ArtistID=102031')
    db.get_db().commit()
    return 'Success'