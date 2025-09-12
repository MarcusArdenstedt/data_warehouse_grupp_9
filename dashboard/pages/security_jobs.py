import streamlit as st
from connect_data_warehouse import query_job_listings

def layout():
    df = query_job_listings(occupational_field="Säkerhet och bevakning")

    st.title("Säkerhet och bevakning")

    st.markdown('### Yrken med störst efterfrågan')

        
    st.dataframe(df)

if __name__ == "__main__":
    layout()