USE ROLE USERADMIN;


CREATE USER IF NOT EXISTS streamlit_user
    PASSWORD = "Streamlituser"
    DEFAULT_WAREHOUSE = job_api_group_9
    LOGIN_NAME = "streamlit_user"
    DEFAULT_ROLE = "job_presenter"
    DEFAULT_NAMESPACE = "job_db.marts"
    MUST_CHANGE_PASSWORD = TRUE;    


