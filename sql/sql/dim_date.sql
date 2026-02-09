WITH date_range AS (
    SELECT
        MIN(event_date) AS min_date,
        MAX(event_date) AS max_date
    FROM stg_events
),

calendar AS (
    SELECT
        date_day AS date
    FROM date_range,
    UNNEST(
        GENERATE_DATE_ARRAY(min_date, max_date)
    ) AS date_day
)

SELECT
    date,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    FORMAT_DATE('%Y-%m', date) AS year_month,
    EXTRACT(DAY FROM date) AS day,
    EXTRACT(DAYOFWEEK FROM date) AS day_of_week,
    FORMAT_DATE('%A', date) AS day_name,
    EXTRACT(WEEK FROM date) AS week_of_year,
    CASE
        WHEN EXTRACT(DAYOFWEEK FROM date) IN (1, 7)
        THEN TRUE
        ELSE FALSE
    END AS is_weekend
FROM calendar
ORDER BY date;
