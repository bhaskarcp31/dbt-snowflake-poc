{{
    config(
        materialized='table',
        schema='datamart'
    )
}}
select 
    
    product_name,
    category,
    price
from {{ ref('stg_products') }}