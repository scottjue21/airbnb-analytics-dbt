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
        room_type,
        try_cast(replace(price, '$', '') as float) as price,
        availability_365::int,
        number_of_reviews::int,
        try_cast(reviews_per_month as float) as reviews_per_month

    from source

)

select * from renamed