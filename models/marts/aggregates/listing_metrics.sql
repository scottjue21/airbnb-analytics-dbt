with base as (
    select
        cal.listing_id,
        avg(cal.actual_price) as avg_price,
        count_if(cal.is_available = false) * 1.0 / count(*) as occupancy_rate,
        avg(lst.review_scores_rating) as avg_rating
    from {{ ref('fct_calendar') }} cal
    join {{ ref('dim_listings') }} lst on cal.listing_id = lst.listing_id
    group by cal.listing_id
)

select * from base