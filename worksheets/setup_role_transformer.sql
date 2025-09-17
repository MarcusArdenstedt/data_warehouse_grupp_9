
USE ROLE USERADMIN;


CREATE ROLE IF NOT EXISTS job_transformer;


-- grant role privilege to database and schema only for job_loader 

USE ROLE SECURITYADMIN;


--dbt user

-- grant role to warehouse
GRANT USAGE ON WAREHOUSE job_api_group_9 TO ROLE job_transformer;


GRANT ROLE job_transformer TO USER dbt_user;
GRANT USAGE ON DATABASE job_db TO ROLE job_transformer;
GRANT USAGE ON SCHEMA job_db.warehouse TO ROLE job_transformer;
GRANT USAGE ON SCHEMA job_db.staging TO ROLE job_transformer;

GRANT CREATE TABLE ON SCHEMA job_db.warehouse TO ROLE job_transformer;
GRANT CREATE TABLE ON SCHEMA job_db.staging TO ROLE job_transformer;

GRANT CREATE VIEW ON SCHEMA job_db.warehouse TO ROLE job_transformer;
GRANT CREATE VIEW ON SCHEMA job_db.staging TO ROLE job_transformer;

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
SELECT current_warehouse();
SHOW SCHEMAS;
USE WAREHOUSE job_api_group_9;
SELECT * FROM job_db.staging.job_advertisements LIMIT 10;

SELECT current_warehouse(), current_database();

USE WAREHOUSE job_api_group_9;

USE ROLE job_transformer;

SELECT current_warehouse(), current_database(), current_schema(), current_role(), current_schema();

-- grant role to marts
GRANT CREATE TABLE ON SCHEMA job_db.marts TO ROLE job_transformer;
GRANT CREATE VIEW ON SCHEMA job_db.marts TO ROLE job_transformer;
GRANT USAGE ON SCHEMA job_db.marts TO ROLE job_transformer;
--GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLE IN SCHEMA job_db.marts TO ROLE job_transformer;