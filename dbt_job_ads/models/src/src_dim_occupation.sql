
WITH src_occupation AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads') }})

SELECT
    OCCUPATION__LABEL AS occupation,
    DISTINCT(OCCUPATION_FIELD__LABEL) AS occupation_field,
    OCCUPATION_GROUP__LABEL AS occupation_group
FROM 
    src_occupation


