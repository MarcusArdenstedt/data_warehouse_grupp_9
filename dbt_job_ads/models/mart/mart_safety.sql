with fct_job_ads AS (SELECT * FROM {{ ref('fct_job_ads') }}),
dim_employer AS (SELECT * FROM {{ ref('dim_employment') }}),
dim_job_details AS (SELECT * FROM {{ ref('dim_job_details') }}),
dim_occupation AS (SELECT * FROM {{ ref('dim_occupation') }})

SELECT 
    --Number of Vacancies by Occupation (filter by region and publication date)
    --Number of job ads by Region
    --Average Vacancy Duration
    --Most In-Demand Skills (value count on occupation)
    fja.number_of_vacancies,
    o.occupation,
    e.workplace_region,
    fja.publication_date,
    --fja.last_publication_date,
    fja.application_deadline,
    o.occupation_field,
    e.employer_name,
    jd.must_have_skills,
    jd.must_have_edu_level,
    jd.must_have_work_exp

FROM fct_job_ads as fja
LEFT JOIN dim_occupation as o on fja.occupation_f_key = o.occupation_key
LEFT JOIN dim_employer as e on fja.employer_f_key = e.employer_key
LEFT JOIN dim_job_details as jd on fja.job_details_f_key = jd.job_details_key
where occupation_field = 'Säkerhet och bevakning'

