{# 
WITH dim_occupation AS (SELECT * FROM {{ ref('src_dim_occupation') }})

SELECT 
    DISTINCT({{ dbt_utils.generate_surrogate_key(['occupation']) }}) as occupation_key,
    occupation,
    occupation_field,
    occupation_group
FROM 
    dim_occupation
WHERE occupation ='Säkerhetsingenjör' #} 


with src_occupation as (select * from {{ ref('src_dim_occupation') }})

select
    {{ dbt_utils.generate_surrogate_key(['occupation']) }} as occupation_key,
    occupation,
    max(occupation_group) as occupation_group,
    max(occupation_field) as occupation_field
from dim_occupation
group by occupation
HAVING occupation ='Säkerhetsingenjör'


