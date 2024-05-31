USE bike_rental;

-- rentals & weather
SELECT weathersit, sum(r.total_cnt) AS total_rentals, sum(r.casual_cnt) AS casual_rentals, sum(r.registered_cnt) AS registered_rentals FROM weather_info as w
JOIN rental_info as r on w.record_id = r.record_id
GROUP BY weathersit;

-- rentals & season
SELECT d.season, round(avg(w.atemp)*41,1) as average_temp, 
sum(r.total_cnt) as total_rentals, sum(r.casual_cnt) AS casual_rentals, sum(r.registered_cnt) AS registered_rentals  FROM weather_info as w
JOIN date_info as d on w.record_id = d.record_id
JOIN rental_info as r on w.record_id = r.record_id 
GROUP BY d.season; 

-- average rentals & season
SELECT d.season, 
avg(r.total_cnt) as avg_rentals, avg(r.casual_cnt) AS avg_casual_rentals, avg(r.registered_cnt) AS avg_registered_rentals  FROM weather_info as w
JOIN date_info as d on w.record_id = d.record_id
JOIN rental_info as r on w.record_id = r.record_id 
GROUP BY d.season; 

-- rentals & temprature (Celsius)
SELECT 
    CASE 
        WHEN w.atemp*41 < 10 THEN 'A1. 0-10°C'
        WHEN w.atemp*41 >= 10 AND w.atemp*41 < 20 THEN 'A2. 10-20°C'
        WHEN w.atemp*41 >= 20 AND w.atemp*41 < 30 THEN 'A3. 20-30°C'
        WHEN w.atemp*41 >= 30 AND w.atemp*41 < 40 THEN 'A3. 30-40°C'
        ELSE 'A4. Above 40°C'
    END AS temp_range,
    sum(r.total_cnt) AS total_rentals, sum(r.casual_cnt) AS casual_rentals, sum(r.registered_cnt) AS registered_rentals, 
    100*sum(r.casual_cnt)/sum(r.total_cnt) AS casual_percentage FROM weather_info as w
JOIN rental_info r ON w.record_id = r.record_id
GROUP BY temp_range
ORDER BY temp_range;

-- rentals & humidity (%)
SELECT 
	CASE 
        WHEN w.hum*100 < 20 THEN 'A1.dry'
        WHEN w.hum*100 >= 20 AND w.hum*100 < 50 THEN 'A2. normal'
        ELSE 'A3. humid'
    END AS hum_range,
	sum(r.total_cnt) AS total_rentals, sum(r.casual_cnt) AS casual_rentals, sum(r.registered_cnt) AS registered_rentals, 
    100*sum(r.casual_cnt)/sum(r.total_cnt) AS casual_percentage FROM weather_info as w
JOIN rental_info r ON w.record_id = r.record_id
GROUP BY hum_range
ORDER BY hum_range;

-- rentals & wind (mph)
SELECT 
	CASE 
        WHEN w.windspeed*67 <= 7 THEN 'A1.light air'
        WHEN w.windspeed*67 > 7 AND w.windspeed*67 <= 12 THEN 'A2. gentle breeze'
        WHEN w.windspeed*67 > 12 AND w.windspeed*67 <= 24 THEN 'A2. moderate breeze'
        WHEN w.windspeed*67 > 24 AND w.windspeed*67 <= 38 THEN 'A3. strong breeze'
        WHEN w.windspeed*67 > 38 AND w.windspeed*67 < 54 THEN 'A4. strong gale'
        ELSE 'A5. violent storm'
    END AS windspeed_range,
    sum(r.total_cnt) AS total_rentals, sum(r.casual_cnt) AS casual_rentals, sum(r.registered_cnt) AS registered_rentals, 
    100*sum(r.casual_cnt)/sum(r.total_cnt) AS ratio FROM weather_info as w
JOIN rental_info r ON w.record_id = r.record_id
GROUP BY windspeed_range
ORDER BY windspeed_range;

-- Cumulative sum of rentals over time
SELECT 
    r.record_id,
    d.date, 
    d.hr,
    SUM(r.registered_cnt) OVER(ORDER BY d.date) AS Cum_sum_registered,
    SUM(r.casual_cnt) OVER(ORDER BY d.date) AS Cum_sum_cusual
FROM rental_info as r
JOIN date_info as d ON r.record_id = d.record_id;


