with payments as (
    select 
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        {{ convert_cents_to_dollar('amount') }} as amount,
        created as created_at,
        batchedat as batched_at
    from {{ source('stripe', 'payment') }}
)
select * 
from payments