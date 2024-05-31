USE bike_rental;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bike_rental_date.csv'
INTO TABLE date_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(instant, @date, season, yr, mnth, hr, holiday, weekday, workingday);
SET date = STR_TO_DATE(@date, '%Y-%m-%d');

SELECT * FROM date_info;

ALTER TABLE rental_info DROP FOREIGN KEY rental_info_ibfk_1;
ALTER TABLE rental_info DROP FOREIGN KEY rental_info_ibfk_2;
ALTER TABLE weather_info DROP FOREIGN KEY weather_info_ibfk_1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bike_rental_weather.csv'
INTO TABLE weather_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(instant, weathersit, temp, atemp, hum, windspeed);

SELECT * FROM weather_info;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bike_rental_rental.csv'
INTO TABLE rental_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(instant, casual_cnt, registered_cnt, total_cnt);

SELECT * FROM rental_info;