{{ config(materialized='table', schema='datamart') }}
select 
cast(order_date as date) as date_key,
extract(year from order_date) as year,
extract(month from order_date) as month,
extract(day from order_date) as day


from {{ ref('stg_orders') }}