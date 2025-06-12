select distinct case_key, solution_key
from {{ ref('fct_case') }}
QUALIFY row_number() over (partition by case_key order by case_key) = 2
