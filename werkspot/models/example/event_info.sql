WITH
event_copy AS (
SELECT * FROM {{ ref('event_copy') }}
)
select 
    event_id
,   event_type
,   created_at
from event_copy