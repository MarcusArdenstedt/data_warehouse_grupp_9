WITH details AS (SELECT * FROM {{ ref('src_dim_job_details') }}),
employer AS (SELECT * FROM {{ ref('src_dim_employer') }}),
occupation AS (SELECT * FROM {{ ref('src_dim_occupation') }}),
fct_job_ads AS (SELECT * FROM {{ ref('src_fct_job_ads') }})

SELECT
    fja.id,
    {{ dbt_utils.generate_surrogate_key(['e.employer_name', 'e.employer_workplace', 'e.workplace_region']) }} as employer_f_key,
    {{ dbt_utils.generate_surrogate_key(['d.id']) }} as job_details_f_key,
    {{ dbt_utils.generate_surrogate_key(['o.occupation']) }} as occupation_key,
    number_of_vacancies,
    CAST(application_deadline AS DATE) as application_deadline,
    CAST(publication_date AS DATE) as publication_date,
    CAST(last_publication_date AS DATE) as last_publication_date
FROM 
    fct_job_ads AS fja
LEFT JOIN details AS d ON fja.id = d.id
LEFT JOIN employer AS e ON fja.id = e.id
LEFT JOIN occupation AS o ON fja.id = o.id
ORDER BY publication_date DESC