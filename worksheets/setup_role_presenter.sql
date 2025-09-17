USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_presenter;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE job_api_group_9 TO ROLE job_presenter;

GRANT USAGE ON DATABASE job_db TO ROLE job_presenter;

GRANT USAGE ON SCHEMA job_db.marts TO ROLE job_presenter;

GRANT SELECT ON ALL TABLES IN SCHEMA job_db.marts TO ROLE job_presenter;
GRANT SELECT ON FUTURE TABLES IN SCHEMA job_db.marts TO ROLE job_presenter;

GRANT SELECT ON ALL VIEWS IN SCHEMA job_db.marts TO ROLE job_presenter;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_db.marts TO ROLE job_presenter;

GRANT ROLE job_presenter TO USER streamlit_user;


USE ROLE job_presenter;

SELECT * FROM job_db.marts.mart_data_it
LIMIT 10;