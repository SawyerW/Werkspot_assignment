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

t0 as (
select *
,   date(created_at) as date
from event_copy
),

t1 as (
select *
,   case when max(created_at) over (partition by professional_id_anonymized, date) = created_at 
    and event_type = 'became_unable_to_propose' then 1 else 0 end as last_event_check
from t0
),

t2 as (
select *
,   max(last_event_check) over (partition by professional_id_anonymized, date) as count_check
from t1
),

t3 as (
select 
    date
,   count(professional_id_anonymized) as active_professionals_count
from t2
where event_type in ('became_able_to_propose') and count_check = 0 and date <= '2020-03-10'
group by date
)

select * from t3
{% endsnapshot %}