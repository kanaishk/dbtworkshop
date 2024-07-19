with orders as ( 
    select 
        id as order_id, 
        user_id as customer_id, 
        order_date, 
        status,
        etlloaded_at as etl_load_dt
    from {{ source('jaffle_shop', 'orders') }}
)
select * 
from orders