USE ROLE USERADMIN;

SELECT CURRENT_ROLE();

CREATE ROLE job_loader COMMENT ="Able to load data into the job database";

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE job_api_group_9 TO ROLE job_loader;

GRANT USAGE ON DATABASE job_db TO ROLE job_loader;'

GRANT USAGE ON ALL SCHEMAS IN DATABASE job_db TO ROLE job_loader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA job_db.public TO job_loader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA job_db.staging TO job_loader;


USE ROLE SECURITYADMIN;

GRANT 
    INSERT, UPDATE, DELETE
    ON FUTURE TABLES 
    IN SCHEMA job_db.public
    TO ROLE job_loader;

GRANT 
    INSERT, UPDATE, DELETE
    ON FUTURE TABLES 
    IN SCHEMA job_db.staging
    TO ROLE job_loader;


SHOW GRANTS TO ROLE job_loader;

SHOW FUTURE GRANTS IN SCHEMA job_db.staging;


GRANT ROLE job_loader TO USER group_9_el; 
