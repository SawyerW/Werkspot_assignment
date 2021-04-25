WITH
event_copy AS (
SELECT * FROM {{ ref('event_copy') }}
)

select 
    professional_id_anonymized
,   event_id
from event_copy
group by professional_id_anonymized, event_id