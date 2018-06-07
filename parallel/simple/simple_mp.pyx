import numpy as np
import cython
from libc.math cimport sqrt, exp
from cython.parallel import prange
cimport openmp
import timeit

@cython.boundscheck(False)
@cython.wraparound(False)
def array_double(long N, long M):
	openmp.omp_set_num_threads(1)
	cdef long i, j
	cdef double [:, :] inp
	cdef double [:, :] out
	# inp = np.random.rand(N*M).reshape((N, M))
	inp = np.ones((N, M))
	out = np.zeros((N, M))

	start = timeit.default_timer()
	with nogil:
		for i in prange(N, schedule='guided'):
			for j in range(M):
				out[i, j] = sqrt(exp(-sqrt(inp[i, j]/2.))) * sqrt(exp(-sqrt(inp[i, j])))

	stop = timeit.default_timer()
	print(stop - start)
