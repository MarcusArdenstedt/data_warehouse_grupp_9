
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_loader;

USE ROLE SECURITYADMIN;



--dlt user
GRANT USAGE ON WAREHOUSE job_api_group_9 TO ROLE job_loader;

GRANT USAGE ON DATABASE job_db TO ROLE job_loader;

GRANT USAGE ON SCHEMA job_db.staging TO ROLE job_loader;

GRANT CREATE TABLE ON SCHEMA job_db.staging TO ROLE job_loader;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA job_db.staging TO ROLE job_loader;

GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA job_db.staging TO ROLE job_loader;

GRANT ROLE job_loader TO USER dlt_user;

GRANT ROLE job_loader TO USER h4zan;

GRANT ROLE job_loader TO USER john;

GRANT ROLE job_loader TO USER marcus;


SHOW GRANTS ON SCHEMA job_db.staging;

SHOW FUTURE GRANTS IN SCHEMA job_db.staging;

SHOW SCHEMAS;

SHOW GRANTS TO ROLE job_loader;

SHOW GRANTS TO USER dlt_user;