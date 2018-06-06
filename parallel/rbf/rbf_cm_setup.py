from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_modules=[ Extension("rbf_cm",
              ["rbf_cm.pyx"],
              libraries=["m"],
              extra_compile_args = ["-ffast-math"])]

setup(
  name = "rbf_cm",
  cmdclass = {"build_ext": build_ext},
  ext_modules = ext_modules)