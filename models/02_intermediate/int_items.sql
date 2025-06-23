with

    base_data as (
        select 
            order_id
            , sku
        from {{ ref('stg_jaffle_shop__items') }}
    )

    , generate_sk as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'order_id'
                , 'sku'
            ]) }} as sk_int_items
            , order_id
            , sku
        from base_data
    )

select * from generate_sk
