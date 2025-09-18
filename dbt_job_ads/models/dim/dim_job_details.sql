WITH dim_job_details AS (SELECT * FROM {{ ref('src_job_ads') }})

SELECT 
    id,
    max({{ dbt_utils.generate_surrogate_key(['id', 'headline','must_have_skills']) }}) as job_details_key,
    headline,
    max("description") AS "description", 
    max(description_formatted) AS description_formatted,
    max(employment_type) AS employment_type,
    max({{fill_null('duration')}}) AS duration,
    max(salary_type) AS salary_type,
    {{fill_null('must_have_skills')}} AS must_have_skills,
    max({{fill_null('must_have_work_exp')}}) AS must_have_work_exp,
    max({{fill_null('must_have_edu_level')}}) AS must_have_edu_level
FROM 
    dim_job_details
GROUP BY id, headline, must_have_skills