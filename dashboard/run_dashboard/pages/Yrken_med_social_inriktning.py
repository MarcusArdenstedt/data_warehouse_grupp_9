import streamlit as st
from backend.data_processing import query_job_listings
from backend.calculation import num_of_ads, num_of_ads_7_days, count_vacancies, count_procent
from frontend.bar_chart import num_of_vacancies
from frontend.pie_chart import must_have_skills
from frontend.map import choroplth_map


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
    st.markdown("### Antal lediga tjänster per region")
    col_1, col_2, col_3= st.columns(3)
    with col_1:
        st.metric(label= "Totala tjänster lediga", value= count_vacancies(df))
        
    with col_2:
        st.metric(label= "Regioner ej Specificerad", value= count_vacancies(data= df, type= "ej specificerad"))
        
    with col_3:
        st.metric(label= "% ej specificerad region", value=count_procent(data= df))
        
    fig = choroplth_map(df= df, occupation= "Yrken med social inriktning")
    
    st.plotly_chart(fig, use_container_width= True)

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