with 

source as (

    select * from {{ source('tpcds_core', 'web_sales') }}
    limit 100000

),

renamed as (

    select
        {{
            dbt_utils.generate_surrogate_key(
                [
                    'ws_item_sk',
                    'ws_order_number'
                ]
            )
        }} as sale_id,
        'web_sale' as transaction_type,
        ws_sold_date_sk as sold_date_sk,
        ws_sold_time_sk as sold_time_sk,
        ws_ship_date_sk as ship_date_sk,
        ws_item_sk as item_sk,
        ws_bill_customer_sk as bill_customer_sk,
        ws_bill_cdemo_sk as bill_cdemo_sk,
        ws_bill_hdemo_sk as bill_hdemo_sk,
        ws_bill_addr_sk as bill_addr_sk,
        ws_ship_customer_sk as ship_customer_sk,
        ws_ship_cdemo_sk as ship_cdemo_sk,
        ws_ship_hdemo_sk as ship_hdemo_sk,
        ws_ship_addr_sk as ship_addr_sk,
        ws_web_page_sk as web_page_sk,
        ws_web_site_sk as web_site_sk,
        ws_ship_mode_sk as ship_mode_sk,
        ws_warehouse_sk as warehouse_sk,
        ws_promo_sk as promo_sk,
        ws_order_number as order_number,
        ws_quantity as quantity,
        ws_wholesale_cost as wholesale_cost,
        ws_list_price as list_price,
        ws_sales_price as sales_price,
        ws_ext_discount_amt as ext_discount_amt,
        ws_ext_sales_price as ext_sales_price,
        ws_ext_wholesale_cost as ext_wholesale_cost,
        ws_ext_list_price as ext_list_price,
        ws_ext_tax as ext_tax,
        ws_coupon_amt as coupon_amt,
        ws_ext_ship_cost as ext_ship_cost,
        ws_net_paid as net_paid,
        ws_net_paid_inc_tax as net_paid_inc_tax,
        ws_net_paid_inc_ship as net_paid_inc_ship,
        ws_net_paid_inc_ship_tax as net_paid_inc_ship_tax,
        ws_net_profit as net_profit

    from source

)

select * from renamed
