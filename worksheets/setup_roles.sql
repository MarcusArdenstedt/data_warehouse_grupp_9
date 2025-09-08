
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_loader;

CREATE ROLE IF NOT EXISTS job_transformer;

CREATE ROLE IF NOT EXISTS job_presents;


-- grant role privilege to database and schema only for job_loader 

USE ROLE SECURITYADMIN;

--dlt user
GRANT ROLE job_loader TO USER dlt_user;
GRANT USAGE ON DATABASE job_db TO ROLE job_loader;

GRANT USAGE ON SCHEMA job_db.staging TO ROLE job_loader;

GRANT CREATE TABLE ON SCHEMA job_db.staging TO ROLE job_loader;


SHOW ROLES;

--dbt user
GRANT ROLE job_transformer TO USER dbt_user;
GRANT USAGE ON DATABASE job_db TO ROLE job_transformer;
GRANT USAGE ON SCHEMA job_db.warehouse TO ROLE job_transformer;
GRANT USAGE ON SCHEMA job_db.staging TO ROLE job_transformer;

GRANT CREATE TABLE ON SCHEMA job_db.warehouse TO ROLE job_transformer;
GRANT CREATE TABLE ON SCHEMA job_db.staging TO ROLE job_transformer;

GRANT CREATE VIEW ON SCHEMA job_db.warehouse TO ROLE job_transformer;
GRANT CREATE VIEW ON SCHEMA job_db.staging TO ROLE job_transformer;

GRANT CREATE TABLE ON SCHEMA job_db.marts TO ROLE job_transformer;
GRANT CREATE VIEW ON SCHEMA job_db.marts TO ROLE job_transformer;

SHOW GRANTS TO ROLE job_transformer;
SHOW GRANTS TO USER dbt_user;

GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA job_db.staging TO ROLE job_transformer;
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA job_db.staging TO ROLE job_transformer;
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA job_db.warehouse TO ROLE job_transformer;
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA job_db.warehouse TO ROLE job_transformer;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_db.staging TO ROLE job_transformer;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_db.warehouse TO ROLE job_transformer;

-- test on the new role
USE ROLE job_transformer;
USE WAREHOUSE job_api_group_9;
SELECT * FROM job_db.staging.job_advertisements LIMIT 10;


---extra
GRANT ROLE job_transformer TO USER john;



