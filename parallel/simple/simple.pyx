import numpy as np
def array_double(N):
	arr = np.arange(N*N*4, dtype='f4').reshape((N, N, 4))
	temp = np.zeros((4))
	for t in range(4):
		for i in range(N):
			for j in range(N):
				temp[t] = arr[i, j, t] * 2
	