# TASK 6

import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv(r'C:\Users\User\OneDrive\Masaüstü\Elvina_Aliyeva_Quiz_Var_A\task_6.csv')
print(df.columns)
df.plot(x=0, y=[2,3], kind='bar')

plt.title('Male and Female Results')
plt.xlabel('Country')

plt.ylabel('Number of Students')


plt.show()


# TASK 7

import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv(r'C:\Users\User\OneDrive\Masaüstü\Elvina_Aliyeva_Quiz_Var_A\task_7.csv')

plt.figure(figsize=(10, 6)) 

plt.bar(df['year'], df['total_students'], color='blue', label='Total Students')
plt.bar(df['year'], df['total_international_students'], color='orange', label='Total International Students')

plt.xlabel('Academic Year')
plt.ylabel('Number of Students')
plt.title('Total Number of Students and International Students by Academic Year')
plt.xticks(rotation=45) 
plt.legend()
plt.tight_layout()

plt.show()
