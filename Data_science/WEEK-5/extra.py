import pandas  as pd
import numpy as np
import matplotlib.pyplot as plt

x=np.arange(0,60,10)
y=x*2
plt.plot(x,y)
plt.title('Draw a line')
plt.xlabel('x-axis')
plt.ylabel('y-axis')
plt.show()