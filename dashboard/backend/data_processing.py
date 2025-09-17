import os
from dotenv import load_dotenv
import snowflake.connector
import pandas as pd 
from pathlib import Path
import json

 
def query_job_listings(occupational_field):

    load_dotenv()

    with snowflake.connector.connect(
        user=os.getenv("SNOWFLAKE_USER"),
        password=os.getenv("SNOWFLAKE_PASSWORD"),
        account=os.getenv("SNOWFLAKE_ACCOUNT"),
        warehouse=os.getenv("SNOWFLAKE_WAREHOUSE"),
        database=os.getenv("SNOWFLAKE_DATABASE"),
        schema=os.getenv("SNOWFLAKE_SCHEMA"),
        role=os.getenv("SNOWFLAKE_ROLE"),
    ) as conn:
        if occupational_field == "Data/IT":
            query='SELECT * FROM mart_data_it'
        elif occupational_field == "Säkerhet och bevakning":
            query='SELECT * FROM mart_safety'
        else:
            query='SELECT * FROM mart_social_work'
        # Execute the query
        df = pd.read_sql(query, conn)
        
        return df
    
    
def read_json_data():
    working_directory = Path(__file__).parent

    path_geojson = working_directory / "geojson_data"

    with open(path_geojson / "swedish_regions.geojson", "r", encoding= "utf-8") as file:
        json_data = json.load(file)
        
    return json_data

