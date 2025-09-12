

WITH dim_job_details AS (SELECT * FROM {{ ref('src_job_ads') }})

SELECT 
    {{ dbt_utils.generate_surrogate_key(['id']) }} as job_details_key,
    headline,
    "description", 
    description_formatted,
    employment_type,
    {{fill_null('duration')}} AS duration,
    salary_type,
    {{fill_null('must_have_skills')}} AS must_have_skills,
    {{fill_null('must_have_work_exp')}} AS must_have_work_exp,
    {{fill_null('must_have_edu_level')}} AS must_have_edu_level
FROM 
    dim_job_details