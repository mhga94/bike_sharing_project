-- DROP DATABASE bike_rental;
CREATE DATABASE bike_rental;
USE bike_rental;

DROP TABLE IF EXISTS date_info;
CREATE TABLE date_info (
    record_id INT PRIMARY KEY,
    date DATE,
    season INT,
    yr INT,
    mnth INT,
    hr INT,
    holiday BOOLEAN,
    weekday INT,
    workingday BOOLEAN
);

CREATE TABLE weather_info (
    record_id INT PRIMARY KEY,
    weathersit INT,
    temp FLOAT,
    atemp FLOAT,
    hum FLOAT,
    windspeed FLOAT,
    FOREIGN KEY (record_id) REFERENCES date_info(record_id)
);

CREATE TABLE rental_info (
    record_id INT PRIMARY KEY,
    casual_cnt INT,
    registered_cnt INT,
    total_cnt INT,
    FOREIGN KEY (record_id) REFERENCES date_info(record_id)
);