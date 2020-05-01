CREATE DATABASE Boids;

USE Boids;

CREATE TABLE Users (
    id int NOT NULL UNIQUE AUTO_INCREMENT,
    firstname varchar(30) NOT NULL,
    lastname varchar(30) NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    birthDate Date,
    longitude int,
    latitude int,
    heighAccuracy int,
    updatedAt Date,
    createdAt Date,
    PRIMARY KEY (id)
);

CREATE TABLE Chat_Servers (
    id int NOT NULL UNIQUE AUTO_INCREMENT,
    leader_id int NOT NULL,
    name varchar(50) NOT NULL,
    createdAt DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (leader_id) REFERENCES Users(id)
);

CREATE TABLE Chat_Channels (
    id int NOT NULL UNIQUE AUTO_INCREMENT,
    server_id int NOT NULL,
    name varchar(20) NOT NULL,
    createdAt DATE,

    PRIMARY KEY (id),
    FOREIGN KEY (server_id) REFERENCES Chat_Servers(id)
);

Chat_Channels_Posts (
    id int NOT NULL UNIQUE AUTO_INCREMENT,
    channel_id int NOT NULL,
    user_id int NOT NULL,
    post varchar(250) NOT NULL,
    isHidden BOOLEAN,
    createdAt DATE,
    updatedAt Date,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES Chat_Channels(id)
    FOREIGN KEY (user_id) REFERENCES Users(id)
)