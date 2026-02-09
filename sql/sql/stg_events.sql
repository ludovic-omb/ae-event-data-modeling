WITH source AS (
    SELECT
        event_timestamp,
        DATE(event_timestamp) AS event_date,
        LOWER(event_name) AS event_name,
        user_id,
        session_id,
        page_url,
        device,
        source,
        country,
        COALESCE(event_value, 0) AS event_value
    FROM raw_events
)

SELECT *
FROM source;
