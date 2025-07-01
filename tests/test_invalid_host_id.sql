{{ config(severity='warn') }}

SELECT *
FROM {{ source('raw', 'listings') }}
WHERE try_cast(host_id as int) IS NULL
  AND host_id IS NOT NULL