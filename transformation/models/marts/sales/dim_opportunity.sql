{{
    config(
        materialized = "view"
    )
}}

with int_opp as (
    select *
    from {{ ref('int_opportunity__scd2') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['salesforce_opportunity_id','opportunity_history_id','islatest']) }} as opportunity_key,
    salesforce_opportunity_id,
    opportunity_history_id,
    isdeleted,
    isprivate,
    name,
    description,
    fromopportunitystagename,
    stagename,
    prevopportunitystageupdate,
    prevamount,
    amount,
    probability,
    expectedrevenue,
    totalopportunityquantity,
    prevclosedate,
    closedate,
    type,
    leadsource,
    fromforecastcategory,
    forecastcategory,
    forecastcategoryname,
    prevforecastupdate,
    hasopportunitylineitem,
    pricebook2id,
    ownerid,
    createddate,
    createdbyid,
    createddateforinsert,
    lastmodifieddate,
    lastmodifiedbyid,
    validthroughdate,
    systemmodstamp,
    lastactivitydate,
    laststagechangedate,
    primarypartneraccountid,
    contractid,
    lastamountchangedhistoryid,
    lastclosedatechangedhistoryid,
    deliveryinstallationstatus,
    trackingnumber,
    ordernumber,
    currentgenerators,
    maincompetitors,
    islatest
from int_opp