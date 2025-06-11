{{
    config(
        materialized = "view"
    )
}}
with stg_opp as (
    select *
    from {{ ref('stg_salesforce__opportunity') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['opportunity_id']) }} as fct_opp_key,
    dim_opportunity.opportunity_key,
    dim_account.account_key,
    dim_campaign.campaign_key,
    dim_contact.contact_key,
    stg_opp.stagename,
    stg_opp.stagesortorder,
    stg_opp.nextstep,
    stg_opp.isclosed,
    stg_opp.iswon,
    stg_opp.fiscalyear,
    stg_opp.fiscalquarter,
    stg_opp.createddate,
    user1.user_key as createdby,
    stg_opp.lastmodifieddate,
    user2.user_key as lastmodifiedby,
    stg_opp.amount,
    stg_opp.expectedrevenue,
    stg_opp.closedate

from stg_opp
left join dim_opportunity on stg_opp.opportunity_id=dim_opportunity.salesforce_opportunity_id
left join dim_account on stg_opp.accountid=dim_account.salesforce_account_id
left join dim_campaign on stg_opp.campaignid=dim_campaign.salesforce_campaign_id
left join dim_contact on stg_opp.contactid=dim_contact.salesforce_contact_id
left join dim_user user1 on stg_opp.createdbyid=user1.salesforce_user_id
left join dim_user user2 on stg_opp.lastmodifiedbyid=user2.salesforce_user_id
where dim_opportunity.islatest=1