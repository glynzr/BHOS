import numpy as np

np.random.seed(10)
arr1=np.random.randint(0,100,(10))
arr2=np.random.randint(50,150,(10))
print(arr1)
print(arr2)
print(np.setdiff1d(arr1,arr2))
print(np.intersect1d(arr1,arr2))


