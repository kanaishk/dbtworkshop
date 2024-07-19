{% snapshot stg_hist_orders %%}

{{
    config(
      target_database='dbtworkshop',
      target_schema='dbt_kgarg',
      unique_key='order_id',
      strategy='timestamp',
      updated_at='etl_load_dt',
      invalidate_hard_deletes=True
    )
}}

select * from {{ ref('stg_orders') }}

{% endsnapshot %}