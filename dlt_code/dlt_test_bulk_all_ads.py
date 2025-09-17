import dlt
import requests
import json
from pathlib import Path
import os

def _get_ads(url):
    response = requests.get(url)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content)

@dlt.resource(write_disposition="replace")
def jobsearch_resource():
    url = "https://jobstream.api.jobtechdev.se/snapshot"
    
    data = _get_ads(url)
    target_occupation_ids = {"E7hm_BLq_fqZ", "GazW_2TU_kJw", "apaJ_2ja_LuF"}
    for ad in data:
        if ad["occupation_field"]["concept_id"] in target_occupation_ids:
            yield ad

def run_pipeline(table_name):
    pipeline = dlt.pipeline(
        pipeline_name="job_ads_snapshot",
        destination="snowflake",
        dataset_name="staging",
    )
        
    load_info = pipeline.run(jobsearch_resource(), table_name=table_name)
    print(load_info)


if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    table_name = "arbetsformedling_ads"

    run_pipeline(table_name=table_name)