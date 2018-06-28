import numpy as np
import cython
from libc.math cimport sqrt, exp
from cython.parallel import prange
cimport openmp
import timeit

@cython.boundscheck(False)
@cython.wraparound(False)

cdef void parallel_run(long M, long i, double[:,:] inp, 
				double[:,:] out, double* temp) nogil:
	cdef long j
	cdef double var[3]
	for j in range(M):
		var[0] = sqrt(exp(-sqrt(inp[i, j]*(i+j))))
		out[i, j] = var[0] * var[0]
		# maxi = maxi + 1
		temp[0] = temp[0] + 1

def array_double(long N, long M):
	cdef long i
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
			openmp.omp_set_lock(&lock)
			parallel_run(M, i, inp, out, temp)
			openmp.omp_unset_lock(&lock)
		openmp.omp_destroy_lock(&lock)
	stop = timeit.default_timer()
	print(stop - start)
	print(maxi)
	