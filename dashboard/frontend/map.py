from plotly import graph_objects as go 
from backend.data_processing import read_json_data
from backend.calculation import get_matches
from backend.data_filter import region_vacancies
import numpy as np




def choroplth_map(df, occupation):
    
     
    df["LOG_VALUE"] = np.log(region_vacancies(occupation= occupation)["VACANCIES"] + 1)
    
    df["LOG_VALUE"] 
    
    df_region = region_vacancies(occupation= occupation)
    
    total = df["NUMBER_OF_VACANCIES"].sum()
    
    percent = (df_region["VACANCIES"] / total * 100).round(2) if total else 0
    
    custom = np.column_stack([df_region["VACANCIES"].to_numpy(),percent.to_numpy()])
    
    fig = go.Figure(
        go.Choroplethmapbox(
            geojson= read_json_data(),
            locations= get_matches(occupation= occupation),
            z= df["LOG_VALUE"],
            featureidkey= "properties.ref:se:länskod",
            colorscale="blues",
            marker_opacity = 0.9,
            marker_line_width = 0.5,
            marker_line_color = 'darkgrey',
            text= region_vacancies(occupation= occupation)["WORKPLACE_REGION"],
            customdata= custom,
            hovertemplate= "<b>%{text}</b><br>Total vacancies: %{customdata[0]}<br>Procent: %{customdata[1]}%<extra></extra>",
            showscale= False
        )
    )
    
    fig.update_layout(
        # title = dict(
        #     text=
        #         "<b>Antal lediga tjänster"
        #         f"<br>för yrket {occupation}</b>" 
        #         f"<br>Totala lediga tjänster: {df['NUMBER_OF_VACANCIES'].sum()}"
        #         "<br>Lediga tjänster som är "
        #         f"<br>ej specificerad regioner: {df.query("WORKPLACE_REGION == 'ej specificerad'")["NUMBER_OF_VACANCIES"].sum()}",
        #         font= dict(size= 14, color= "black"), x=0.2, y=0.8, xanchor="center", yanchor= "top", pad=dict(t=8, b=0)
        # ),
        mapbox= dict(center= dict(lat= 62.6952, lon= 13.9149), style= "white-bg", zoom= 3.6),
        margin= dict(r=0, t= 0, l= 0, b= 0),
        dragmode= False,
        width= 50,
        height= 590
    )
    
    return fig