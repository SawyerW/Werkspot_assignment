WITH
event_copy AS (
SELECT * FROM {{ ref('event_copy') }}
)

select
    event_id
,   split_part(meta_data, '_', 1) as serice_id
,   split_part(meta_data, '_', 2) as service_name_nl
,   split_part(meta_data, '_', 3) as service_name_en
,   split_part(meta_data, '_', 4) as lead_fee
 from event_copy 
 where meta_data is not null