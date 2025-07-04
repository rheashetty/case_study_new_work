with stg_opp as (
    select *
    from {{ ref('stg_salesforce__opportunity') }}
),
stg_opp_history as (
    select *
    from {{ ref('stg_salesforce__opportunity_history') }}
)
select
    opportunity_id as salesforce_opportunity_id,
    null as opportunity_history_id,
    isdeleted,
    isprivate,
    name,
    description,
    null as fromopportunitystagename,
    stagename,
    null as prevopportunitystageupdate,
    null as prevamount,
    amount,
    probability,
    expectedrevenue,
    totalopportunityquantity,
    null as prevclosedate,
    closedate,
    type,
    leadsource,
    null as fromforecastcategory,
    forecastcategory,
    forecastcategoryname,
    null as prevforecastupdate,
    hasopportunitylineitem,
    pricebook2id,
    ownerid,
    createddate,
    createdbyid,
    null as createddateforinsert,
    lastmodifieddate,
    lastmodifiedbyid,
    null as validthroughdate,
    systemmodstamp,
    lastactivitydate,
    laststagechangedate,
    primarypartneraccountid,
    contractid,
    lastamountchangedhistoryid,
    lastclosedatechangedhistoryid,
    deliveryinstallationstatus__c as deliveryinstallationstatus,
    trackingnumber__c as trackingnumber,
    ordernumber__c as ordernumber,
    currentgenerators__c as currentgenerators,
    maincompetitors__c as maincompetitors,
    1 as islatest

from stg_opp

UNION

select
    opportunity_id as salesforce_opportunity_id,
    stg_opp_history.opportunity_history_id,
    stg_opp_history.isdeleted,
    isprivate,
    name,
    description,
    stg_opp_history.fromopportunitystagename,
    stg_opp_history.stagename,
    stg_opp_history.prevopportunitystageupdate,
    stg_opp_history.prevamount,
    stg_opp_history.amount,
    stg_opp_history.probability,
    stg_opp_history.expectedrevenue,
    totalopportunityquantity,
    stg_opp_history.prevclosedate,
    stg_opp_history.closedate,
    type,
    leadsource,
    stg_opp_history.fromforecastcategory,
    stg_opp_history.forecastcategory,
    forecastcategoryname,
    stg_opp_history.prevforecastupdate,
    hasopportunitylineitem,
    pricebook2id,
    ownerid,
    stg_opp_history.createddate,
    stg_opp_history.createdbyid,
    stg_opp_history.createddateforinsert,
    lastmodifieddate,
    lastmodifiedbyid,
    stg_opp_history.validthroughdate,
    stg_opp_history.systemmodstamp,
    lastactivitydate,
    laststagechangedate,
    primarypartneraccountid,
    contractid,
    lastamountchangedhistoryid,
    lastclosedatechangedhistoryid,
    deliveryinstallationstatus__c as deliveryinstallationstatus,
    trackingnumber__c as trackingnumber,
    ordernumber__c as ordernumber,
    currentgenerators__c as currentgenerators,
    maincompetitors__c as maincompetitors,
    0 as islatest

from stg_opp
left join stg_opp_history on stg_opp.opportunity_id=stg_opp_history.opportunityid
where stg_opp_history.opportunity_history_id is not null


