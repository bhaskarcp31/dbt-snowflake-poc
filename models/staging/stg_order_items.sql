select 
 order_item_id,
 order_id,
 product_id,
 quantity,
 price,
 coalesce(discount, 0) AS discount
from {{ source('raw_tables', 'order_items') }}