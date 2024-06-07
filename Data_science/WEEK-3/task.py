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
#         ['s004','VI','David Parkes','15/09/1997',12,159,32,'street4']]

# df=pd.DataFrame(index=myindex,columns=mycolumns,data=mydata)
# print(df.groupby('school').describe())


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

myindex=np.arange(0,12,1)
mycolumns=['ord_no','purch_amt','ord_date','customer_id','salesman_id']
mydata=[
    [70001,150.50,'2012-10-05',3005,5002],
    [70009,270.65,'2012-09-10',3001,5005],
    [70002,65.26,'2012-10-05',3002,5001],
    [70004,110.50,'2012-08-17',3009,5003],
    [70007,948.50,'2012-09-10',3005,5002],
    [70005,2400.60,'2012-07-27',3007,5001],
    [70008,5760.00,'2012-09-10',3002,5001],
    [70010,1983.43,'2012-10-10',3004,5006],
    [70003,2480.40,'2012-10-10',3009,5003],
    [70012,250.45,'2012-06-27',3008,5002],
    [70011,75.29,'2012-08-17',3003,5007],
    [70013,3045.60,'2012-04-25',3002,5001]]

df=pd.DataFrame(data=mydata,index=myindex,columns=mycolumns)
print(df.groupby('customer_id')['ord_date'].apply(list))