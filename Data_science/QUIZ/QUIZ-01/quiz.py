#VARIANT A
import numpy as np
import pandas as pd
# 1. Write a NumPy program to find common values between two arrays.
# Expected Output:
# Array1: [ 0 10 20 40 60]
# Array2: [10, 30, 40]
# Common values between two arrays:
# [10 40]
arr1=np.array([0,10,20,40,60])
arr2=np.array([10,30,40])
print(np.intersect1d(arr1,arr2))


# 2. Write a NumPy program to replace the negative values in a NumPy array with 0.
# Expected Output:
# Original array:
# [-1 -4 0 2 3 4 5 -6]
# Replace the negative values of the said array with 0:
# [0 0 0 2 3 4 5 0]

arr=np.array([-1,-4, 0, 2, 3, 4, 5,-6])
print(np.select([arr<0],[0],arr))


# 5. Write a NumPy program to remove nan values from a given array.
# Sample Output:
# Original array:
# [[ 1. 2. 3.]
# [nan 0. nan]
# [ 6. 7. nan]]
# After removing nan values:
# [1. 2. 3. 0. 6. 7.]
arr=np.array([[ 1., 2. ,3.],[np.nan, 0., np.nan],[ 6., 7., np.nan]])
newarr=arr.flatten()
print(newarr[~np.isnan(newarr)])



# 9. Grab the CSV data from URL and do the following steps:
# Input: https://raw.githubusercontent.com/selva86/datasets/master/Cars93_miss.csv
# - Replace missing values in Min.Price and Max.Price columns with their respective median.
# - group data set by ‘Manufacturer’ and ‘Type’
# - Get max, min and average values for each group (‘Manufacturer’)
#9.1
df=pd.read_csv('https://raw.githubusercontent.com/selva86/datasets/master/Cars93_miss.csv')
df['Min.Price'].fillna(df['Min.Price'].mean(),inplace=True)
df['Max.Price'].fillna(df['Max.Price'].mean(),inplace=True)


#9.3
print(df.groupby('Manufacturer').describe().transpose())


#9.2
print(df.groupby(['Manufacturer','Type']).describe().transpose())



# 10. Replace both values in both diagonals of df with 0.
# Desired output:
# # 0 1 2 3 4 5 6 7 8 9
# # 0 0 46 26 44 11 62 18 70 68 0
# # 1 87 0 52 50 81 43 83 39 0 59
# # 2 47 76 0 77 73 2 2 0 14 26
# # 3 64 18 74 0 16 37 0 8 66 39
# # 4 10 18 39 98 0 0 32 6 3 29
# # 5 29 91 27 86 0 0 28 31 97 10
# # 6 37 71 70 0 4 72 0 89 12 97
# # 7 65 22 0 75 17 10 43 0 12 77
# # 8 47 0 96 55 17 83 61 85 0 86
# # 9 0 80 28 45 77 12 67 80 7 0


my=np.arange(0,10,1)
mydata=np.random.randint(0,100,(10,10))

df=pd.DataFrame(index=my,columns=my,data=mydata)

for i in range(len(df)):
    df.iat[i,i]=0
    df.iat[i,len(df)-i-1]=0
print(df)



# 8. Write a NumPy program to extract all the rows to compute the student weight from a given array
# (student information) where a specific column starts with a given character.
# Sample Output:
# Original array:
# [['01' 'V' 'Debby Pramod' '30.21']
# ['02' 'V' 'Artemiy Ellie' '29.32']
# ['03' 'V' 'Baptist Kamal' '31.0']
# ['04' 'V' 'Lavanya Davide' '30.22']
# ['05' 'V' 'Fulton Antwan' '30.21']
# ['06' 'V' 'Euanthe Sandeep' '31.0']
# ['07' 'V' 'Endzela Sanda' '32.0']
# ['08' 'V' 'Victoire Waman' '29.21']
# ['09' 'V' 'Briar Nur' '30.0']
# ['10' 'V' 'Rose Lykos' '32.0']]
# Total weight, where student name starting with E
# 63.0
# Total weight, where student name starting with D
# 30.21
arrayy=np.array([['01', 'V', 'Debby Pramod' ,30.21],
['02', 'V', 'Artemiy Ellie' ,29.32],
['03', 'V', 'Baptist Kamal' ,31.0],
['04' ,'V', 'Lavanya Davide', 30.22],
['05', 'V', 'Fulton Antwan', 30.21],
['06' ,'V' ,'Euanthe Sandeep', 31.0],
['07' ,'V' ,'Endzela Sanda' ,32.0],
['08', 'V', 'Victoire Waman' ,29.21],
['09', 'V', 'Briar Nur', 30.0],
['10', 'V', 'Rose Lykos', 32.0]])

total=0
for x in arrayy:
    if str(x[2]).startswith('E'):
        total+=float(x[3])
print(total)

for x in arrayy:
    if str(x[2]).startswith('D'):
        total+=float(x[3])
print(total)


# 7. Write a NumPy program to extract all the rows from a given array where a specific column starts
# with a given character.
# Sample Output:
# Original array:
# [['01' 'V' 'Debby Pramod']
# ['02' 'V' 'Artemiy Ellie']
# ['03' 'V' 'Baptist Kamal']
# ['04' 'V' 'Lavanya Davide']
# ['05' 'V' 'Fulton Antwan']
# ['06' 'V' 'Euanthe Sandeep']
# ['07' 'V' 'Endzela Sanda']
# ['08' 'V' 'Victoire Waman']
# ['09' 'V' 'Briar Nur']
# ['10' 'V' 'Rose Lykos']]
# Student name starting with E :
# [['06' 'V' 'Euanthe Sandeep']
# ['07' 'V' 'Endzela Sanda']]
# Student id starting with 1 :
# [['10' 'V' 'Rose Lykos']]

arrayy=np.array([['01', 'V', 'Debby Pramod' ,30.21],
['02', 'V', 'Artemiy Ellie' ,29.32],
['03', 'V', 'Baptist Kamal' ,31.0],
['04' ,'V', 'Lavanya Davide', 30.22],
['05', 'V', 'Fulton Antwan', 30.21],
['06' ,'V' ,'Euanthe Sandeep', 31.0],
['07' ,'V' ,'Endzela Sanda' ,32.0],
['08', 'V', 'Victoire Waman' ,29.21],
['09', 'V', 'Briar Nur', 30.0],
['10', 'V', 'Rose Lykos', 32.0]])



for x in arrayy:
    if str(x[2]).startswith('E'):
        print(x)


for x in arrayy:
    if str(x[0]).startswith('1'):
        print(x)



# 6. Write a NumPy program to extract all the elements of the first and fourth columns from a given
# (4x4) array.
# Sample Output:
# Original array:
# [[ 0 1 2 3]
# [ 4 5 6 7]
# [ 8 9 10 11]
# [12 13 14 15]]
# Extracted data: All the elements of the first and fourth columns
# [[ 0 3]
# [ 4 7]
# [ 8 11]
# [12 15]]


arrx=np.arange(0,16,1)
newarr=arrx.reshape(4,4)

x=np.empty((4,2),dtype=int)
i=0
for a in newarr:
    x[i]=np.array([a[0],a[3]])
    i+=1
print(x)
    




# 4. Write a NumPy program to select indices satisfying multiple conditions in a NumPy array.
# Sample array :
# a = np.array([97, 101, 105, 111, 117])
# b = np.array(['a','e','i','o','u'])
# Note: Select the elements from the second array corresponding to elements in the first array that are
# greater than 100 and less than 110
# Expected Output:
# Original arrays
# [ 97 101 105 111 117]
# ['a' 'e' 'i' 'o' 'u']
# Elements from the second array corresponding to elements in the first
# array that are greater than 100 and less than 110:
# ['e' 'i']
num = np.array([97, 101, 105, 111, 117])
alp = np.array(['a', 'e', 'i', 'o', 'u'])

print(alp[np.where((num > 100) & (num < 110))])


# 3. Write a NumPy program to remove all rows in a NumPy array that contain non-numeric values.
# Expected Output:
# Original array:
# [[ 1. 2. 3.]
# [ 4. 5. nan]
# [ 7. 8. 9.]
# [ 1. 0. 1.]]
# Remove all non-numeric elements of the said array
# [[ 1. 2. 3.]
# [ 7. 8. 9.]
# [ 1. 0. 1.]]
array = np.array([
    [1., 2., 3.],
    [4., 5., np.nan],
    [7., 8., 9.],
    [1., 0., 1.]
])
# Remove rows containing non-numeric values
numeric_array = array[np.logical_not(np.isnan(array).any(axis=1))]

print("Array after removing rows containing non-numeric values:")
print(numeric_array)