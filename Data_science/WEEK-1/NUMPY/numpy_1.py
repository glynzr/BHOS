# NUMPY ------------------------------------------------------------------------------------------------------
import numpy as np

# creating python list
mylist = [1, 2, 3, 4, 5]
print(type(mylist))  # displying typeof mylist

# creating numpy array from standard python list
myarr = np.array(mylist)
print(type(myarr))

# creating 2 dimentional list
my_matrix = [[1,2,3], [4,5,6], [7,8,9]]
mymatrix = np.array(my_matrix)  # converting list to numpy matrix
print(mymatrix)

# creating numpy array. Built in function: numpy.arange([start, ]stop, [step, ]dtype=None, *, like=None)
# arange(stop): Values are generated within the half-open interval [0, stop) (in other words, the interval including start but excluding stop).
# arange(start, stop): Values are generated within the half-open interval [start, stop).
# arange(start, stop, step) Values are generated within the half-open interval [start, stop), with spacing between values given by step.
my_matrix_2 = np.arange(0, 101, 20)
print(my_matrix_2)

# np.arange(-3, 3, 0.5, dtype=int)
# array([-3, -2, -1,  0,  1,  2,  3,  4,  5,  6,  7,  8])

# creating 0 based arrays: zeros(n)
myarr_2 = np.zeros(5) # 1 dimentional array. by default it is float based
print(myarr_2)

myarr_3 = np.ones((5, 5)) # 2 dimentional array(matrix)
myarr_3 = np.ones((2, 5)) # 2 is rows, 5 is columns
print(myarr_3)

# Creating numpy arrays: with evenly spaced values. 
# 0 : is starting point
# 10: is stopping point
# 3 : 3 evely spaced number
myarr_4 = np.linspace(0, 10, 3)

# RANDONLY DISTRIBUTED NUMBERS -----------------------------------------------------------------------------
# random.rand() - random numbers between 0 and 1, like uniform distribution
mynum = np.random.rand(3)
print(mynum)
mynum_2 = np.random.rand(3, 4) # 3-rows, 4-columns
print(mynum_2)

# random.randn() - standard normal distribution. Here mean is 0, and the standard deviation is 1
mynum_3 = np.random.randn(5)
mynum_3 = np.random.randn(3, 4) # 3-rows, 4-columns
print(mynum_3)

# random.randint() - retruns back whole integer numbers
mynum_4 = np.random.randint(2, 4) # between 2 and 4
mynum_4 = np.random.randint(2, 100, 8) # between 2 and 100, 8 number of elements
print(mynum_4)

# random.seed() - sets particular seed and will return back the same set every time
mynum_5 = np.random.seed(44) # 44 is arbitrary choice, you can pick any number
mynum_5 = np.random.rand(4)
print(mynum_5)
# [0.83484215 0.1047961  0.74464048 0.36050084]

# FUNCTIONS : max(), min(), argmax(), argmin()

# array shape and reshape functions
arr = np.arange(0, 100, 5)
print(arr)
print(arr.shape)
arr = arr.reshape(4, 5)
print(arr)
print(arr.shape)

#--------------------------------------------------------------------------------------------------------------
# NumPy Arrays are faster than Python Lists because of the following reasons:  
#     An array is a collection of homogeneous data-types that are stored in contiguous memory locations. On the other hand, a list in Python is a collection of heterogeneous data types stored in non-contiguous memory locations.
#     The NumPy package breaks down a task into multiple fragments and then processes all the fragments parallelly.
#     The NumPy package integrates C, C++, and Fortran codes in Python. These programming languages have very little execution time compared to Python.
# Below is a program that compares the execution time of different operations on NumPy arrays and Python Lists:

# importing required packages
import numpy
import time
  
# size of arrays and lists
size = 1000000 
  
# declaring lists
list1 = [i for i in range(size)]
list2 = [i for i in range(size)]
 
# declaring arrays
array1 = numpy.arange(size)
array2 = numpy.arange(size)
 
# Concatenation
print("\nConcatenation:")
 
# list
initialTime = time.time()
list1 = list1 + list2
 
# calculating execution time
print("Time taken by Lists :", (time.time() - initialTime), "seconds")
  
# NumPy array
initialTime = time.time()
array = numpy.concatenate((array1, array2), axis = 0)
 
# calculating execution time 
print("Time taken by NumPy Arrays :", (time.time() - initialTime), "seconds")
 
 
# Dot Product
dot = 0
print("\nDot Product:")
 
# list
initialTime = time.time()
for a, b in zip(list1, list2):
        dot = dot + (a * b)
         
# calculating execution time
print("Time taken by Lists :", (time.time() - initialTime), "seconds")
  
# NumPy array
initialTime = time.time()
array = numpy.dot(array1, array2)
 
# calculating execution time 
print("Time taken by NumPy Arrays :", (time.time() - initialTime), "seconds")

# Concatenation:
# Time taken by Lists : 0.02946329116821289 seconds
# Time taken by NumPy Arrays : 0.011709213256835938 seconds

# Dot Product:
# Time taken by Lists : 0.179551362991333 seconds
# Time taken by NumPy Arrays : 0.004144191741943359 seconds