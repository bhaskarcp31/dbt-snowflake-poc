select 
 shipment_id,
 order_id,
 shipment_date,
 delivery_date,
 lower(carrier) as carrier,
 lower(status) as shipment_status
from {{ source('raw_tables', 'shipments') }}