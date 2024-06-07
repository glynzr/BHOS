import pandas as pd
import numpy as np

# 1. Write a Pandas program to split the following dataframe by school code and get mean, min, and max value of age for each school.
# Test Data:
#    school class            name date_Of_Birth   age  height  weight  address
# S1   s001     V  Alberto Franco     15/05/2002   12    173      35  street1
# S2   s002     V    Gino Mcneill     17/05/2002   12    192      32  street2
# S3   s003    VI     Ryan Parkes     16/02/1999   13    186      33  street3
# S4   s001    VI    Eesha Hinton     25/09/1998   13    167      30  street1
# S5   s002     V    Gino Mcneill     11/05/2002   14    151      31  street2
# S6   s004    VI    David Parkes     15/09/1997   12    159      32  street4

# myindex=['S1','S2','S3','S4','S5','S6']
# mycolumns=['school','class','name','date_Of_Birth','age','height','weight','address']
# mydata=[['s001','V','Alberto Franco','15/05/2002',12,173,35,'street1'],
#         ['s002','V','Gino Mcneill','17/05/2002',12,192,32,'street2'],
#         ['s003','VI','Ryan Parkes','16/02/1999',13,186,33,'street3'],
#         ['s001','VI','Eesha Hinton','25/09/1998',13,167,30,'street1'],
#         ['s002','V','Gino Mcneill','11/05/2002',14,151,31,'street2'],
#         ['s004','VI','David Parkes','15/09/1997',12,159,32,'street4']
#         ]

# df=pd.DataFrame(index=myindex,columns=mycolumns,data=mydata)
# print(df)
# print(df.groupby('school')['age'].mean())
# print(df.groupby('school').describe()['age'])


# 2. Write a Pandas program to split the following dataframe into groups based on customer id and create a list of order date for each group.
# Test Data:
#     ord_no  purch_amt    ord_date  customer_id  salesman_id
# 0    70001     150.50  2012-10-05         3005         5002
# 1    70009     270.65  2012-09-10         3001         5005
# 2    70002      65.26  2012-10-05         3002         5001
# 3    70004     110.50  2012-08-17         3009         5003
# 4    70007     948.50  2012-09-10         3005         5002
# 5    70005    2400.60  2012-07-27         3007         5001
# 6    70008    5760.00  2012-09-10         3002         5001
# 7    70010    1983.43  2012-10-10         3004         5006
# 8    70003    2480.40  2012-10-10         3009         5003
# 9    70012     250.45  2012-06-27         3008         5002
# 10   70011      75.29  2012-08-17         3003         5007
# 11   70013    3045.60  2012-04-25         3002         5001
# myindex=np.arange(0,12,1)
# mycolumns=['ord_no','purch_amt','ord_date','customer_id','salesman_id']
# mydata=[
#     [70001,150.50,'2012-10-05',3005,5002],
#     [70009,270.65,'2012-09-10',3001,5005],
#     [70002,65.26,'2012-10-05',3002,5001],
#     [70004,110.50,'2012-08-17',3009,5003],
#     [70007,948.50,'2012-09-10',3005,5002],
#     [70005,2400.60,'2012-07-27',3007,5001],
#     [70008,5760.00,'2012-09-10',3002,5001],
#     [70010,1983.43,'2012-10-10',3004,5006],
#     [70003,2480.40,'2012-10-10',3009,5003],
#     [70012,250.45,'2012-06-27',3008,5002],
#     [70011,75.29,'2012-08-17',3003,5007],
#     [70013,3045.60,'2012-04-25',3002,5001]]


# df=pd.DataFrame(index=myindex,columns=mycolumns,data=mydata)
# print(df.groupby('customer_id')['ord_date'].apply(list))


# 3. Write a Pandas program to join the two given dataframes along columns and assign all data.
# Test Data:
# student_data1:
#   student_id              name  marks
# 0         S1  Danniella Fenton    200
# 1         S2      Ryder Storey    210
# 2         S3      Bryce Jensen    190
# 3         S4         Ed Bernal    222
# 4         S5       Kwame Morin    199
# student_data2:
#   student_id              name  marks
# 0         S4  Scarlette Fisher    201
# 1         S5  Carla Williamson    200
# 2         S6       Dante Morse    198
# 3         S7    Kaiser William    219
# 4         S8   Madeeha Preston    201

# myindex=np.arange(0,5,1)
# mycolumns=['student_id','name','marks']
# data1=[
#     ['S1','Danniella Fenton',200],
#     ['S2','Ryder Storey',210],
#     ['S3','Bryce Jensen',190],
#     ['S4','Ed Bernal',222],
#     ['S5','Kwame Morin',199]
# ]

# data2=[
#     ['S4','Scarlette Fisher',201],
#     ['S5','Carla Williamson',200],
#     ['S6','Dante Morse ',198],
#     ['S7','Kaiser William',219],
#     ['S8','Madeeha Preston',201]
# ]

# df1=pd.DataFrame(index=myindex,columns=mycolumns,data=data1)
# df2=pd.DataFrame(index=myindex,columns=mycolumns,data=data2)

# print(df1)
# print(df2)

# result=pd.merge(df1,df2,how='left',on='student_id')
# print(result)


# 4. Write a Pandas program to find and replace the missing values in a given DataFrame which do not have any valuable information.
# Test Data:
#    ord_no purch_amt    ord_date customer_id salesman_id
# 0   70001     150.5           ?        3002        5002
# 1     NaN    270.65  2012-09-10        3001        5003
# 2   70002     65.26         NaN        3001           ?
# 3   70004     110.5  2012-08-17        3003        5001
# 4     NaN     948.5  2012-09-10        3002         NaN
# 5   70005    2400.6  2012-07-27        3001        5002
# 6      --      5760  2012-09-10        3001        5001
# 7   70010         ?  2012-10-10        3004           ?
# 8   70003     12.43  2012-10-10          --        5003
# 9   70012    2480.4  2012-06-27        3002        5002
# 10    NaN    250.45  2012-08-17        3001        5003
# 11  70013    3045.6  2012-04-25        3001          --

# test_data = [
#     [70001, 150.5, '?', 3002, 5002],
#     [np.nan, 270.65, '2012-09-10', 3001, 5003],
#     [70002, 65.26, np.nan, 3001, '?'],
#     [70004, 110.5, '2012-08-17', 3003, 5001],
#     [np.nan, 948.5, '2012-09-10', 3002, np.nan],
#     [70005, 2400.6, '2012-07-27', 3001, 5002],
#     ['--', 5760, '2012-09-10', 3001, 5001],
#     [70010, '?', '2012-10-10', 3004, '?'],
#     [70003, 12.43, '2012-10-10', '--', 5003],
#     [70012, 2480.4, '2012-06-27', 3002, 5002],
#     [np.nan, 250.45, '2012-08-17', 3001, 5003],
#     [70013, 3045.6, '2012-04-25', 3001, '--']
# ]
# myindex=np.arange(0,12,1)
# mycolumns=['ord_no','purch_amt','ord_date','customer_id','salesman_id']
# df=pd.DataFrame(index=myindex,columns=mycolumns,data=test_data)
# df['ord_no'].replace([np.nan,'--'],0,inplace=True)

# df['purch_amt'].replace(['?','--'],0,inplace=True)
# df['ord_date'].replace(['?',np.nan,'--'],'No data',inplace=True)
# df['customer_id'].replace(['?',np.nan,'--'],'No data',inplace=True)
# df['salesman_id'].replace(['?',np.nan,'--'],'No data',inplace=True)
# print(df)


# 5. Write a Pandas program to find and drop the missing values from World alcohol consumption dataset.
# df=pd.read_csv('/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-3/CLASS-ASSIGMENTS/world_alcohol.csv')
# df.dropna(inplace=True)
# print(df)

#6. Write a Pandas program to find out the alcohol consumption details in the year '1986' or '1989' where WHO region is 'Americas' or 'Europe' from the world alcohol consumption dataset.
df=pd.read_csv('/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-3/CLASS-ASSIGMENTS/world_alcohol.csv')
df.dropna(inplace=True)
print(df)

for x in df:
    print(x)