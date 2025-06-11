{{
    config(
        materialized = "view"
    )
}}
with stg_case as (
    select *
    from {{ ref('stg_salesforce__case') }}
)
select
    dim_case.case_key,
    dim_contact.contact_key,
    dim_account.account_key,
    dim_product.product_key,
    isclosed,
    closeddate,
    isescalated,
    isclosedoncreate,
    slastartdate,
    slaexitdate,
    isstopped,
    stopstartdate,
    createddate,
    dim_user1.user_key as created_by,
    lastmodifieddate,
    dim_user2.user_key as last_modified_by,
    dim_solution.solution_key

from stg_case
left join dim_case on  stg_case.case_id=dim_case.salesforce_case_id
left join dim_contact on stg_case.contactid=dim_contact.salesforce_contact_id
left join dim_account on stg_case.accountid=dim_account.salesforce_account_id
left join dim_product on stg_case.productid=dim_product.salesforce_product_id
left join dim_user1 on stg_case.createdbyid=dim_user.salesforce_user_id
left join dim_user2 on stg_case.lastmodifiedbyid=dim_user.salesforce_user_id
left join dim_solution on stg_case.case_id=dim_solution.caseid
where dim_case.islatest=1;