# Extension types (aka. cdef classes)

from cmath cimport sin

cdef class Function:
    cpdef double evaluate(self, double x) except *:
        return 0

cdef class SinOfSquareFunction(Function):
    cpdef double evaluate(self, double x) except *:
        return sin(x**2)

cpdef integrate(Function f, double a, double b, int N):
    cdef int i
    cdef double s, dx
    if f is None:
        raise ValueError("f cannot be None")
    s = 0
    dx = (b-a)/N
    for i in range(N):
        s += f.evaluate(a+i*dx)
    return s * dx

print('>>> integrate(SinOfSquareFunction(), 0, 1, 10000)')
print(integrate(SinOfSquareFunction(), 0, 1, 10000))
