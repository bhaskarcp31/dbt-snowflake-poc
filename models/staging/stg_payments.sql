select
 payment_id,
 order_id,
 lower(payment_method) as payment_method,
 amount,
 lower(payment_status) as payment_status,
 payment_date
from {{ source('raw_tables', 'payments') }}