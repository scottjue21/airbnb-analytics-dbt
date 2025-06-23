with source as (

    select * from {{ source('raw', 'calendar') }}

),

renamed as (

    select
        try_cast(listing_id as int) as listing_id,
        try_cast(date as date) as calendar_date,
        case
            when lower(available) = 't' then true
            when lower(available) = 'f' then false
            else null
        end as is_available,
        try_cast(replace(price, '$', '') as float) as price,
        try_cast(replace(adjusted_price, '$', '') as float) as adjusted_price,
        try_cast(minimum_nights as int) as minimum_nights,
        try_cast(maximum_nights as int) as maximum_nights

    from source

)

select * from renamed