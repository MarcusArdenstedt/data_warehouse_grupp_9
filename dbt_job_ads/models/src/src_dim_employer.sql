
WITH src_employment AS (SELECT * FROM {{ source('job_ads', 'stg_job_ads') }})

SELECT 
    EMPLOYER__NAME AS employer_name,
    EMPLOYER__WORKPLACE AS employer_workplace,
    EMPLOYER__ORGANIZATION_NUMBER AS employer_org,
    WORKPLACE_ADDRESS__STREET_ADDRESS AS workplace_street_address,
    WORKPLACE_ADDRESS__REGION AS workplace_region,
    WORKPLACE_ADDRESS__POSTCODE AS workplace_postcode,
    WORKPLACE_ADDRESS__CITY AS workplace_city,
    WORKPLACE_ADDRESS__COUNTRY AS workplace_country
FROM 
    src_employment