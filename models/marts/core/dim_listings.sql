with src as (
    select * from {{ ref('stg_listings') }}
)

select
    listing_id,
    listing_name,
    host_id,
    host_name,
    host_is_superhost,
    host_identity_verified,
    host_since,
    host_response_rate,
    host_listings_count,
    neighborhood,
    latitude,
    longitude,
    room_type,
    property_type,
    accommodates,
    bathrooms,
    bedrooms,
    beds,
    amenities,
    minimum_nights,
    availability_365,
    review_scores_rating
from src