{{
    config(
        materialized='table',
        schema='datamart'
    )
}}
select 
    {{ dbt_utils.generate_surrogate_key(['customer_id', 'email', 'phone', 'city', 'country','updated_at']) }} as
    customer_sk,
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    city,
    country,
    created_at,
    updated_at,
    dbt_valid_from,
    dbt_valid_to,
    case 
     when dbt_valid_to is null then 1
     else 0
     end as current_record_flag
from {{ ref('snap_customer') }}