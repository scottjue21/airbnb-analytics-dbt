with filtered as (
    select *
    from {{ ref('dim_reviews') }}
    where review_date is not null
)

select
    date_trunc('month', review_date) as review_month,
    count(*) as review_count
from filtered
group by review_month
order by review_month