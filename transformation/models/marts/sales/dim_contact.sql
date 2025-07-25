{{
    config(
        materialized = "view"
    )
}}

with stg_contact as (
    select *
    from {{ ref('stg_salesforce__contact') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['contact_id']) }} as contact_key,
    contact_id as salesforce_contact_id,
    isdeleted,
    masterrecordid,
    accountid,
    salutation,
    firstname,
    lastname,
    otherstreet,
    othercity,
    otherstate,
    otherpostalcode,
    othercountry,
    otherlatitude,
    otherlongitude,
    othergeocodeaccuracy,
    mailingstreet,
    mailingcity,
    mailingstate,
    mailingpostalcode,
    mailingcountry,
    mailinglatitude,
    mailinglongitude,
    mailinggeocodeaccuracy,
    phone,
    fax,
    mobilephone,
    homephone,
    otherphone,
    assistantphone,
    reportstoid,
    email,
    title,
    department,
    assistantname,
    leadsource,
    birthdate,
    description,
    ownerid,
    hasoptedoutofemail,
    hasoptedoutoffax,
    donotcall,
    createddate,
    createdbyid,
    lastmodifieddate,
    lastmodifiedbyid,
    systemmodstamp,
    lastactivitydate,
    lastcurequestdate,
    lastcuupdatedate,
    emailbouncedreason,
    emailbounceddate,
    jigsaw,
    jigsawcontactid,
    cleanstatus,
    individualid,
    pronouns,
    genderidentity,
    level__c as level,
    languages__c as language
from stg_contact