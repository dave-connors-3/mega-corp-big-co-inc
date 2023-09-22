with source as (

    select * from {{ source('tpcds_core', 'reason') }}

),

renamed as (

    select
        r_reason_sk as reason_sk,
        r_reason_id as reason_id,
        r_reason_desc as reason

    from source

)

select * from renamed