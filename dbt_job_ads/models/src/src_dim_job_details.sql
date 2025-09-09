
WITH job_details AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads') }})

SELECT
    id,
    headline,
    description__text AS "description", 
    description__text_formatted AS description_formatted,
    employment_type__label AS employment_typ,
    duration__label AS duration,
    salary_type__label AS salary_type,
    scope_of_work__min AS max_scope,
    scope_of_work__max AS min_scope,
FROM 
    job_details