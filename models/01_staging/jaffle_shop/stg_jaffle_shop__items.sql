with 

    raw_data as (
        select *
        from {{ source( 'jaffle_shop', 'raw_items' ) }}
    )

select * from raw_data
