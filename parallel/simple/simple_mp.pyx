import numpy as np
import cython
from libc.math cimport sqrt
from cython.parallel import prange, threadsavailable
cimport openmp
import timeit

@cython.boundscheck(False)
@cython.wraparound(False)
def array_double(long N, long M):
	start = timeit.default_timer()
	# openmp.omp_set_num_threads(8)
	cdef long i, j
	cdef double [:, :] inp
	cdef double [:, :] out
	# inp = np.random.rand(N*M).reshape((N, M))
	inp = np.ones((N, M))
	out = np.zeros((N, M))
	cdef int n_thr = threadsavailable(schedule='guided')
	openmp.omp_set_num_threads(n_thr)
	with nogil:
		for i in prange(N, schedule='guided'):
			for j in range(M):
				out[i, j] = sqrt(inp[i, j])

	stop = timeit.default_timer()
	print(stop - start)
	print(n_thr)