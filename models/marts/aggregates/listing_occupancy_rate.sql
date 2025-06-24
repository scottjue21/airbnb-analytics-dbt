select
    listing_id,
    count_if(is_available = false) * 1.0 / count(*) as occupancy_rate
from {{ ref('fct_calendar') }}
group by listing_id