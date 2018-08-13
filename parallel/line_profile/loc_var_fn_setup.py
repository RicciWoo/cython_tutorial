from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
# from Cython.Compiler.Options import get_directive_defaults

# directive_defaults = get_directive_defaults()
# directive_defaults['linetrace'] = True
# directive_defaults['binding'] = True

ext_modules = [
	Extension(
		"loc_var_fn",
		["loc_var_fn.pyx"],
		# define_macros=[('CYTHON_TRACE', '1')],
		extra_compile_args=['-fopenmp'],
		extra_link_args=['-fopenmp']
	)
]

setup(
	name='loc_var_fn',
	ext_modules=cythonize(ext_modules)
)