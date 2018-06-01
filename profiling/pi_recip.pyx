# encoding: utf-8
# cython: profile=True
# filename: pi_recip.pyx

# cdef inline recip_square

cdef inline double recip_square(int i):
    return 1./(i*i)

def approx_pi(int n=10000000):
    cdef double val = 0.
    cdef int k
    for k in range(1,n+1):
        val += recip_square(k)
    return (6 * val)**.5
