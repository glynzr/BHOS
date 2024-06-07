import numpy as np
arr=np.array([1,2,3,4,5])
print(arr)
print(arr.ndim)

arr5=np.array([1,2,3,4,5],ndmin=5)
print(arr5)

arrx=np.array([1,2,3,4,5],dtype=int)
print(arrx)

arry=arrx.astype(float)
print(arry)


arra=np.arange(0,10,2)
print(arra)


arrl=np.linspace(0,10,11,dtype=int)
print(arrl)


arrz=np.zeros((2,3,1),dtype=int)
print(arrz)

arro=np.ones((1,2,3),dtype=int)
print(arro)

arri=np.eye(3,dtype=int)
print(arri)


np.random.seed(10)
arr_r1=np.random.rand(2)
print(arr_r1)

arr_r2=np.random.randint(10,100,(2,3))
print(arr_r2)

arr_r3=np.random.randn(2,4)
print(arr_r3)

print(arr_r3.shape)

newarr=arr_r3.reshape(1,2,4)
print(newarr.shape)


arrs=np.arange(0,15,3)
print(arrs.min())
print(arrs.max())

print(arrs.argmax())
print(arrs.argmin())

arr=np.array([1,2,3,4,5,6,7,8,9])
condlist=[arr<4,arr>6]
choicelist=[arr**2,arr*10]
print(np.select(condlist,choicelist,arr))

print(arr[arr%2==0])


for x in np.nditer(arr_r2):
    print(x)

for idx,x in np.ndenumerate(arr_r2):
    print(idx,x)


