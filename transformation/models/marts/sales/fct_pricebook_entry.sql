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
    stg_pricebook.pricebook_entry_id,
    stg_pricebook.pricebook2id,
    dim_product.product_key,
    stg_pricebook.unitprice,
    stg_pricebook.isactive,
    stg_pricebook.usestandardprice,
    stg_pricebook.createddate,
    user1.user_key as createdby,
    stg_pricebook.lastmodifieddate,
    user2.user_key as lastmodifiedby,
    stg_pricebook.systemmodstamp,
    stg_pricebook.isdeleted,
    stg_pricebook.isarchived   
from stg_pricebook
left join dim_product on stg_pricebook.product2id=dim_product.salesforce_product_id
left join dim_user user1 on stg_pricebook.createdbyid=user1.salesforce_user_id
left join dim_user user2 on stg_pricebook.lastmodifiedbyid=user2.salesforce_user_id