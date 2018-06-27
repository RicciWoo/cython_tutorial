from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules = [
	Extension(
		"lock_fn",
		["lock_fn.pyx"],
		extra_compile_args=['-fopenmp'],
		extra_link_args=['-fopenmp']
	)
]

setup(
	name='lock_fn',
	ext_modules=cythonize(ext_modules)
)