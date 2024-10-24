import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


# majors = ['IT', 'Process Automation', 'Chemical Engineering', 'Mathematics']
# students = [70, 120, 200, 95]

# plt.bar(majors,students,label='Bar chart',width=0.3)
# plt.xlabel('Majors')
# plt.ylabel('Students')
# plt.xticks(rotation=45,ha='right')
# plt.legend()
# plt.show()


# cities = ['Qax','Mingechaur','Sumgayit','Shaki']

# population_old = [13000,70000,300000,60000]
# population_now = [13800,105000,330000,65000]

# position=np.arange(len(cities))

# plt.barh(position-0.2,population_old,label='Old population',color='red',height=0.4)
# plt.barh(position+0.2,population_now,color='blue',label='New population',height=0.4)
# plt.yticks(position,cities)
# plt.legend()
# plt.show()

# position=np.arange(len(cities))
# plt.bar(position-0.2,population_old,label='Old',width=0.4)
# plt.bar(position+0.2,population_now,width=0.4,label='New')
# plt.xticks(position,cities)
# plt.legend()
# plt.show()




# math_marks = [88, 92, 80, 89, 100, 80, 60, 100, 80, 34]
# science_marks = [35, 79, 79, 48, 100, 88, 32, 45, 20, 30]
# marks_range = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

# plt.scatter(marks_range,math_marks,color='green',label='math')
# plt.scatter(marks_range,science_marks,color='red',label='science')
# plt.legend()
# plt.show()

# data = np.random.randint(low = 1, high = 50, size = (10, 10))
# plt.imshow(data)
# plt.show()


files = [
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-01-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-02-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-03-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-04-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-05-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-06-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-07-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-08-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-09-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-10-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-11-metropolitan-street.csv',
  '/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/2020-12-metropolitan-street.csv'
]

# df_list=[]
# for i in files:
#     df_list.append(pd.read_csv(i))

# merged_df=pd.concat(df_list)
# print(merged_df.head())


# monthly_counts = merged_df.groupby('Month').size()
# monthly_counts.plot(kind='line',color='red')
# monthly_counts.plot(kind='bar',color='blue')
# plt.show()

df=pd.read_excel('/Users/gulaynazarova/Desktop/BHOS/Data_science/WEEK-5/DATA-VISUALISATION/data/temperature.xlsx')
print(df)