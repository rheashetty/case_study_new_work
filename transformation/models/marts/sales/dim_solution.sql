{{
    config(
        materialized = "view"
    )
}}
with stg_solution as (
    select *
    from {{ ref('stg_salesforce__solution') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['solution_id']) }} as solution_key,
    solution_id,
    isdeleted,
    solutionnumber,
    solutionname,
    ispublished,
    ispublishedinpublickb,
    status,
    isreviewed,
    solutionnote,
    caseid,
    ownerid,
    createddate,
    createdbyid,
    lastmodifieddate,
    lastmodifiedbyid,
    systemmodstamp,
    timesused,
    ishtml
from stg_solution