select 
 address_id,
 customer_id,
 address_line,
 city,
 state,
 pincode,
 is_primary
from {{ source('raw_tables', 'customer_addresses') }}