

-- create user dlt_user
USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS dlt_user
    PASSWORD = "dlt_user123"
    DEFAULT_WAREHOUSE = job_api_group_9
    DEFAULT_ROLE = "job_loader"
    DEFAULT_NAMESPACE = "job_db.staging"
    MUST_CHANGE_PASSWORD = TRUE;
    

SELECT current_role();

-- create user dbt_transformer
USE ROLE USERADMIN;

DROP USER dbt_user;

CREATE USER IF NOT EXISTS dbt_user
    PASSWORD = "dbt_transform"
    DEFAULT_WAREHOUSE = job_api_group_9
    LOGIN_NAME = "dbt_user"
    DEFAULT_ROLE = "job_transformer"
    DEFAULT_NAMESPACE = "job_db.warehouse"
    MUST_CHANGE_PASSWORD = TRUE;

-- create user streamlit_user
USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS streamlit_user
    PASSWORD = "Streamlituser"
    DEFAULT_WAREHOUSE = job_api_group_9
    LOGIN_NAME = "streamlit_user"
    DEFAULT_ROLE = "job_presenter"
    DEFAULT_NAMESPACE = "job_db.marts"
    MUST_CHANGE_PASSWORD = TRUE;

