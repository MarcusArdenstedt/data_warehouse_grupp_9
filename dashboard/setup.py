
from setuptools import setup, find_packages

setup(
    name= "HR-agency",
    version= "0.0.1",
    description="""
    This page is used for creating dashboard in streamlit for HR-agency""",
    author= "Marcus, Hazan, John",
    install_requires = ["pandas", "streamlit", "duckdb", "openpyxl"],
    packages= find_packages(exclude=("exploration*", "dbt_job_ads*", "dlt_code*", "logs*", "worksheets")),
    python_requires =">=3.7"
)