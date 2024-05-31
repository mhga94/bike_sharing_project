CREATE DATABASE bike_rental;
USE bike_rental;

-- Table for Date Information
--
-- dteday : date
-- season : season (1:winter, 2:spring, 3:summer, 4:fall)
-- yr : year (0: 2011, 1:2012)
-- mnth : month ( 1 to 12)
-- hr : hour (0 to 23)
-- holiday : weather day is holiday or not (extracted from http://dchr.dc.gov/page/holiday-schedule)
-- weekday : day of the week
-- workingday : if day is neither weekend nor holiday is 1, otherwise is 0.

CREATE TABLE date_info (
    record_id INT PRIMARY KEY,  -- 'instant' column in original dataset, i.e. record index 
    date DATE,
    season INT,
    yr INT,
    mnth INT,
    hr INT,
    holiday BOOLEAN,
    weekday INT,
    workingday BOOLEAN
);

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
    record_id INT PRIMARY KEY,   -- 'instant' column in original dataset, i.e. recor index 
    weathersit INT,
    temp FLOAT,
    atemp FLOAT,
    hum FLOAT,
    windspeed FLOAT,
    FOREIGN KEY (record_id) REFERENCES date_info(record_id)
);

-- Table for Rental Information
--
-- casual: count of casual users
-- registered: count of registered users
-- cnt: count of total rental bikes including both casual and registered

CREATE TABLE rental_info (
    record_id INT PRIMARY KEY,  -- 'instant' column in original dataset, i.e. recor index 
    casual_cnt INT,
    registered_cnt INT,
    total_cnt INT,
    FOREIGN KEY (record_id) REFERENCES date_info(record_id)
);