from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules = [
	Extension(
		"loc_var_fn",
		["loc_var_fn.pyx"],
		extra_compile_args=['-fopenmp'],
		extra_link_args=['-fopenmp']
	)
]

setup(
	name='loc_var_fn',
	ext_modules=cythonize(ext_modules)
)