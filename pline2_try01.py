import pandas as pd
import requests
def extract_data():
    address = "https://raw.githubusercontent.com/cloudacademy/ca-sample-sales-data/master/sales.json"
    response = requests.get(address)
    e_data=response.json()
    return pd.dataframe(e_data)


def transform_data(df):
    df=df[df['amount']>0]
    df['date']=pd.to_datetime(df['date'])
    return df


def load_data(df):
    df.to_csv('processed_data.csv', index=false)
    print('Data has been loaded successfully!')


def run_pipeline():
    rawdata=extract_data()
    transformed_data=transform_data(rawdata)
    load_data(transformed_data)
if __name__=="__main__":
    run_pipeline()