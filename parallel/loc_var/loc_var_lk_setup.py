from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules = [
	Extension(
		"loc_var_lk",
		["loc_var_lk.pyx"],
		extra_compile_args=['-fopenmp'],
		extra_link_args=['-fopenmp']
	)
]

setup(
	name='loc_var_lk',
	ext_modules=cythonize(ext_modules)
)