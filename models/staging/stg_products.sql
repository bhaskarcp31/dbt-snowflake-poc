select
 product_id,
 INITCAP(product_name) AS product_name,
 category,
 price,
 cost,
 created_at
 from {{ source('raw_tables', 'products') }}