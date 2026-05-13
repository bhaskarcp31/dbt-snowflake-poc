{{
    config(
        materialized='table'
        
    )
}}

with order_base as (
    select * from {{ ref('stg_orders') }}
)
,
order_items_agg as (
    select 
    order_id,
    count(*) as total_items,
    sum(quantity * price) aS ORDER_AMOUNT
    FROM {{ ref('stg_order_items') }}
    group by order_id
),
payments_agg as (
    select 
    order_id,
    sum(amount) as total_paid
    from {{ ref('stg_payments') }}
    group by order_id

),
shipment_data as (
    select 
    order_id,
    shipment_id,
    shipment_status,
    shipment_date
    from {{ ref('stg_shipments') }}
)

select 
o.order_id,
o.customer_id,
o.order_date,
o.order_status,
oi.order_amount,
oi.total_items,
p.total_paid,
s.shipment_status,
s.shipment_date

from order_base o
left join order_items_agg oi on o.order_id = oi.order_id
left join payments_agg p on o.order_id = p.order_id
left join shipment_data s on o.order_id = s.order_id
