with calendar as (
    select * from {{ ref('stg_calendar') }}
),

cleaned as (
    select *,
        coalesce(adjusted_price, price) as actual_price
    from calendar
    where coalesce(adjusted_price, price) is not null
)

select
    listing_id,
    calendar_date,
    is_available,
    minimum_nights,
    maximum_nights,
    actual_price
from cleaned