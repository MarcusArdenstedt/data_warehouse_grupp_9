import plotly.express as px 



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