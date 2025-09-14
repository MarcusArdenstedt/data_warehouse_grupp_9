import streamlit as st
from connect_data_warehouse import query_job_listings
import plotly.express as px
from datetime import timedelta

def days_ago(date):
  return date - timedelta(7)

#Total antal annonser
def num_of_ads(df):
    return df.shape[0]

#Nya annonser senaste 7 dagar
def num_of_ads_7_days(df):
    df_new = df[['OCCUPATION', 'NUMBER_OF_VACANCIES', 'PUBLICATION_DATE']]
    max_date = df_new['PUBLICATION_DATE'].max()
    filtered_df = df_new[df_new['PUBLICATION_DATE'] > days_ago(max_date)]

    return filtered_df.shape[0]

#Number of Vacancies by Occupation
def num_of_vacancies(df):
    groupby_df = df.groupby("OCCUPATION")["NUMBER_OF_VACANCIES"].sum()
    sorted_df = groupby_df.sort_values(ascending=False).iloc[0:15]
    fig = px.bar(sorted_df,
                 title='Antal lediga tjänster per yrke (topp 15)',
                 orientation='h',
                 labels={"OCCUPATION":'Yrken'},
                 text_auto=True)
    fig.update_yaxes(categoryorder='total ascending')
    fig.update_xaxes(title="Antal lediga tjänster")
    fig.update_layout(showlegend=False)
    return fig

def layout():

    #page df
    df = query_job_listings(occupational_field="Säkerhet och bevakning")
    
    st.title("Säkerhet och bevakning")
    
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

if __name__ == "__main__":
    st.set_page_config(page_title="Data Analysis Dashboard")
    layout()