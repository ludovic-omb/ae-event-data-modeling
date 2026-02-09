WITH user_events AS (
    SELECT
        user_id,
        event_date,
        country,
        device
    FROM stg_events
    WHERE user_id IS NOT NULL -- je filtre les users non nuls
),

first_event AS (
    SELECT
        user_id,
        MIN(event_date) AS first_event_date
    FROM user_events
    GROUP BY user_id
),

primary_device AS (
    SELECT
        user_id,
        device AS primary_device
    FROM (
        SELECT
            user_id,
            device,
            COUNT(*) AS event_count,
            ROW_NUMBER() OVER (
                PARTITION BY user_id
                ORDER BY COUNT(*) DESC
            ) AS rn
        FROM user_events
        GROUP BY user_id, device
    )
    WHERE rn = 1
),

primary_country AS (
    SELECT
        user_id,
        country AS primary_country
    FROM (
        SELECT
            user_id,
            country,
            COUNT(*) AS event_count,
            ROW_NUMBER() OVER (
                PARTITION BY user_id
                ORDER BY COUNT(*) DESC
            ) AS rn
        FROM user_events
        GROUP BY user_id, country
    )
    WHERE rn = 1
)

SELECT
    u.user_id,
    f.first_event_date,
    d.primary_device,
    c.primary_country
FROM (SELECT DISTINCT user_id FROM user_events) u
LEFT JOIN first_event f USING (user_id)
LEFT JOIN primary_device d USING (user_id)
LEFT JOIN primary_country c USING (user_id);
