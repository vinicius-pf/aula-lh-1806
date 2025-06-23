with

    base_data as (
        select 
            id as order_id
            , customer as customer_id
            , store_id
            , cast(ordered_at as timestamp) as order_ts
            , subtotal
            , tax_paid
            , order_total
        from {{ ref('stg_jaffle_shop__orders') }}
    )

select * from base_data
