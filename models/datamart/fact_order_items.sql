{{
    config(
        materialized='incremental',
        schema='datamart',
        unique_key='order_item_id'

    )
}}

with fact_base as (
    select 
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    o.customer_id,
    o.order_date,
    oi.quantity,
    oi.price,
    (oi.quantity * oi.price) as gross_sales

    from {{ ref('stg_order_items') }} oi
    left join {{ ref('stg_orders') }} o on oi.order_id = o.order_id
),
customer_dimension as (
    select 
     *
    from {{ ref('dim_customers') }}
)

select 
fb.order_item_id,
cd.customer_sk,
fb.order_id,
fb.product_id,
fb.customer_id,
cast(fb.order_date as date) as order_date,
fb.quantity,
fb.price,
fb.gross_sales
from fact_base fb
left join customer_dimension cd on fb.customer_id = cd.customer_id
and cd.current_record_flag = 1

{% if is_incremental() %}

where fb.order_date > (select max(order_date) from {{ this }})

{% endif %}