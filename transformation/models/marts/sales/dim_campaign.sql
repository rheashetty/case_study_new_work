{{
    config(
        materialized = "view"
    )
}}

with stg_campaign as (
    select *
    from {{ ref('stg_salesforce__campaign') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['campaign_id']) }} as campaign_key,
    campaign_id as salesforce_campaign_id,
    isdeleted,
    name,
    parentid,
    type,
    status,
    startdate,
    enddate,
    expectedrevenue,
    budgetedcost,
    actualcost,
    expectedresponse,
    numbersent,
    isactive,
    description,
    numberofleads,
    numberofconvertedleads,
    numberofcontacts,
    numberofresponses,
    numberofopportunities,
    numberofwonopportunities,
    amountallopportunities,
    amountwonopportunities,
    hierarchynumberofleads,
    hierarchynumberofconvertedleads,
    hierarchynumberofcontacts,
    hierarchynumberofresponses,
    hierarchynumberofopportunities,
    hierarchynumberofwonopportunities,
    hierarchyamountallopportunities,
    hierarchyamountwonopportunities,
    hierarchynumbersent,
    hierarchyexpectedrevenue,
    hierarchybudgetedcost,
    hierarchyactualcost,
    ownerid,
    createddate,
    createdbyid,
    lastmodifieddate,
    lastmodifiedbyid,
    systemmodstamp,
    lastactivitydate,
    campaignmemberrecordtypeid
from stg_campaign