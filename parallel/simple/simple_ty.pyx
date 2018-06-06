import numpy as np
import cython
from libc.math cimport sqrt
import timeit


@cython.boundscheck(False)
@cython.wraparound(False)
def array_double(long N, long M):
	start = timeit.default_timer()
	cdef long i, j
	cdef double [:, :] inp
	cdef double [:, :] out
	inp = np.random.rand(N*M).reshape((N, M))
	out = np.zeros((N, M))
	
	start = timeit.default_timer()
	for i in range(N):
		for j in range(M):
			out[i, j] = sqrt(inp[i, j])

	stop = timeit.default_timer()
	print(stop - start)
	