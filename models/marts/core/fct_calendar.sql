with calendar as (
    select * from {{ ref('stg_calendar') }}
),

valid_calendar as (
    select *
    from calendar
    where price is not null
)

select * from valid_calendar