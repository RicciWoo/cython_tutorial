cimport numpy as np
from cython.parallel cimport *

def f(np.ndarray[double] x, double alpha):
    cdef double s = 0
    cdef double tmp
    cdef int i, n = x.shape[0]
    with nogil:
        for i in prange(n):
            # alpha is only read, so shared
            # tmp assigned before being used -> safe and natural to make it implicitly thread-private
            tmp = alpha * i
            s += x[i] * tmp # turns into reduction + thread-private
        s += tmp * 10 # after the loop we emulate sequential loop execution(OpenMP lastprivate)
    return s