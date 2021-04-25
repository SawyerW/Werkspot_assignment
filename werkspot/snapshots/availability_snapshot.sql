{% snapshot availability_snapshot %}

    {{
        config(
          target_database='postgres',
          target_schema='dbt_yue',
          strategy='check',
          unique_key='date',
          updated_at='updated_at',
          check_cols=['date']
        )
    }}


WITH
event_copy AS (
SELECT * FROM {{ ref('event_copy') }}
),
t1 as (
select 
    date(created_at) as date
,   professional_id_anonymized
from event_copy
where event_type in ('became_able_to_propose')
group by date, professional_id_anonymized
),
t2 as (
select 
    date
,   count(professional_id_anonymized) as active_professionals_count
from t1
where date <= '2020-03-10'
group by date
)
select * from t2
{% endsnapshot %}