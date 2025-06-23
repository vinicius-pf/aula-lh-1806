with 

    raw_data as (
        select *
        from {{ source( 'jaffle_shop', 'raw_orders' ) }}
    )

select * from raw_data
