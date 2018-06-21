import numpy as np
import cython
from libc.math cimport sqrt, exp
from cython.parallel import prange
cimport openmp
import timeit

@cython.boundscheck(False)
@cython.wraparound(False)
def array_double(long N, long M):
	# cdef int num_threads = openmp.omp_get_num_procs()
	# num_threads = max(2, num_threads//2)
	# openmp.omp_set_dynamic(0)
	openmp.omp_set_num_threads(24)
	cdef long i, j
	cdef double [:, :] inp
	cdef double [:, :] out
	# inp = np.random.rand(N*M).reshape((N, M))
	inp = np.ones((N, M))
	# out = np.zeros((N, M))
	out = np.empty((N, M))

	start = timeit.default_timer()
	with nogil:
		for i in prange(N, schedule='guided'):
			for j in range(M):
				out[i, j] = sqrt(exp(-sqrt(inp[i, j]*(i+j)))) * sqrt(exp(-sqrt(inp[i, j]*(i+j))))

	# for i in range(N):
	# 	print(out[i, 0])

	stop = timeit.default_timer()
	print(stop - start)
