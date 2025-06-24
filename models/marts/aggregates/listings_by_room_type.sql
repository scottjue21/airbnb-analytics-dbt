select
    room_type,
    neighborhood,
    count(*) as listing_count
from {{ ref('dim_listings') }}
group by room_type, neighborhood