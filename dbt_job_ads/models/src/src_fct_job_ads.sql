WITH job_ads AS (
    SELECT * FROM {{ source('job_ads', 'stg_job_ads') }}
    )
SELECT 
    number_of_vacancies,
    application_deadline,
    publication_date,
    last_publication_date
FROM job_ads