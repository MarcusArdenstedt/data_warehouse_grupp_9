
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_loader;

CREATE ROLE IF NOT EXISTS job_transformer;

CREATE ROLE IF NOT EXISTS job_presents;


-- grant role privilege to database and schema only for job_loader 

USE ROLE SECURITYADMIN;
GRANT ROLE job_loader TO USER dlt_user;
GRANT USAGE ON DATABASE job_db TO ROLE job_loader;

GRANT USAGE ON SCHEMA job_db.staging TO ROLE job_loader;

GRANT CREATE TABLE ON SCHEMA job_db.staging TO ROLE job_loader;


SHOW ROLES;

GRANT ROLE job_transformer TO USER dbt_user;

GRANT USAGE ON DATABASE job_db TO ROLE job_transformer;

GRANT USAGE ON SCHEMA job_db.warehouse TO ROLE job_transformer;

GRANT CREATE TABLE ON SCHEMA job_db.warehouse TO ROLE job_transformer;

GRANT CREATE VIEW ON SCHEMA job_db.warehouse TO ROLE job_transformer;

GRANT CREATE TABLE ON SCHEMA job_db.marts TO ROLE job_transformer;
GRANT CREATE VIEW ON SCHEMA job_db.marts TO ROLE job_transformer;

SHOW GRANTS ON ROLE job_transformer;





