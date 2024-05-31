USE bike_rental;

-- Group by season
SELECT season, COUNT(record_id) AS rentals,
CASE 
    WHEN season = 1 THEN 'Winter'
    WHEN season = 2 THEN 'Spring'
    WHEN season = 3 THEN 'Summer'
    WHEN season = 4 THEN 'Fall'
END AS 'Season_name'
FROM bike_rental.date_info
GROUP BY season
ORDER BY season ASC;

-- Group by weekday
SELECT weekday,
CASE 
    WHEN weekday = 0 THEN 'Sunday'
    WHEN weekday = 1 THEN 'Monday'
    WHEN weekday = 2 THEN 'Tuesday'
    WHEN weekday = 3 THEN 'Wednesday'
    WHEN weekday = 4 THEN 'Thursday'
	WHEN weekday = 5 THEN 'Friday'
    WHEN weekday = 6 THEN 'Saturday'
END AS 'day_name',
COUNT(record_id) as rentals
FROM bike_rental.date_info
GROUP BY weekday
ORDER BY weekday ASC;

-- Group by weekday, segmented by user type
SELECT a.weekday,
CASE 
    WHEN a.weekday = 0 THEN 'Sunday'
    WHEN a.weekday = 1 THEN 'Monday'
    WHEN a.weekday = 2 THEN 'Tuesday'
    WHEN a.weekday = 3 THEN 'Wednesday'
    WHEN a.weekday = 4 THEN 'Thursday'
	WHEN a.weekday = 5 THEN 'Friday'
    WHEN a.weekday = 6 THEN 'Saturday'
END AS 'day_name',
SUM(b.casual_cnt) AS casual_rentals, SUM(b.registered_cnt) AS registered_rentals
FROM bike_rental.date_info AS a
JOIN bike_rental.rental_info AS b
ON a.record_id = b.record_id
GROUP BY weekday
ORDER BY weekday;

-- Group by workingday
SELECT workingday, COUNT(record_id) FROM bike_rental.date_info
GROUP BY workingday;

-- Group by workingday segmented by user type
SELECT a.workingday,
CASE 
    WHEN a.workingday = 0 THEN 'Not_working_day'
    WHEN a.workingday = 1 THEN 'Working_day'
END AS 'day_type',
SUM(b.casual_cnt) AS casual_rentals, SUM(b.registered_cnt) AS registered_rentals
FROM bike_rental.date_info AS a
JOIN bike_rental.rental_info AS b
ON a.record_id = b.record_id
GROUP BY workingday
ORDER BY workingday;

-- Group by weekday, segmented by user type
SELECT a.weekday,
CASE 
    WHEN a.weekday = 0 THEN 'Sunday'
    WHEN a.weekday = 1 THEN 'Monday'
    WHEN a.weekday = 2 THEN 'Tuesday'
    WHEN a.weekday = 3 THEN 'Wednesday'
    WHEN a.weekday = 4 THEN 'Thursday'
	WHEN a.weekday = 5 THEN 'Friday'
    WHEN a.weekday = 6 THEN 'Saturday'
END AS 'day_name',
SUM(b.casual_cnt) AS casual_rentals, SUM(b.registered_cnt) AS registered_rentals
FROM bike_rental.date_info AS a
JOIN bike_rental.rental_info AS b
ON a.record_id = b.record_id
GROUP BY weekday
ORDER BY weekday;


-- Group by holiday
SELECT holiday, COUNT(record_id) FROM bike_rental.date_info
GROUP BY holiday;

-- Group by holiday, segmented by user type
SELECT a.holiday,
CASE 
    WHEN a.holiday = 0 THEN 'Not_holiday'
    WHEN a.holiday = 1 THEN 'Holiday'
END AS 'day_type',
SUM(CASE WHEN a.holiday = 0 THEN b.casual_cnt / 711 ELSE b.casual_cnt / 20 END) AS casual_rentals,
SUM(CASE WHEN a.holiday = 0 THEN b.registered_cnt / 711 ELSE b.registered_cnt / 20 END) AS registered_rentals
FROM bike_rental.date_info AS a
JOIN bike_rental.rental_info AS b
ON a.record_id = b.record_id
GROUP BY a.holiday
ORDER BY a.holiday;

SELECT COUNT(holiday)/48 FROM bike_rental.date_info
WHERE holiday = 1;

-- Average count of rentals 
SELECT SUM(total_cnt)/(731) AS Average_daily_users FROM bike_rental.rental_info;

-- Total rentals per day, segmented by user type
SELECT a.date AS Date, SUM(b.registered_cnt) AS Registered_rentals, SUM(b.casual_cnt) AS Casual_rentals, SUM(b.total_cnt) AS Total_rentals FROM bike_rental.date_info AS a
JOIN bike_rental.rental_info AS b
ON a.record_id = b.record_id
GROUP BY date;

-- Total rentals per month, segmented by user type
SELECT SUBSTRING_INDEX(a.date,'-',2) AS Date_month, SUM(b.registered_cnt) AS Registered_rentals, SUM(b.casual_cnt) AS Casual_rentals, SUM(b.total_cnt) AS Total_rentals FROM bike_rental.date_info AS a
JOIN bike_rental.rental_info AS b
ON a.record_id = b.record_id
GROUP BY Date_month;
