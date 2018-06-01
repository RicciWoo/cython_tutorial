from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules = [
	Extension(
		"simple_mp",
		["simple_mp.pyx"],
		extra_compile_args=['-fopenmp'],
		extra_link_args=['-fopenmp']
	)
]

setup(
	name='simple_mp',
	ext_modules=cythonize(ext_modules)
)