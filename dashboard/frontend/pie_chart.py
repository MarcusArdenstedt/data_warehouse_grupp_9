import plotly.express as px
from backend import connect_data_warehouse


def must_have_skills(df, column):
    column_titles = {
        "MUST_HAVE_WORK_EXP": "Arbetslivserfarenhet",
        "MUST_HAVE_EDU_LEVEL": "Utbildningsnivå",
        "MUST_HAVE_SKILLS": "Efterfrågade skills"
    }

    top_values = (
        df.groupby(column)
          .size()
          .reset_index(name="Antal") 
          .sort_values("Antal", ascending=False)
          .head(10)
    )
    fig = px.pie(
        top_values,
        values="Antal",                 
        names=column,                   
        title=f"Topp 10 {column_titles.get(column, column)}"
    )

    return fig