WITH conversion_events AS (
    SELECT
        event_id,
        event_timestamp,
        event_date,
        user_id,
        session_id,
        event_name,
        event_value
    FROM fct_events
    WHERE event_name IN (
        'purchase',
        'signup'
    )
),
conversions_with_key AS (
    SELECT
        *,
        -- Surrogate conversion key
        CONCAT(
            event_name, '-',
            user_id, '-',
            CAST(event_timestamp AS STRING)
        ) AS conversion_id
    FROM conversion_events
)
SELECT
    conversion_id,
    event_id,
    event_timestamp,
    event_date,
    user_id,
    session_id,
    event_name AS conversion_type,
    event_value AS conversion_value
FROM conversions_with_key;
