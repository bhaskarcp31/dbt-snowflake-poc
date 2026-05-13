select 
    customer_id,
    INITCAP(first_name) AS first_name,
    INITCAP(last_name) AS last_name,
    lower(email) AS email,
    phone,
    city,
    country,
    created_at,
    is_active,
    updated_at
from {{ source('raw_tables', 'customers') }}