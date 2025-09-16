with dim_occupation as (select * from {{ ref('src_dim_occupation') }})

select
    {{ dbt_utils.generate_surrogate_key(['id','occupation']) }} as occupation_key,
    occupation,
    max(occupation_group) as occupation_group,
    max(occupation_field) as occupation_field
from dim_occupation
group by occupation, id