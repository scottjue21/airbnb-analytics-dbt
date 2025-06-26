WITH calendar AS (

    SELECT
        calendar_date,
        listing_id,
        CASE WHEN is_available = 'false' THEN 1 ELSE 0 END AS is_booked
    FROM {{ ref('fct_calendar') }}

),

monthly_agg AS (

    SELECT
        DATE_TRUNC('month', calendar_date) AS occupancy_month,
        listing_id,
        SUM(is_booked) AS nights_booked,
        COUNT(*) AS total_calendar_days,
        ROUND(SUM(is_booked)/COUNT(*), 2) AS occupancy_rate
    FROM calendar
    GROUP BY 1, 2

)

SELECT
    occupancy_month,
    listing_id,
    nights_booked,
    total_calendar_days,
    occupancy_rate
FROM monthly_agg