
SELECT current_role(), current_user(), current_warehouse(), current_database(), current_schema();

SHOW DATABASES;

USE DATABASE job_db;

USE WAREHOUSE job_api_group_9;

USE SCHEMA staging;

SELECT  
    *
FROM 
    job_advertisements__driving_license
LIMIT 10;