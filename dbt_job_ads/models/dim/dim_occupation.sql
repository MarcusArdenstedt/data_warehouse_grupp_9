
WITH dim_occupation AS (SELECT * FROM {{ ref('src_dim_occupation') }})

SELECT 
    DISTINCT({{ dbt_utils.generate_surrogate_key(['occupation']) }}) as occupation_key,
    occupation,
    occupation_field,
    occupation_group
FROM 
    dim_occupation