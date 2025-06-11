{{
    config(
        materialized = "view"
    )
}}
with stg_user_role as (
    select *
    from {{ ref('stg_salesforce__user_role') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['user_role_id']) }} as user_role_key,
    user_role_id as salesforce_user_role_id,
    name,
    parentroleid,
    rollupdescription,
    opportunityaccessforaccountowner,
    caseaccessforaccountowner,
    contactaccessforaccountowner,
    forecastuserid,
    mayforecastmanagershare,
    lastmodifieddate,
    lastmodifiedbyid,
    systemmodstamp,
    portalaccountid,
    portaltype,
    portalrole,
    portalaccountownerid
from stg_user_role