with 

source as (

    select * from {{ source('tpcds_core', 'web_returns') }}
    limit 1000

),

renamed as (

    select
        {{
            dbt_utils.generate_surrogate_key(
                [
                    'wr_item_sk',
                    'wr_order_number'
                ]
            )
        }} as return_id,
        'web_return' as transaction_type,
        wr_returned_date_sk as return_date_sk,
        wr_returned_time_sk as return_time_sk,
        wr_item_sk as item_sk,
        wr_refunded_customer_sk as refunded_customer_sk,
        wr_refunded_cdemo_sk as refunded_cdemo_sk,
        wr_refunded_hdemo_sk as refunded_hdemo_sk,
        wr_refunded_addr_sk as refunded_addr_sk,
        wr_returning_customer_sk as returning_customer_sk,
        wr_returning_cdemo_sk as returning_cdemo_sk,
        wr_returning_hdemo_sk as returning_hdemo_sk,
        wr_returning_addr_sk as returning_addr_sk,
        wr_web_page_sk as web_page_sk,
        wr_reason_sk as reason_sk,
        wr_order_number as order_number,
        wr_return_quantity as return_quantity,
        wr_return_amt as return_amt,
        wr_return_tax as return_tax,
        wr_return_amt_inc_tax as return_amt_inc_tax,
        wr_fee as fee,
        wr_return_ship_cost as return_ship_cost,
        wr_refunded_cash as refunded_cash,
        wr_reversed_charge as reversed_charge,
        wr_account_credit as account_credit,
        wr_net_loss as net_loss

    from source

)

select * from renamed
