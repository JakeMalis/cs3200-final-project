from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

label = Blueprint('label', __name__)

# Get all artists from the DB -- WORKING !
@label.route('/getAllArtists', methods=['GET'])
def get_artists():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Artist')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)

# Get all tours in a Country and State
@label.route('/getRegionTours', methods=['GET'])
def get_region_tours():
    country = request.args.get('country')
    state = request.args.get('state')

    cursor = db.get_db().cursor()
    query = '''
        SELECT t.Name, DateAndTime
        FROM Tour t
            JOIN TourRegion tr on t.TourID = tr.TourID
            JOIN Region r on tr.RegionID = r.RegionID
        WHERE Country = 
    '''
    query += country
    query += "        and State = "
    query += state
    query += "        order by DateAndTime"


    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)

# Add New Merch
@label.route('/addMerch', methods=['POST'])
def add_merch():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Merchandise (MerchandiseID, MerchandiseName, MerchandiseType, Price) \
                    VALUES (%s, %s, %s, %s)', 
                    (data['MerchandiseID'], data['MerchandiseName'], data['MerchandiseType'], data['Price']))
    db.get_db().commit()
    return 'Success'

# Update the label of an artist in the DB
@label.route('/updateLabel', methods=['PUT'])
def update_artist():
    the_data = request.json

    artist_name = the_data['artist_name']
    label_name = the_data['label_name']

    cursor = db.get_db().cursor()
    query = '''
        UPDATE Artist
        SET LabelID = (Select LabelID
                        From Label
                        Where LabelName =
    '''
    query += str(label_name) + ')'
    query += " WHERE StageName = "
    query += str(artist_name)
    cursor.execute(query)
    db.get_db().commit()
    return 'Success'

@label.route('/getPopularArtists', methods=['GET'])
def get_most_pop_artist():
    cursor = db.get_db().cursor()
    query = '''
        SELECT Name, Instagram
        FROM SocialMedia
        ORDER BY Popularity DESC
        LIMIT 10
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

@label.route('/getProducerArtists', methods=['GET'])
def get_producer_artists():
    cursor = db.get_db().cursor()
    producer_name = request.args.get('producer_name')
    query = '''
        Select StageName, LegalName, Popularity
        FROM Artist a
            JOIN ArtistProducer ap on a.ArtistID = ap.ArtistID
            JOIN Producer p on ap.ProducerID = p.ProducerID
        WHERE ProducerName =
'''
    query += str(producer_name)
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()

    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# get all merchandise from the database
@label.route('/getAllMerchandise', methods=['GET'])
def get_artists():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Merchandise')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)

# delete merchandise from the db
@label.route('/deleteMerch', methods=['DELETE'])
def delete_artist():
    cursor = db.get_db().cursor()
    merchandise_id = request.args.get('merchandise_id')
    cursor.execute('DELETE FROM Merchandise WHERE MerchandiseID=' + merchandise_id)
    db.get_db().commit()
    return 'Success'