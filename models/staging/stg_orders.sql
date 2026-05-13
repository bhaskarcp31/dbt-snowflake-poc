select 
 order_id,
 customer_id,
 order_date,
 lower(status) as order_status,
 shipping_address_id

 from {{ source('raw_tables', 'orders') }}