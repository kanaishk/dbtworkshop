{% set payment_methods = ['gift_card', 'coupon', 'credit_card', 'bank_transfer'] %}
{% set statuses = ['success', 'fail'] %}

with payments as (
    select *
    from {{ ref('stg_hist_payments') }}
    where dbt_valid_to is NULL
),
aggregate as (
    select order_id,
        {% for payment_method_sel in payment_methods %}
            {% for status_sel in statuses %}
                sum(case when payment_method = '{{payment_method_sel}}' and status = '{{status_sel}}' then amount
                else 0.0 end) as {{payment_method_sel+"_"+status_sel+"_amount "}}
                {%- if not loop.last -%}
                    ,
                {% endif -%}
            {% endfor %}
            {%- if not loop.last -%}
                ,
            {% endif -%}
        {% endfor %}
    from payments
    group by order_id
)
select * 
from aggregate