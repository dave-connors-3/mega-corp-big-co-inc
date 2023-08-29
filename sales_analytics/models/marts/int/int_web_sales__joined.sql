with 

web_sales as (

    select * from {{ ref('stg_tpcds_core__web_sales') }}

),

promotion as (
    
    select * from {{ ref('stg_tpcds_core__promotion') }}

),

web_page as (
    
    select * from {{ ref('stg_tpcds_core__web_page') }}
    
),

item as (
    
    select * from {{ ref('stg_tpcds_core__item') }}
    
),

warehouse as (
    
    select * from {{ ref('stg_tpcds_core__warehouse') }}
    
),

final as (

    select
        web_sales.*,
        item.brand,
        item.class,
        item.category,
        item.color,
        item.product_name,
        promotion.item_sk as promotion_item_sk,
        promotion.promo_name,
        promotion.purpose,
        web_page.url,
        web_page.type as web_page_type,
        warehouse.warehouse_name

    from web_sales
    left join item
        on web_sales.item_sk = item.item_sk
    left join promotion 
        on web_sales.promo_sk = promotion.promotion_sk
    left join web_page
        on web_sales.web_page_sk = web_page.web_page_sk
    left join warehouse
        on web_sales.warehouse_sk = warehouse.warehouse_sk

)

select * from final 