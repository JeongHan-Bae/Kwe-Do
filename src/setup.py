from setuptools import setup
from Cython.Build import cythonize
from distutils.extension import Extension

ext_modules = [
    Extension("shuffle", ["shuffle.pyx"]),
    Extension("orbit", ["orbit.pyx"]),
]

setup(
    ext_modules=cythonize(ext_modules)
)
