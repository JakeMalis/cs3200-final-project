# CS 3200 Final Project - Sound of Melodies

The Sound of Melodies is an application built for music listeners, artists, and music labels to gather information about the songs, artists, and producers that they listen to. For example, users can learn about tours from their favorite artist, add songs to playlists, or find the most popular songs in the genre of their choice. Additionally, Labels can manage artist's merchandise, social media, and more. 

This project was built in Python, using the Flask framework. A user interface was built and deployed using AppSmith, and a MySQL database hosted on Docker holds all the data that the application utilizes. 

This repo contains a boilerplate setup for spinning up 3 Docker containers: 
1. A MySQL 8 container
1. A Python Flask container to implement a REST API
1. A Local AppSmith Server

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Build the images with `docker compose build`
2. Start the containers with `docker compose up`
3. Navigate to http://localhost:8080/app/sound-of-melodies/page1-643c3bdd087b5e119945a51a in your browser


# Sound of Melodies Group Members
Rohil Doshi (doshi.rohi@northeastern.edu)

Krishi Patel (patel.krishi1@northeastern.edu)

Anisha Singh (singh.anish@northeastern.edu)

Jake Malis (malis.j@northeastern.edu)
