with dim_employer as (select * from {{ ref('src_dim_employer') }})

select
    {{ dbt_utils.generate_surrogate_key(['id', 'employer_name', 'employer_workplace', 'workplace_region']) }} as employer_key,
    employer_name,
    employer_workplace,
    employer_org_nr,
    workplace_street_address,
    {{fill_null('workplace_region')}} AS workplace_region,
    workplace_postcode,
    workplace_city,
    workplace_country
from dim_employer
