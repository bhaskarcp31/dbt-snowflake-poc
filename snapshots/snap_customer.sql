{% snapshot snap_customer %}

{{ config(
    target_schema='snapshots',
    unique_key='customer_id',
    strategy='check', 
    check_cols= ['email', 'phone', 'city', 'country', 'is_active']
    )
    }}

select 
* 
from {{ ref('stg_customers') }}

{% endsnapshot %}