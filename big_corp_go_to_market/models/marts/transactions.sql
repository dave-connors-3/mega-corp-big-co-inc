with 

customers as (

    select * from {{ ref('mega_corp_big_co_inc', 'customers') }}

),

stores as (

    select * from {{ ref('mega_corp_big_co_inc', 'stores') }}

),

unioned as (
    {{
        dbt_utils.union_relations(
            [
                ref('int_returns__unioned'),
                ref('int_sales__unioned'),
            ]
        )
    }}

),

final as (

    select
        coalesce(sale_id, return_id) as transaction_id,
        unioned.customer_sk,
        unioned.transaction_type,
        unioned.item_sk,
        unioned.call_center_sk,
        unioned.store_sk,
        unioned.brand,
        unioned.class,
        unioned.category,
        unioned.color,
        unioned.product_name,
        unioned.reason,
        unioned.url,
        unioned.web_page_type,
        coalesce(sales_price, -1 * return_amt) as transaction_amount,
        customers.first_name,
        customers.last_name,
        customers.is_preferred_customer,
        customers.gender,
        stores.store_name,
        stores.city,
        stores.state

    from unioned
    left join customers
        on unioned.customer_sk = customers.customer_sk
    left join stores
        on unioned.store_sk = stores.store_sk

)

select * from final