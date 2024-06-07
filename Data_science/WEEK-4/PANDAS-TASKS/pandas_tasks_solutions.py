# Convert API Response to Pandas Dataframe - Python -------------------------------------------------------

# 1. How to convert an API response to a Pandas DataFrame using the Python requests module
# Here's simple example using a JSON weather API data:

import requests
import pandas as pd

url = "https://archive-api.open-meteo.com/v1/era5?latitude=52.52" +\
      "&longitude=13.41&start_date=2021-01-01&end_date=2021-12-31&hourly=temperature_2m"

response = requests.get(url)
data = response.json()
data_all = pd.DataFrame(data)
print(data_all.transpose())

# OUTPUT : -----------------------------------------------------------------------
#                 latitude  ...                                             hourly
# time            52.54833  ...  [2021-01-01T00:00, 2021-01-01T01:00, 2021-01-0...
# temperature_2m  52.54833  ...  [0.6, 0.6, 0.2, 0.7, 0.8, 0.2, -0.7, -0.1, 0.3...

# [2 rows x 9 columns]

# Example 2 : Will return all cats ------------------------------------------------------------------------
# url = https://cataas.com//api/cats?tags=tag1,tag2&skip=0&limit=10
'''
url = "https://archive-api.open-meteo.com/v1/era5?latitude=52.52&longitude=13.41&start_date=2021-12-30&end_date=2021-12-31&hourly=temperature_2m"
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    #print(data)
else:
    print("Request failed with status code:", response.status_code)
'''

# What if you need to expand nested API data and plot it to a time series plot. As we saw there is hourly data 
# for the temperature which is nested(you can also check the image at the start).
# To expand nested data with Pandas we can use method pd.Series - this will convert nested data to Pandas Series:

# timeSeries = pd.DataFrame(data)['hourly'].apply(pd.Series)
# print(timeSeries)

# OUTPUT : ----------------------------------------------
#                               0   ...                47
# time            2021-12-30T00:00  ...  2021-12-31T23:00
# temperature_2m               3.6  ...              10.9

# [2 rows x 48 columns]

# We can PLOT the data
# myPlot = pd.DataFrame(data)['hourly'].apply(pd.Series).T.set_index('time').plot()
# print(myPlot)


# If we get error like: ------------------------------------------------------------------------------------
#     {'message': 'Too Many Requests', 'error': 429}
# Then we can add headers to the request in order to solve it. The simplest solution is by adding user agent:
'''
url = "https://www.reddit.com/r/Python/comments/21q40a/why_is_pandas_so_hard/.json"
headers= {'User-agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.3'}

response = requests.get(url, headers = headers)
data = response.json()
print(data)
'''

# METHOD-2 : Easily read API with read_json -----------------------------------------------------------------
# url = "https://archive-api.open-meteo.com/v1/era5?latitude=52.52&longitude=13.41&start_date=2021-12-30&end_date=2021-12-31&hourly=temperature_2m"

# df = pd.read_json(url)
# print(df.head())


# READING JSON FILES ---------------------------------------------------------------------------------------
# METHOD-1 -------------------------------------------------------------------------------------------------
'''
import json

with open('books.json') as f:
    data = json.load(f)

# Use pd.json_normalize to convert the JSON to a DataFrame
df = pd.json_normalize(data['books'], 
                     meta=['title', ['author', 'first_name'], ['author', 'last_name'], ['publisher', 'name'], ['publisher', 'location']])

# Rename the columns for clarity
df.columns = ['Title', 'Author_First_Name', 'Author_Last_Name', 'Publisher_Name', 'Publisher_Location']

# Display the DataFrame
print(df)
'''

# METHOD-2 -------------------------------------------------------------------------------------------------
'''
import numpy as np

data = pd.read_json('books.json')
#print(data.to_string()) ## Use to_string() to print the entire DataFrame.
# Use pd.json_normalize to convert the JSON to a DataFrame
df = pd.json_normalize(data['books'], 
                     meta=['title', ['author', 'first_name'], ['author', 'last_name'], ['publisher', 'name'], ['publisher', 'location']])
# Rename the columns for clarity
df.columns = ['Title', 'Author_First_Name', 'Author_Last_Name', 'Publisher_Name', 'Publisher_Location']
# Display the DataFrame
print(df)
'''
# NOTE: pandas.json_normalize() - Normalize semi-structured JSON data into a flat table.

# ------------------------------------------------------------------------------
# TASK : - try to get 'cities' or 'currencies' in JSON or CSV format
#        - convert all data to Pandas dataframe
#        - group them by different category
#        - add filters: like cities in Europe or Asia (and)