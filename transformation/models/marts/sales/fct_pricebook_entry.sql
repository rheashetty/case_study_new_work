{{
    config(
        materialized = "view"
    )
}}
with stg_pricebook as (
    select *
    from {{ ref('stg_salesforce__pricebook_entry') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['pricebook_entry_id']) }} as pricebook_key,
    pricebook_entry_id,
    pricebook2id,
    dim_product.product_key,
    unitprice,
    isactive,
    usestandardprice,
    createddate,
    dim_user1.user_key as createdby,
    lastmodifieddate,
    dim_user2.user_key as lastmodifiedby,
    systemmodstamp,
    isdeleted,
    isarchived   
from stg_pricebook
left join dim_product on stg_pricebook.product2id=dim_product.salesforce_product_id
left join dim_user1 on stg_pricebook.createdbyid=dim_user.salesforce_user_id
left join dim_user2 on stg_pricebook.lastmodifiedby=dim_user.salesforce_user_id