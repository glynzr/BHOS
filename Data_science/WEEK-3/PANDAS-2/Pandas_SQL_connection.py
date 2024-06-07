# CONNECTION TO MYSQL DATABASE --------------------------------------------------
# Method-1 ----------------------------------------------------------------------
'''
import mysql.connector as connection
import pandas as pd

try:
    mydb = connection.connect(host="localhost", database = 'azerbaijandb', user="root", passwd="root", use_pure=True)
    query = "Select * from administrative_divisions;"
    result_dataFrame = pd.read_sql(query, mydb)
    print(result_dataFrame)  # print results as Pandas DataFrame
    result_dataFrame.to_csv('data_to_csv.csv')  # converting DataFrame to CSV format
    mydb.close()  # closing the database safely
except Exception as e:
    mydb.close()
    print(str(e))
'''

# Method-2 ----------------------------------------------------------------------
# pip install pandas
# pip install sqlalchemy
# pip install mysql-python
# pip install mysqlclient

# import pandas as pd 
# from sqlalchemy import create_engine, text

# my_conn = create_engine("mysql+mysqldb://root:root@localhost/azerbaijandb")

# reading all data
#my_data = pd.read_sql("SELECT * FROM administrative_divisions", my_conn)

# giving specific data
# query="SELECT * FROM administrative_divisions WHERE region='Aran'"
# my_data = pd.read_sql(query, my_conn)
# print(my_data)


# JSON format
import numpy as np
import pandas as pd

df = pd.read_json('students.json')

print(df.to_string()) ## Use to_string() to print the entire DataFrame.

# READING FROM API --------------------------------------------------------------
# url = "https://jsonplaceholder.typicode.com/todos"
# df = pd.read_json(url)
# print(df.to_string())
