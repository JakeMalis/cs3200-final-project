from flask import Blueprint, request, jsonify, make_response
from src import db

artists = Blueprint('artists', __name__)

# Get all artists from the DB
@artists.route('/artists', methods=['GET'])
def get_artists():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM artist')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get artist detail for artist with particular artistID
@artists.route('/artists/<artistID>', methods=['GET'])
def get_artist(artistID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM artist WHERE ArtistID = {0}'.format(artistID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Add new artist to the DB
@artists.route('/artists', methods=['POST'])
def add_artist():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO artist (LegalName, StageName, Age, Region, Popularity, NumberOfStreams) \
                    VALUES (%s, %s, %s, %s, %s, %s)', 
                    (data['LegalName'], data['StageName'], data['Age'], data['Region'], data['Popularity'], data['NumberOfStreams']))
    db.get_db().commit()
    return 'Success'

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

# Delete an artist from the DB
@artists.route('/artists/<artistID>', methods=['DELETE'])
def delete_artist(artistID):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM artist WHERE ArtistID={0}'.format(artistID))
    db.get_db().commit()
    return 'Success'
