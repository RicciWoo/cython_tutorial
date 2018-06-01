# Attributes in cdef classes behave differently from 
# attributes in regular classes:
#   - All attributes must be pre-declared at compile-time
#   - Attributes are by default only accessible from Cython 
#     (typed access)
#   - Properties can be declared to expose dynamic attributes 
#     to Python-space

cdef class WaveFunction(Function):
    # Not available in Python-space:
    cdef double offset
    # Available in Python-space:
    cdef public double freq
    # Available in Python-space:
    @property
    def period(self):
        return 1.0 / self.freq
    @period.setter
    def period(self, value):
        self.freq = 1.0 / value
    # <...>
