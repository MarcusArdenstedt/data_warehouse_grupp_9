# HR Analytics

> A project from course Data Warehouse Lifecycle of Data Engineering studies

A ETL pipeline from job ads API, via dlt extrac, dbt transform and loaded to a Streamlit dashboard. Stored in Snowflake.


## Source
Data from job ads in Swedish [Arbetsförmedlingen](https://data.arbetsformedlingen.se/).
* Data from three different occupational field 
* Data is fetched with pagination
* Data is fetcehed from endpoints /snapshot and /stream

## Extract data
dlt is used to extracting data from API into Snowflake

## Transform data
dbt core is used as warehouse
* data is transformed from source
* data is modelled in a dimensional model using star schema, see image [here](https://github.com/MarcusArdenstedt/data_warehouse_grupp_9/blob/main/dbt_job_ads/assets/star_schema.png)
* All models and its columsn are documented in dbt, read more about generated surrogated keys and other import data assumptions

Data linegae in dbt 👇
![Data lineage!](dbt_job_ads/assets/dbt_lineage_graph.png "Lineage graph")


#### Data tests
**Generic data tests (dbt core)**
* All primary keys has unique tests. Checks for unique values in a column.
* All primary keys has not_null tests. Ensures no values in a column are null.
* Foreign key constraints is tested on all foreign keys. Referntial integrity ensured using relationship tests.

**dbt_expectations tests**
* expect_column_values_to_be_of_type, check specifc types of key columns

**Bespoke tests**
* See test_occupational_field_values.sql for accepted values test. Checks that all values in a occupational field contains the intended fields.


## Data storage
Snowflake is used for storage

Following roles are used:
| Users    | Role | "Job title" |
| -------- | ------- | ------- |
| Project group personal accounts  |  accountadmin  | |
| dlt_user | job_loader     | Data Engineer |
| dbt_user | job_transformer | Data Engineer |
| streamlit_user | job_presenter | Data Analyst |