# import matplotlib.pyplot as plt
# import numpy as np

# # x=np.arange(0,7)
# # y=x**2

# # plt.plot(x,y,marker='o',ls=':')
# # plt.xlabel('X')
# # plt.ylabel('Y')
# # plt.title('Title')
# # plt.grid()
# # plt.show()

# # #plot 1:
# # x = np.array([0, 1, 2, 3])
# # y = np.array([3, 8, 1, 10])
# # plt.subplot(1,2,1)
# # plt.plot(x,y)
# # plt.xlabel('X-1')
# # plt.ylabel('Y-1')
# # plt.title('1')



# # #plot 2:
# # x = np.array([0, 1, 2, 3])
# # y = np.array([10, 20, 30, 40])
# # plt.subplot(1,2,2)
# # plt.plot(x,y)
# # plt.xlabel('X-2')
# # plt.ylabel('Y-2')
# # plt.title('2')

# # plt.suptitle('AAAA')
# # plt.show()

# # x = np.array([5,7,8,7,2,17,2,9,4,11,12,9,6])
# # y = np.array([99,86,87,88,111,86,103,87,94,78,77,85,86])

# # plt.scatter(x, y)
# # plt.colorbar()
# # plt.show()


# # x = np.array(["A", "B", "C", "D"])
# # y = np.array([3, 8, 1, 10])

# # # plt.bar(x,y,color='red',width=0.5)
# # # plt.show()

# # plt.barh(x,y,color='orange',height=0.2)
# # plt.show()


# # x = np.random.normal(170, 10, 250)
# # plt.hist(x)
# # plt.show()

# y = np.array([35, 25, 25, 15])
# labels=['one','two','three','foour']
# plt.pie(y,labels=labels)
# plt.legend()
# plt.show()



import matplotlib.pyplot as plt
import numpy as np
# x=np.array([1,2,3,4,5,6])
# y=x**2
# plt.plot(x,y,label='y=x**2',marker='p')

# plt.title('Plot')
# plt.xlabel('X')
# plt.ylabel('Y')
# plt.legend()
# plt.show()


# x=np.array([1,2,3,4,5,6])
# y=x**2
# plt.subplot(1,2,1)
# plt.plot(x,y,label='y=x**2')
# plt.title('First')


# x=np.array([1,2,3,4,5,6])
# y=x
# plt.subplot(1,2,2)
# plt.plot(x,y,label='y=x')
# plt.title('Second')
# plt.show()


# x=np.array([1,2,3,4,5,6])
# y=x**2
# fig=plt.figure()
# ax1=fig.add_subplot(1,1,1)
# ax1.plot(x,y)

# x=np.array([1,2,3,4,5,6])
# y=x
# ax2=fig.add_subplot(3,2,1)
# ax2.plot(x,y)

# plt.show()

# fig=plt.figure()

# x=np.array([1,2,3,4,5,6])
# y=x**2
# axes1=fig.add_axes([0.1,0.1,0.8,0.8])
# axes1.plot(x,y)

# x=np.array([1,2,3,4,5,6])
# y=x
# axes2=fig.add_axes([0.2,0.5,0.3,0.3])
# axes2.plot(x,y)

# plt.show()

x=np.array([1,2,3,4,5,6])
y=x**2
plt.plot(x,y,label='y=x**2')
x=np.array([1,2,3,4,5,6])
y=x
plt.plot(x,y,label='y=x')
plt.legend()
plt.show()