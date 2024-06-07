import pandas as pd
import numpy as np

def last(n):
    return n%10

df=pd.read_csv('./FILES/biostats.csv')
print(df['Weight (lbs)'].apply(last))


