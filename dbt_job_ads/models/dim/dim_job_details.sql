WITH CTE AS (WITH dim_job_details AS (SELECT * FROM {{ ref('src_job_ads') }})

SELECT 
    id,
    {{ dbt_utils.generate_surrogate_key(['id', 'headline','must_have_skills']) }} as job_details_key,
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
    )
SELECT *
FROM CTE
WHERE JOB_DETAILS_KEY = 'eade7f4381dcabdbca526f1fa7f0c1dc'