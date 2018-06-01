echo python -m timeit -s 'from example_py import primes_python' 'primes_python(1000)'
python -m timeit -s 'from example_py import primes_python' 'primes_python(1000)'
# 100 loops, best of 3: 15.9 msec per loop

echo python -m timeit -s 'from example_py_cy import primes_python_compiled' 'primes_python_compiled(1000)'
python -m timeit -s 'from example_py_cy import primes_python_compiled' 'primes_python_compiled(1000)'
# 100 loops, best of 3: 16.1 msec per loop

echo python -m timeit -s 'from primes import primes' 'primes(1000)'
python -m timeit -s 'from primes import primes' 'primes(1000)'
# 100 loops, best of 3: 2.28 msec per loop
