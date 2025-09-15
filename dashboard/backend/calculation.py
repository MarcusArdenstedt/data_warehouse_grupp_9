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