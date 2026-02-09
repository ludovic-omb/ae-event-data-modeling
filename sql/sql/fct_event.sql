WITH events AS (
    SELECT
        event_timestamp,
        event_date,
        event_name,
        user_id,
        session_id,
        event_value
    FROM stg_events
),

events_with_keys AS (
    SELECT
        e.event_timestamp,
        e.event_date,
        e.event_name,
        e.user_id,
        e.session_id,
        e.event_value,
        CONCAT(e.user_id, '-',e.session_id, '-', CAST(e.event_timestamp AS STRING)) AS event_id
    FROM events AS e
)
SELECT
    event_id,
    event_timestamp,
    event_date,
    user_id,
    session_id,
    event_name,
    event_value
FROM events_with_keys;
