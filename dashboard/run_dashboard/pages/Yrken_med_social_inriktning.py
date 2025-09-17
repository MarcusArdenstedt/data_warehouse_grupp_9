import streamlit as st
from backend.connect_data_warehouse import query_job_listings
from backend.calculation import num_of_ads, num_of_ads_7_days
from frontend.bar_chart import num_of_vacancies
from frontend.pie_chart import must_have_skills


def layout():

    #page df
    df = query_job_listings(occupational_field="Yrken med social inriktning")
    
    st.title("Yrken med social inriktning")
    
    #top metrics
    col1, col2 = st.columns(2)
    with col1:
        st.metric(label = "Antal annonser", value=num_of_ads(df))
    with col2:
        st.metric(label = "Antal annonser (7 dagar)", value=num_of_ads_7_days(df))

    st.markdown('### Yrken med störst efterfrågan')
    #bar chart
    fig = num_of_vacancies(df)
    st.plotly_chart(fig)

    ##choropleth

    #skill graph
    fig_pie, excluded_pct = must_have_skills(df, "MUST_HAVE_EDU_LEVEL")
    st.plotly_chart(fig_pie)

    st.markdown(
    f"<p style='text-align: center; margin-top: -70px;'>"
    f"Ej specificerad är exkluderad ({excluded_pct}% av totalen)"
    f"</p>",
    unsafe_allow_html=True)

if __name__ == "__main__":
    st.set_page_config(page_title="Data Analysis Dashboard")
    layout()