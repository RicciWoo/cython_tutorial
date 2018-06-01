import numpy as np
import cython
from cython.parallel import prange
#cimport openmp

@cython.boundscheck(False)
@cython.wraparound(False)
def array_double(long N, long M):
	cdef long i, j
	cdef double [:, :] inp
	cdef double [:, :] out
	cdef double maxi = 0.0
	cdef double *temp
	#cdef openmp.omp_lock_t lock
	inp = np.arange(N*M, dtype=np.double).reshape((N, M))
	#inp[N//2, M//2] = 3.0
	out = np.zeros((N, M))
	with nogil:
		#openmp.omp_init_lock(&lock)
		for i in prange(N):
			temp = &maxi
			for j in range(M):
				out[i, j] = inp[i, j] + 1
				#openmp.omp_set_lock(&lock)
				temp[0] = temp[0] + 1
				#openmp.omp_unset_lock(&lock)
		#openmp.omp_destroy_lock(&lock)
	print(maxi)
	