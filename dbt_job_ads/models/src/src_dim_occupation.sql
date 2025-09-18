
WITH src_occupation AS (SELECT * FROM {{ source('job_ads', 'stg_snapshot_job_ads') }}),
src_stream_occupation AS (SELECT * FROM {{ source('job_ads', 'stg_stream_job_ads') }})

SELECT
    id,
    OCCUPATION__LABEL AS occupation,
    OCCUPATION_FIELD__LABEL AS occupation_field,
    OCCUPATION_GROUP__LABEL AS occupation_group,
    removed
FROM 
    src_occupation
WHERE id NOT IN (
    SELECT id
        FROM src_stream_occupation
        WHERE removed = TRUE)

UNION
SELECT
    id,
    OCCUPATION__LABEL AS occupation,
    OCCUPATION_FIELD__LABEL AS occupation_field,
    OCCUPATION_GROUP__LABEL AS occupation_group,
    removed
FROM 
    src_stream_occupation
WHERE removed = FALSE
