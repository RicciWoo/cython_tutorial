import numpy as np
import cython
from libc.math cimport sqrt, exp
# from cython.parallel import prange
# cimport openmp
import timeit

@cython.boundscheck(False)
@cython.wraparound(False)
def array_double(long N, long M):
# def array_double(long N, long M, int num_threads):
	cdef:
		long i, j, k
		double cnt = 0.0, *cnt_ptr = &cnt
		double var[3]
		double summ
		double res = 0.0, *res_ptr = &res
		double[:, :] inp = np.ones((N, M))
		double[:, :] out = np.empty((N, M))
		# openmp.omp_lock_t lock
	
	# if num_threads != 0:
	# 	openmp.omp_set_dynamic(0)
	# 	openmp.omp_set_num_threads(num_threads)
	start = timeit.default_timer()
	with nogil:
		# openmp.omp_init_lock(&lock)
		for i in range(N):
		# for i in prange(N, schedule='dynamic'):
			for j in range(M):
				out[i, j] = sqrt(exp(-sqrt(inp[i, j]*(i+j)))) * sqrt(exp(-sqrt(inp[i, j]*(i+j))))
				# openmp.omp_set_lock(&lock)
				cnt += 1
				# cnt_ptr[0] = cnt_ptr[0] + 1
				# openmp.omp_unset_lock(&lock)
				for k in range(3):
					var[k] = M
				summ = 0
				for k in range(3):
					summ += var[k]
					# summ = summ + var[k]
				res += summ
				# res_ptr[0] = res_ptr[0] + summ
		# openmp.omp_destroy_lock(&lock)
	stop = timeit.default_timer()
	print(stop - start)
	print(cnt)
	print(res)
	