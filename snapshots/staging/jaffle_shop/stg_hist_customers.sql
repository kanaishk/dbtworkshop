{% snapshot stg_hist_customers %%}

{{
    config(
      target_database='dbtworkshop',
      target_schema='dbt_kgarg',
      unique_key='customer_id',
      strategy='check',
      check_cols = ['first_name', 'last_name'],
      invalidate_hard_deletes=True
    )
}}

select * from {{ ref('stg_customers') }}

{% endsnapshot %}