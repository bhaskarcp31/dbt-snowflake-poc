select 
 review_id,
 customer_id,
 product_id,
 rating,
 review_text,
 review_date
from {{ source('raw_tables', 'reviews') }}