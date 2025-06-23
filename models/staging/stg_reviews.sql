with source as (

    select * from {{ source('raw', 'reviews') }}

),

renamed as (

    select
        try_cast(id as int) as review_id,
        try_cast(listing_id as int) as listing_id,
        try_cast(date as date) as review_date,
        try_cast(reviewer_id as int) as reviewer_id,
        reviewer_name,
        comments

    from source

)

select * from renamed