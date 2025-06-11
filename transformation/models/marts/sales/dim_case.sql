{{
    config(
        materialized = "view"
    )
}}

with int_case as (
    select *
    from {{ ref('int_case__scd2') }}
),
select 
    {{ dbt_utils.generate_surrogate_key(['salesforce_case_id','case_history_id','islatest']) }} as case_key,
    salesforce_case_id,
    case_history_id,
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
    engineeringreqnumber,
    slaviolation,
    product,
    potentialliability,
    islatest,
    previousupdate,
    createddate,
    lastmodifieddate,
    createdbyid,
    lastmodifiedbyid
from int_case