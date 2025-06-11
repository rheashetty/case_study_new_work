with stg_case as (
    select *
    from {{ ref('stg_salesforce__case') }}
),
stg_case_history as (
    select *
    from {{ ref('stg_salesforce__case_history_2') }}
)
select
    case_id as salesforce_case_id,
    null as case_history_id,
    isdeleted,
    masterrecordid,
    casenumber,
    assetid,
    entitlementid,
    sourceid,
    businesshoursid,
    parentid,
    suppliedname,
    suppliedemail,
    suppliedphone,
    suppliedcompany,
    type,
    status,
    reason,
    origin,
    subject,
    priority,
    description,
    ownerid,
    systemmodstamp,
    servicecontractid,
    eventsprocesseddate,
    engineeringreqnumber__c as engineeringreqnumber,
    slaviolation__c as slaviolation,
    product__c as product,
    potentialliability__c as potentialliability,
    1 as islatest,
    null as previousupdate,
    createddate,
    lastmodifieddate,
    createdbyid,
    lastmodifiedbyid
    
from stg_case 

UNION

select
    case_id as salesforce_case_id,
    stg_case_history.case_history_id,
    stg_case_history.isdeleted,
    masterrecordid,
    casenumber,
    assetid,
    entitlementid,
    sourceid,
    businesshoursid,
    parentid,
    suppliedname,
    suppliedemail,
    suppliedphone,
    suppliedcompany,
    type,
    stg_case_history.status,
    reason,
    origin,
    subject,
    priority,
    description,
    stg_case_history.ownerid,
    stg_case_history.systemmodstamp,
    servicecontractid,
    eventsprocesseddate,
    engineeringreqnumber__c as engineeringreqnumber,
    slaviolation__c as slaviolation,
    product__c as product,
    potentialliability__c as potentialliability,
    0 as islatest,
    stg_case_history.previousupdate,
    createddate,
    stg_case_history.lastmodifieddate,
    createdbyid,
    stg_case_history.lastmodifiedbyid


from stg_case
left join stg_case_history on stg_case.case_id=stg_case_history.caseid
where stg_case_history.case_history_id is not null