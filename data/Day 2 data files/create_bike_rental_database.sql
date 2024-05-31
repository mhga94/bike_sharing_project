CREATE DATABASE IF NOT EXISTS bike_rental;

USE bike_rental;

DROP TABLE IF EXISTS Date_info;

-- Table for Date Information
--
-- dteday : date
-- season : season (1:winter, 2:spring, 3:summer, 4:fall)
-- yr : year (0: 2011, 1:2012)
-- mnth : month (1 to 12)
-- hr : hour (0 to 23)
-- holiday : whether day is holiday or not (extracted from http://dchr.dc.gov/page/holiday-schedule)
-- weekday : day of the week
-- workingday : if day is neither weekend nor holiday is 1, otherwise is 0.

CREATE TABLE date_info (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    dteday date NOT NULL,
    season INT NOT NULL,
    yr INT NOT NULL,    
    mnth INT NOT NULL,
    holiday BOOLEAN NOT NULL,
    weekday INT NOT NULL,
    workingday BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS weather_info;

-- Table for Weather Information
--
-- weathersit : 
--   - 1: Clear, Few clouds, Partly cloudy, Partly cloudy
--   - 2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
--   - 3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
--   - 4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog
-- temp : Normalized temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), t_min=-8, t_max=+39 (only in hourly scale)
-- atemp: Normalized feeling temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), t_min=-16, t_max=+50 (only in hourly scale)
-- hum: Normalized humidity. The values are divided to 100 (max)
-- windspeed: Normalized wind speed. The values are divided to 67 (max)

CREATE TABLE weather_info (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id INT,
    dteday INT NOT NULL,
    weathersit INT NOT NULL,
    temp FLOAT NOT NULL,
    atemp FLOAT NOT NULL,
    hum FLOAT NOT NULL,
    windspeed FLOAT NOT NULL,
    FOREIGN KEY (date_id) 
		REFERENCES Date_info(date_id)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

SELECT * FROM bike_rental.date_info
LIMIT 10;

SELECT * FROM bike_rental.rental_info
LIMIT 10;

SELECT * FROM bike_rental.weather_info
LIMIT 10;

DROP TABLE IF EXISTS Rental_info;

-- Table for Rental Information
--
-- casual: count of casual users
-- registered: count of registered users
-- cnt: count of total rental bikes including both casual and registered
    
CREATE TABLE Rental_info (
    record_id INT AUTO_INCREMENT PRIMARY KEY,   -- 'instant' column in original database, i.e. recor index 
    date_id INT,
    dteday INT NOT NULL,
    hr INT NOT NULL,
    weather_id INT,
    casual_cnt INT NOT NULL,     -- casual in original database
    registered_cnt INT NOT NULL, -- registered in original database
    total_cnt INT NOT NULL,      -- cnt in original database
    FOREIGN KEY (date_id) 
		REFERENCES date_info(date_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (weather_id) 
		REFERENCES weather_info(weather_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);
