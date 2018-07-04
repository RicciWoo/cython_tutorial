from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules = [
	Extension(
		"loc_var_or",
		["loc_var_or.pyx"],
		extra_compile_args=['-fopenmp'],
		extra_link_args=['-fopenmp']
	)
]

setup(
	name='loc_var_or',
	ext_modules=cythonize(ext_modules)
)