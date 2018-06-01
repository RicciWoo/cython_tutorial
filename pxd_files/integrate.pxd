cdef class Function:
    cpdef double evaluate(self, double x) except *

cpdef integrate(Function f, double a, double b, int N)
