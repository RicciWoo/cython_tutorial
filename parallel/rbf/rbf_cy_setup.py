from distutils.core import setup
from Cython.Build import cythonize

setup(name="rbf_cy", ext_modules=cythonize('rbf_cy.pyx'),)