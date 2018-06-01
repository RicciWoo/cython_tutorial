# cheesy.pyx
cdef class CheeseShop:

    cdef object cheeses

    def __cinit__(self):
        self.cheeses = []

    @property
    def cheese(self):
        return "We don't have: %s" % self.cheeses

    @cheese.setter
    def cheese(self, value):
        self.cheeses.append(value)

    @cheese.deleter
    def cheese(self):
        del self.cheeses[:]