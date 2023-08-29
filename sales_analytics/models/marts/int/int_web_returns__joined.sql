with 

web_returns as (

    select * from {{ ref('stg_tpcds_core__web_returns') }}

),

reason as (
    
    select * from {{ ref('stg_tpcds_core__reason') }}

),

web_page as (
    
    select * from {{ ref('stg_tpcds_core__web_page') }}
    
),


item as (
    
    select * from {{ ref('stg_tpcds_core__item') }}
    
),

final as (

    select
        web_returns.*,
        item.brand,
        item.class,
        item.category,
        item.color,
        item.product_name,
        reason.reason,
        web_page.url,
        web_page.type as web_page_type

    from web_returns
    left join item
        on web_returns.item_sk = item.item_sk
    left join reason 
        on web_returns.reason_sk = reason.reason_sk
    left join web_page
        on web_returns.web_page_sk = web_page.web_page_sk

)

select * from final 



