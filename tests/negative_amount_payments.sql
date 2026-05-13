select * from {{ source('raw_tables', 'payments') }}
where amount < 0