with dim_employer as (select * from {{ ref('src_dim_employer') }})

select
    --{{ dbt_utils.generate_surrogate_key(['occupation']) }} as occupation_id,
    *
from dim_employer
