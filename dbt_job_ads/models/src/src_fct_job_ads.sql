WITH job_ads AS (
    SELECT * FROM {{ source('job_ads', 'stg_job_ads') }}
    )
SELECT *
FROM job_ads