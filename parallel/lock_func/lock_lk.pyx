import numpy as np
import cython
from libc.math cimport sqrt, exp
from cython.parallel import prange
cimport openmp
import timeit

@cython.boundscheck(False)
@cython.wraparound(False)
def array_double(long N, long M):
	cdef long i, j
	cdef double [:, :] inp
	cdef double [:, :] out
	cdef double maxi = 0.0
	cdef double *temp = &maxi
	cdef openmp.omp_lock_t lock
	# inp = np.arange(N*M, dtype=np.double).reshape((N, M))
	inp = np.ones((N, M))
	# out = np.zeros((N, M))
	out = np.empty((N, M))
	
	start = timeit.default_timer()
	with nogil:
		openmp.omp_init_lock(&lock)
		for i in prange(N):
			# maxi = i
			openmp.omp_set_lock(&lock)
			for j in range(M):
				out[i, j] = sqrt(exp(-sqrt(inp[i, j]*(i+j)))) * sqrt(exp(-sqrt(inp[i, j]*(i+j))))
				# maxi = maxi + 1
				temp[0] = temp[0] + 1
			openmp.omp_unset_lock(&lock)
		openmp.omp_destroy_lock(&lock)
	stop = timeit.default_timer()
	print(stop - start)
	print(maxi)
	