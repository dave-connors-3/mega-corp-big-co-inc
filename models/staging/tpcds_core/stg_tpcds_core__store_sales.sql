with 

source as (

    select * from {{ source('tpcds_core', 'store_sales') }}
    limit 10000

),

renamed as (

    select
        {{
            dbt_utils.generate_surrogate_key(
                [
                    'ss_item_sk',
                    'ss_ticket_number'
                ]
            )
        }} as sale_id, 
        'store_sale' as transaction_type,
        ss_sold_date_sk as sold_date_sk,
        ss_sold_time_sk as sold_time_sk,
        ss_item_sk as item_sk,
        ss_customer_sk as customer_sk,
        ss_cdemo_sk as cdemo_sk,
        ss_hdemo_sk as hdemo_sk,
        ss_addr_sk as addr_sk,
        ss_store_sk as store_sk,
        ss_promo_sk as promo_sk,
        ss_ticket_number as ticket_number,
        ss_quantity as quantity,
        ss_wholesale_cost as wholesale_cost,
        ss_list_price as list_price,
        ss_sales_price as sales_price,
        ss_ext_discount_amt as ext_discount_amt,
        ss_ext_sales_price as ext_sales_price,
        ss_ext_wholesale_cost as ext_wholesale_cost,
        ss_ext_list_price as ext_list_price,
        ss_ext_tax as ext_tax,
        ss_coupon_amt as coupon_amt,
        ss_net_paid as net_paid,
        ss_net_paid_inc_tax as net_paid_inc_tax,
        ss_net_profit as net_profit

    from source

)

select * from renamed
