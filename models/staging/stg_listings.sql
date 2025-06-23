with source as (

    select * from {{ source('raw', 'listings') }}

),

renamed as (

    select
        id::int as listing_id,
        name,
        try_cast(host_id as int) as host_id,
        host_name,
        neighbourhood_cleansed as neighborhood,
        try_cast(latitude as float) as latitude,
        try_cast(longitude as float) as longitude,
        -- Property Characteristics
        room_type,
        property_type,
        try_cast(accommodates as int) as accommodates,
        try_cast(bathrooms as float) as bathrooms,
        try_cast(bedrooms as int) as bedrooms,
        try_cast(beds as int) as beds,
        amenities,
        -- Pricing and Availability
        try_cast(replace(price, '$', '') as float) as price,
        try_cast(minimum_nights as int) as minimum_nights,
        try_cast(availability_365 as int) as availability_365,
        -- Reviews and Activity
        try_cast(number_of_reviews as int) as number_of_reviews,
        try_cast(last_review as date) as last_review,
        try_cast(reviews_per_month as float) as reviews_per_month,
        try_cast(review_scores_rating as float) as review_scores_rating,
        -- Host Characteristics
        host_is_superhost,
        host_identity_verified,
        try_cast(host_since as date) as host_since,
        try_cast(replace(host_response_rate, '%', '') as float) as host_response_rate,
        try_cast(host_listings_count as int) as host_listings_count

    from source

)

select * from renamed