{% snapshot stg_hist_payments %%}

{{
    config(
      target_database='dbtworkshop',
      target_schema='dbt_kgarg',
      unique_key='payment_id',
      strategy='timestamp',
      updated_at='batched_at',
      invalidate_hard_deletes=True
    )
}}

select * from {{ ref('stg_payments') }}

{% endsnapshot %}