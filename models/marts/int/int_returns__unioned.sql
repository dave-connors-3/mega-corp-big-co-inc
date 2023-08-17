with 

unioned as (
    {{
        dbt_utils.union_relations(
            [
                ref('stg_tpcds_core__catalog_returns'),
                ref('stg_tpcds_core__store_returns'),
                ref('int_web_returns__joined')
            ]
        )
    }}
),


final as (

    select 
        return_id,
        transaction_type,
        item_sk,
        coalesce(
            customer_sk, -- store
            returning_customer_sk -- catalog + web
        ) as customer_sk,
        call_center_sk,
        store_sk,
        return_amt,
        reason,
        brand,
        class,
        category,
        color,
        product_name,
        url,
        web_page_type

    from unioned

)

select * from final