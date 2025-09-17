WITH job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_snapshot_job_ads') }}), 
stream_job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_stream_job_ads') }}),
must_have_skills_snapshot AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_skills') }}),
must_have_work_exp_snapshot AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_work_exp') }}),
must_have_edu_level_snapshot AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_education_level') }}),
must_have_skills_stream AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_skills_stream') }}),
must_have_work_exp_stream AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_work_exp_stream') }}),
must_have_edu_level_stream AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads_must_have_education_level_stream') }})
--Remove all removed
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
    el.label AS must_have_edu_level,
    removed
FROM job_ads as ja
LEFT JOIN must_have_skills_snapshot as s ON ja._dlt_id = s._dlt_parent_id
LEFT JOIN must_have_work_exp_snapshot as we ON ja._dlt_id = we._dlt_parent_id
LEFT JOIN must_have_edu_level_snapshot as el ON ja._dlt_id = el._dlt_parent_id
WHERE id NOT IN (
    SELECT id
        FROM stream_job_ads
        WHERE removed = TRUE)
UNION
--Union in the new ads
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
    ss.label AS must_have_skills,
    swe.label AS must_have_work_exp,
    sel.label AS must_have_edu_level,
    removed
FROM stream_job_ads sja
LEFT JOIN must_have_skills_stream as ss ON sja._dlt_id = ss._dlt_parent_id
LEFT JOIN must_have_work_exp_stream as swe ON sja._dlt_id = swe._dlt_parent_id
LEFT JOIN must_have_edu_level_stream as sel ON sja._dlt_id = sel._dlt_parent_id
where removed = FALSE