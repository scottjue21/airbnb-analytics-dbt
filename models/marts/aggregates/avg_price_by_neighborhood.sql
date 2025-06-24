with joined as (
    select
        l.neighborhood,
        c.actual_price
    from {{ ref('dim_listings') }} l
    join {{ ref('fct_calendar') }} c on l.listing_id = c.listing_id
)

select
    neighborhood,
    avg(actual_price) as avg_price
from joined
group by neighborhood