
WITH src_employment AS (SELECT * FROM {{ source('job_ads', 'stg_snapshot_job_ads') }}),
src_stream_employer AS (SELECT * FROM {{ source('job_ads', 'stg_stream_job_ads') }})

SELECT 
    id,
    EMPLOYER__NAME AS employer_name,
    EMPLOYER__WORKPLACE AS employer_workplace,
    EMPLOYER__ORGANIZATION_NUMBER AS employer_org_nr,
    WORKPLACE_ADDRESS__STREET_ADDRESS AS workplace_street_address,
    WORKPLACE_ADDRESS__REGION AS workplace_region,
    WORKPLACE_ADDRESS__POSTCODE AS workplace_postcode,
    WORKPLACE_ADDRESS__CITY AS workplace_city,
    WORKPLACE_ADDRESS__COUNTRY AS workplace_country,
    removed
FROM 
    src_employment
WHERE id NOT IN (
    SELECT id
        FROM src_stream_employer
        WHERE removed = TRUE)
UNION
SELECT
    id,
    EMPLOYER__NAME AS employer_name,
    EMPLOYER__WORKPLACE AS employer_workplace,
    EMPLOYER__ORGANIZATION_NUMBER AS employer_org_nr,
    WORKPLACE_ADDRESS__STREET_ADDRESS AS workplace_street_address,
    WORKPLACE_ADDRESS__REGION AS workplace_region,
    WORKPLACE_ADDRESS__POSTCODE AS workplace_postcode,
    WORKPLACE_ADDRESS__CITY AS workplace_city,
    WORKPLACE_ADDRESS__COUNTRY AS workplace_country,
    removed
FROM src_stream_employer
WHERE removed = FALSE
