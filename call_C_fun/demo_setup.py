# Dynamic linking
# The libc math library is not linked by default on some 
# Unix-like systems, such as Linux. You must configure 
# your build system to link against the shared library m.

from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules=[
	Extension("demo", 
			  sources=["demo.pyx"],
			  libraries=["m"]
	)
]

setup(
	name = "Demo", 
	ext_modules=cythonize(ext_modules)
)