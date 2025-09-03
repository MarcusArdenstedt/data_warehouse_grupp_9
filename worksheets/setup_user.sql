USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS group_9_el
    PASSWORD = "group9isbest"
    DEFAULT_WAREHOUSE = "job_api_group_9";



GRANT USAGE ON WAREHOUSE job_api_group_9 TO ROLE job_loader;

