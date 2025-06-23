{{
    config(
        materialized = 'incremental'
        , unique_key = 'order_id'
    )
}}

with

    base_data as (
        select 
            order_id
            , customer_id
            , store_id
            , order_ts
            , subtotal
            , tax_paid
            , order_total
        from {{ ref('int_orders') }}
        {% if is_incremental() %}
            where order_ts > ( select max(order_ts) from {{ this }} )
        {% endif %}
    )

select * from base_data
