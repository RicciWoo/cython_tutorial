import numpy as np
import cython
from libc.math cimport sqrt, exp
from cython.parallel import prange
cimport openmp
import timeit

@cython.boundscheck(False)
@cython.wraparound(False)

cdef void loc_fun(double[:, :] inp, double[:, :] out, long i,
				long M, double *cnt_ptr, double *res_ptr) nogil:
	cdef:
		long j, k
		double summ
		double var[3]
		openmp.omp_lock_t lock
		openmp.omp_init_lock(&lock)
	for j in range(M):
		out[i, j] = sqrt(exp(-sqrt(inp[i, j]*(i+j)))) * sqrt(exp(-sqrt(inp[i, j]*(i+j))))
		for k in range(3):
			var[k] = M
		summ = 0
		for k in range(3):
			# summ += var[k]
			summ = summ + var[k]
		openmp.omp_set_lock(&lock)
		# cnt += 1
		cnt_ptr[0] = cnt_ptr[0] + 1
		# res += summ
		res_ptr[0] = res_ptr[0] + summ
		openmp.omp_unset_lock(&lock)
	openmp.omp_destroy_lock(&lock)

# def array_double(long N, long M):
def array_double(long N, long M, int num_threads=0):
	cdef:
		long i
		double cnt = 0.0, *cnt_ptr = &cnt
		double res = 0.0, *res_ptr = &res
		double[:, :] inp = np.ones((N, M))
		double[:, :] out = np.empty((N, M))
		# openmp.omp_lock_t lock
	
	if num_threads != 0:
		openmp.omp_set_dynamic(0)
		openmp.omp_set_num_threads(num_threads)
	start = timeit.default_timer()
	with nogil:
		# openmp.omp_init_lock(&lock)
		# for i in range(N):
		for i in prange(N, schedule='dynamic'):
			loc_fun(inp, out, i, M, cnt_ptr, res_ptr)
		# openmp.omp_destroy_lock(&lock)
	stop = timeit.default_timer()
	print(stop - start)
	print(cnt)
	print(res)
	