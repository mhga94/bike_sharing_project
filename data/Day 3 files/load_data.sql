LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bike_rental_date.csv'
INTO TABLE date_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(record_id, date, season, yr, mnth, hr, holiday, weekday, workingday);

SELECT * FROM date_info;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bike_rental_weather.csv'
INTO TABLE weather_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(record_id, weathersit, temp, atemp, hum, windspeed);

SELECT * FROM weather_info;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bike_rental_rental.csv'
INTO TABLE rental_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(record_id, casual_cnt, registered_cnt, total_cnt);

SELECT * FROM rental_info;



