{{
    config(
        materialized = 'incremental',
        unique_key = 'nation_key'
    )
}}
with nations as (
    select 
        n_nationkey as nation_key,
        n_name as nation_name,
        case 
            when n_regionkey = '1' then 'One' 
            when n_regionkey = '2' then 'Two' 
            when n_regionkey = '3' then 'Three' 
            when n_regionkey = '4' then 'Four' 
            else 'Zero' end as region_name,
        last_updated_date as updated_at
    from {{ ref('dim_nation_key') }}
)
select * 
from nations

{% if is_incremental() %}
    where updated_at > (select max(updated_at) from {{ this }})
{% endif %}