{{
    config(
        materialized = "view"
    )
}}

with stg_product as (
    select *
    from {{ ref('stg_salesforce__product_2') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_key,
    product_id as salesforce_product_id,
    name,
    productcode,
    description,
    isactive,
    createddate,
    createdbyid,
    lastmodifieddate,
    lastmodifiedbyid,
    systemmodstamp,
    family,
    externaldatasourceid,
    externalid,
    displayurl,
    quantityunitofmeasure,
    isdeleted,
    isarchived,
    stockkeepingunit,
    type,
    productclass,
    sourceproductid,
    sellerid
from stg_product