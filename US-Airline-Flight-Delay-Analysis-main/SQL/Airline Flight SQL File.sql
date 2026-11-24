-- Creating DataBase.
create database airline_delay_analysis;

-- Using DataBase.
use airline_delay_analysis;

-- Checking The DataBase Table Data for verifing data is imported properly or not.
-- Check row counts
SELECT COUNT(*) FROM airlines;      -- should be ~14
SELECT COUNT(*) FROM airports;      -- should be ~322
SELECT COUNT(*) FROM flights;       -- should be ~5,819,079

-- Peek at the data
SELECT * FROM airlines LIMIT 5;
SELECT * FROM airports LIMIT 5;
SELECT * FROM flights LIMIT 5;

-- Check for obvious issues
SELECT COUNT(*) FROM flights WHERE ARRIVAL_DELAY IS NULL;
SELECT COUNT(*) FROM flights WHERE CANCELLED = 1;

-- Airline names with average delay
select 
	a.airline as Airline_Name, 
    COUNT(*) AS Total_flights, 
    round(avg(f.arrival_delay),2) as Avg_arrival_delay 
from flights f
inner join  airlines a on f.airline = a.iata_code
where f.cancelled = 0
group by a.airline
order by Avg_arrival_delay DESC; 

-- Rank airlines by delay, per month
SELECT 
    MONTH,
    a.AIRLINE,
    avg_delay,
    RANK() OVER (PARTITION BY MONTH ORDER BY avg_delay DESC) AS delay_rank
FROM (
    SELECT 
        f.MONTH,
        f.AIRLINE,
        ROUND(AVG(f.ARRIVAL_DELAY), 2) AS avg_delay
    FROM flights f
    WHERE f.CANCELLED = 0
    GROUP BY f.MONTH, f.AIRLINE
) monthly_avg
JOIN airlines a ON monthly_avg.AIRLINE = a.IATA_CODE
ORDER BY MONTH, delay_rank;



-- Delay by day of week & time patterns
SELECT 
    DAY_OF_WEEK,
    CASE DAY_OF_WEEK
        WHEN 1 THEN 'Monday' WHEN 2 THEN 'Tuesday' WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday' WHEN 5 THEN 'Friday' WHEN 6 THEN 'Saturday'
        WHEN 7 THEN 'Sunday'
    END AS day_name,
    COUNT(*) AS total_flights,
    ROUND(AVG(ARRIVAL_DELAY), 2) AS avg_delay,
    ROUND(SUM(CASE WHEN ARRIVAL_DELAY > 15 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_delayed
FROM flights
WHERE CANCELLED = 0
GROUP BY DAY_OF_WEEK
ORDER BY DAY_OF_WEEK;

-- why flights get delayed
SELECT 
    ROUND(AVG(AIR_SYSTEM_DELAY), 2) AS avg_air_system_delay,
    ROUND(AVG(SECURITY_DELAY), 2) AS avg_security_delay,
    ROUND(AVG(AIRLINE_DELAY), 2) AS avg_airline_delay,
    ROUND(AVG(LATE_AIRCRAFT_DELAY), 2) AS avg_late_aircraft_delay,
    ROUND(AVG(WEATHER_DELAY), 2) AS avg_weather_delay
FROM flights
WHERE CANCELLED = 0 AND ARRIVAL_DELAY > 0;

-- summarized query
SELECT 
    a.AIRLINE AS airline_name,
    f.MONTH,
    COUNT(*) AS total_flights,
    ROUND(AVG(f.ARRIVAL_DELAY), 2) AS avg_arrival_delay,
    SUM(CASE WHEN f.ARRIVAL_DELAY > 15 THEN 1 ELSE 0 END) AS delayed_flights,
    ROUND(SUM(CASE WHEN f.ARRIVAL_DELAY > 15 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_delayed
FROM flights f
JOIN airlines a ON f.AIRLINE = a.IATA_CODE
WHERE f.CANCELLED = 0
GROUP BY a.AIRLINE, f.MONTH
ORDER BY a.AIRLINE, f.MONTH;