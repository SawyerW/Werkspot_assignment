

{{ config(materialized='table') }}

WITH
event AS (
SELECT * FROM {{ source('sample_data', 'event') }}
)
select
  *
from event
