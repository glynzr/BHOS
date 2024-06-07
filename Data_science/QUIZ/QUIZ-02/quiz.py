import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# task 7
df=pd.read_csv('task7.csv')
positions=np.arange(len(df.year))
plt.bar(positions-0.2,df.total_stud,color='blue',label='Total students',width=0.3)
plt.bar(positions+0.2,df.total_int_stud,color='red',label='Total international students',width=0.3)
plt.legend()
plt.xticks(positions,df.year)
plt.title('Task 7')
plt.xlabel('Years')
plt.ylabel('Students')
plt.show()

# Create horizontal bar chart
positions=np.arange(len(df.year))
# plt.barh(positions-0.2, df.total_stud, color='blue', label='Total students',height=0.3)
# plt.barh(positions+0.2, df.total_int_stud, color='red', label='Total international students',height=0.3)  # Stack bars on the right of total students
# plt.legend()
# plt.yticks(positions,df.year)
# plt.title('Task 7')
# plt.xlabel('Students')
# plt.ylabel('Years')
# plt.show()

#task 6
# df=pd.read_csv('task6.csv')
# plt.bar(df.country_name,df.female,color='red',label='Female students')
# plt.bar(df.country_name,df.male,color='blue',label='Male students')
# plt.xticks(rotation=45,ha='right')
# plt.legend()
# plt.title('Task 6')
# plt.xlabel('Countries')
# plt.ylabel('Students')
# plt.show()

