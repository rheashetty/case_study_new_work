{{
    config(
        materialized = "view"
    )
}}
with s stg_opp (
    select *
    from {{ ref('stg_salesforce__opportunity') }}
)
select
    dim_opportunity.opportunity_key,
    dim_account.account_key,
    dim_campaign.campaign_key,
    dim_contact.contact_key,
    stagename,
    stagesortorder,
    stagesortorder,
    nextstep,
    isclosed,
    iswon,
    fiscalyear,
    fiscalquarter,
    createddate,
    dim_user1.user_key as createdby,
    lastmodifieddate,
    dim_user1.user_key as lastmodifiedby,
    amount,
    expectedrevenue,
    closedate


from stg_opp
left join dim_opportunity on stg_opp.opportunity_id=dim_opportunity.salesforce_opportunity_id
left join dim_account on stg_opp.accountid=dim_opportunity.salesforce_account_id
left join dim_campaign on stg_opp.campaignid=dim_campaign.salesforce_campaign_id
left join dim_contact on stg_opp.contactid=dim_contact.salesforce_contact_id
left join dim_user1 on stg_opp.createdbyid=dim_user1.salesforce_user_id
left join dim_user2 on stg_opp.createdbyid=dim_user2.salesforce_user_id
where dim_opportunity.islatest=1;