cdef extern from "Rectangle.h" namespace "shapes":
    cdef cppclass Rectangle:
        Rectangle() except +
        Rectangle(int, int, int, int) except +
        int x0, y0, x1, y1
        int getArea()
        void getSize(int* width, int* height)
        void move(int, int)

rec_ptr = new Rectangle(1, 2, 3, 4)
try:
    recArea = rec_ptr.getArea()
finally:
    del rec_ptr     # delete heap allocated object