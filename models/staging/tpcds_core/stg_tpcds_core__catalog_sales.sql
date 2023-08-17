with 

source as (

    select * from {{ source('tpcds_core', 'catalog_sales') }}
    limit 10000

),

renamed as (

    select
        {{
            dbt_utils.generate_surrogate_key(
                [
                    'cs_item_sk',
                    'cs_order_number'
                ]
            )
        }} as sale_id,
        'catalog_sale' as transaction_type,
        cs_sold_date_sk as sold_date_sk,
        cs_sold_time_sk as sold_time_sk,
        cs_ship_date_sk as ship_date_sk,
        cs_bill_customer_sk as bill_customer_sk,
        cs_bill_cdemo_sk as bill_cdemo_sk,
        cs_bill_hdemo_sk as bill_hdemo_sk,
        cs_bill_addr_sk as bill_addr_sk,
        cs_ship_customer_sk as ship_customer_sk,
        cs_ship_cdemo_sk as ship_cdemo_sk,
        cs_ship_hdemo_sk as ship_hdemo_sk,
        cs_ship_addr_sk as ship_addr_sk,
        cs_call_center_sk as call_center_sk,
        cs_catalog_page_sk as catalog_page_sk,
        cs_ship_mode_sk as ship_mode_sk,
        cs_warehouse_sk as warehouse_sk,
        cs_item_sk as item_sk,
        cs_promo_sk as promo_sk,
        cs_order_number as order_number,
        cs_quantity as quantity,
        cs_wholesale_cost as wholesale_cost,
        cs_list_price as list_price,
        cs_sales_price as sales_price,
        cs_ext_discount_amt as ext_discount_amt,
        cs_ext_sales_price as ext_sales_price,
        cs_ext_wholesale_cost as ext_wholesale_cost,
        cs_ext_list_price as ext_list_price,
        cs_ext_tax as ext_tax,
        cs_coupon_amt as coupon_amt,
        cs_ext_ship_cost as ext_ship_cost,
        cs_net_paid as net_paid,
        cs_net_paid_inc_tax as net_paid_inc_tax,
        cs_net_paid_inc_ship as net_paid_inc_ship,
        cs_net_paid_inc_ship_tax as net_paid_inc_ship_tax,
        cs_net_profit as net_profit

    from source

)

select * from renamed
