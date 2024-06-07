# TASK 4

# import pandas as pd
# import matplotlib.pyplot as plt
# import numpy as np

# df = pd.read_csv('task4.csv')
# bar_width = 0.35

# r1 = np.arange(len(df['country_name']))
# r2 = [x + bar_width for x in r1]

# plt.figure(figsize=(50, 6)) 
# plt.bar(r1, df['female_students'], color='skyblue', width=bar_width, edgecolor='grey', label='Female Students')
# plt.bar(r2, df['male_students'], color='orange', width=bar_width, edgecolor='grey', label='Male Students')

# plt.xlabel('Country', fontweight='bold')
# plt.xticks([r + bar_width/2 for r in range(len(df['country_name']))], df['country_name'])
# plt.xticks(rotation=45) 
# plt.ylabel('Number of Students', fontweight='bold')

# plt.title('Number of Students by Gender and Country', fontweight='bold')

# plt.show()

# TASK 5

# import pandas as pd
# import matplotlib.pyplot as plt
# import numpy as np

# df = pd.read_csv('task5.csv')
# bar_width = 0.35

# r1 = np.arange(len(df['year']))
# r2 = [x + bar_width for x in r1]

# plt.figure(figsize=(20, 6)) 
# plt.bar(r1, df['total_students'], color='skyblue', width=bar_width, edgecolor='grey', label='Total Students')
# plt.bar(r2, df['international_students'], color='orange', width=bar_width, edgecolor='grey', label='International Students')

# plt.xlabel('Year', fontweight='bold')
# plt.xticks([r + bar_width/2 for r in range(len(df['year']))], df['year'])
# plt.xticks(rotation=45) 
# plt.ylabel('Number of Students', fontweight='bold')

# plt.show()