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
    )

select * from base_data
