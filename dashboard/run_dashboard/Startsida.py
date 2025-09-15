import streamlit as st

def layout():
    st.set_page_config(
    page_title="HR Analytics", 
    page_icon="📊", 
        )
    st.title("HR Analytics")
    st.markdown("---")
    st.markdown("""
        *Denna sida är utformad för att ge dig som rekryteringsspecialist en snabb och datadriven insikt i arbetsmarknaden. Här hittar du tre dedikerade dashboards, en för varje huvudområde: Säkerhet och Bevakning, Data och IT samt Yrken med Social Inriktning.*

        Syftet med sidan är att effektivisera arbetet genom visualisering av var behoven är störst och vilka kompetenser som efterfrågas mest. 

        ### 📊 KPI:er
        
        #### 1. Antal Lediga Jobb efter Område
        Detta stapeldiagram visar yrkesområden med flest lediga jobb. Det hjälper dig att snabbt se var efterfrågan är som störst.

        #### 2. Antal Annonser per Region
        En interaktiv karta över Sverige visualierar antalet jobbannonser per region.

        #### 3. Mest Efterfrågade Färdigheter
        Denna lista visar de fem mest frekventa färdigheterna som nämns i företagens jobbannonser.
        """)


if __name__ == "__main__":
    layout()