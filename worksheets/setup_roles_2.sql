
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_loader;

CREATE ROLE IF NOT EXISTS job_transformer;

CREATE ROLE IF NOT EXISTS job_presents;


-- grant role privilege to database and schema only for job_loader 

GRANT ROLE job_loader TO USER dlt_user;
GRANT USAGE ON DATABASE job_db TO ROLE job_loader;

GRANT USAGE ON SCHEMA job_db.staging TO ROLE job_loader;

GRANT CREATE TABLE ON SCHEMA job_db.staging TO ROLE job_loader;





