from backend.data_processing import query_job_listings
from backend.data_processing import read_json_data
import pandas as pd

def region_code(geojson):

    properties = [property.get("properties") for property in geojson.get("features")]

    region_länskod = {name_code.get("name"): name_code.get("ref:se:länskod")for name_code in properties}
    
    return region_länskod

def region_vacancies(occupation):
    
    df_occupation = query_job_listings(occupational_field= occupation)
    
    
    df_region_vacancies = df_occupation[["WORKPLACE_REGION", "NUMBER_OF_VACANCIES"]]
    
    df = df_region_vacancies.groupby("WORKPLACE_REGION")["NUMBER_OF_VACANCIES"].sum().reset_index(name="VACANCIES").sort_values(by= "VACANCIES").reset_index(drop=True)
    
    df = df.drop(index=["ej specificerad"], errors= "ignore").reset_index(drop= True)
    
    # if one or more region dosen't have any data, this is a safty to make sure i set them to zero
    missing_data = pd.DataFrame({
        "WORKPLACE_REGION": region_code(read_json_data()).keys()
    })
    
    df_merge = missing_data.merge(df, on= "WORKPLACE_REGION", how= "left")
    
    df_merge["VACANCIES"] = df_merge["VACANCIES"].fillna(0).astype(int)
    
    return df_merge