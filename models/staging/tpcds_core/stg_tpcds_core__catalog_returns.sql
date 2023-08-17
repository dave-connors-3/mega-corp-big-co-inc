with 

source as (

    select * from {{ source('tpcds_core', 'catalog_returns') }}
    limit 1000

),

renamed as (

    select
        {{
            dbt_utils.generate_surrogate_key(
                [
                    'cr_item_sk',
                    'cr_order_number'
                ]
            )
        }} as return_id,
        'catalog_return' as transaction_type,
        cr_returned_date_sk as return_date_sk,
        cr_returned_time_sk as return_time_sk,
        cr_item_sk as item_sk,
        cr_refunded_customer_sk as refunded_customer_sk,
        cr_refunded_cdemo_sk as refunded_cdemo_sk,
        cr_refunded_hdemo_sk as refunded_hdemo_sk,
        cr_refunded_addr_sk as refunded_addr_sk,
        cr_returning_customer_sk as returning_customer_sk,
        cr_returning_cdemo_sk as returning_cdemo_sk,
        cr_returning_hdemo_sk as returning_hdemo_sk,
        cr_returning_addr_sk as returning_addr_sk,
        cr_call_center_sk as call_center_sk,
        cr_catalog_page_sk as catalog_page_sk,
        cr_ship_mode_sk as ship_mode_sk,
        cr_warehouse_sk as warehouse_sk,
        cr_reason_sk as reason_sk,
        cr_order_number as order_number,
        cr_return_quantity as return_quantity,
        cr_return_amount as return_amount,
        cr_return_tax as return_tax,
        cr_return_amt_inc_tax as return_amt_inc_tax,
        cr_fee as fee,
        cr_return_ship_cost as return_ship_cost,
        cr_refunded_cash as refunded_cash,
        cr_reversed_charge as reversed_charge,
        cr_store_credit as store_credit,
        cr_net_loss as net_loss

    from source

)

select * from renamed
