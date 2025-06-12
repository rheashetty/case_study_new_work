
select opportunity_id, closedate
from {{ ref('stg_salesforce__opportunity') }}
where isclosed is false and closedate > current_date()
