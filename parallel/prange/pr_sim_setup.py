from distutils.core import setup
from Cython.Build import cythonize

setup(name="pr_sim", ext_modules=cythonize('pr_sim.pyx'),)