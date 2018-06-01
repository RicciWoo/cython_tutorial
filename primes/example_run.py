from primes import primes
from example_py import primes_python
from example_py_cy import primes_python_compiled

print('>>> primes_python(1000) == primes(1000)')
print(primes_python(1000) == primes(1000))
print('>>> primes_python_compiled(1000) == primes(1000)')
print(primes_python_compiled(1000) == primes(1000))
