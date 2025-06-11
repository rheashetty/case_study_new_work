{{
    config(
        materialized = "view"
    )
}}
with stg_record_type as (
    select *
    from {{ ref('stg_salesforce__record_type') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['record_type_id']) }} as record_type_key,
    record_type_id as salesforce_record_type_id,
    name,
    modulenamespace,
    description,
    businessprocessid,
    sobjecttype,
    isactive,
    createdbyid,
    createddate,
    lastmodifiedbyid,
    lastmodifieddate,
    systemmodstamp,
    isdeleted
from stg_record_type