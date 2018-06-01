In [1]: from thread_demo import *

In [2]: import numpy as np

In [3]: X = -1 + 2*np.random.rand(10000000)

In [4]: %timeit array_f(X)
149 ms ± 714 µs per loop (mean ± std. dev. of 7 runs, 1 loop each)

In [5]: %timeit c_array_f(X)
72.4 ms ± 325 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)

In [6]: %timeit c_array_f_multi(X)
110 ms ± 1.59 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)