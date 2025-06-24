{{ config(materialized='table') }}

with calendar as (
    select * from {{ ref('fct_calendar') }}
    where is_available = false
),

aggregated as (
    select
        listing_id,
        date_trunc('month', calendar_date) as revenue_month,
        sum(actual_price) as monthly_revenue
    from calendar
    group by listing_id, revenue_month
)

select * from aggregated