WITH job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_snapshot_job_ads') }}),
must_have_skills AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_skills') }}),
must_have_work_exp AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_work_exp') }}),
must_have_edu_level AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_education_level') }})

SELECT 
    id,
    number_of_vacancies,
    application_deadline,
    publication_date,
    last_publication_date,
    headline,
    description__text AS "description", 
    description__text_formatted AS description_formatted,
    employment_type__label AS employment_type,
    duration__label AS duration,
    salary_type__label AS salary_type,
    scope_of_work__min AS max_scope,
    scope_of_work__max AS min_scope,
    s.label AS must_have_skills,
    we.label AS must_have_work_exp,
    el.label AS must_have_edu_level
FROM 
    job_ads ja
LEFT JOIN must_have_skills as s ON ja._dlt_id = s._dlt_parent_id
LEFT JOIN must_have_work_exp as we ON ja._dlt_id = we._dlt_parent_id
LEFT JOIN must_have_edu_level as el ON ja._dlt_id = el._dlt_parent_id