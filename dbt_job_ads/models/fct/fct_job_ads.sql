WITH details AS (SELECT * FROM {{ ref('src_dim_details') }}),
{# WITH employer AS (SELECT * FROM {{ ref('src_dim_employer') }}),


WITH occupation AS (SELECT * FROM {{ ref('src_dim_occupation') }}) #}

WITH fct_job_ads AS 
    (SELECT 
    *
    {# {{ dbt_utils.generate_surrogate_key(['details.id']) }} as details_f_key #}
    {# {{ dbt_utils.generate_surrogate_key(['employer.employer_name', 'employer.employer_workplace', 'employer.workplace_region']) }} AS employer_f_key  #}
    FROM {{ ref('src_fct_job_ads') }})



SELECT 
   {{ dbt_utils.generate_surrogate_key(['details.id']) }} AS details_f_key
   *
FROM 
    fct_job_ads AS fja
LEFT JOIN details AS e ON fja.details_f_key = details.job_details_key


