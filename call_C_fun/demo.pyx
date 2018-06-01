# Calling C functions

from libc.stdlib cimport atoi

cdef parse_charptr_to_py_int(char* s):
	assert s is not NULL, "byte string value is NULL"
	return atoi(s)   # note: atoi() has no error detection!

cdef char* ch = "58"
# cdef char* ch = "g"
print('>>> parse_charptr_to_py_int(ch)')
print(parse_charptr_to_py_int(ch))

from cpython.version cimport PY_VERSION_HEX

# Python version >= 3.2 final ?
print('>>> PY_VERSION_HEX >= 0x030200F0')
print(PY_VERSION_HEX >= 0x030200F0)

from libc.math cimport sin

cdef double f_sin(double x):
	return sin(x*x)

print('>>> f_sin(0.999)')
print(f_sin(0.999))

# Dynamic linking
# The libc math library is not linked by default on some 
# Unix-like systems, such as Linux. You must configure 
# your build system to link against the shared library m.

# External declarations

cdef extern from "math.h":
	cpdef double cos(double x)

cdef double f_cos(double x):
	return cos(x*x)

print('>>> f_cos(0.999)')
print(f_cos(0.999))

# Naming parameters

cdef extern from "string.h":
	char* strstr(const char *haystack, const char *needle)

cdef char* data = "hfvcakdfagbcffvschvxcdfgccbcfhvgcsnfxjh"

cdef char* pos = strstr(needle='akd', haystack=data)
print(">>> strstr(needle='akd', haystack=data) != NULL")
print(pos != NULL)
