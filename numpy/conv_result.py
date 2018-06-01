# run line by line in iPython

# import numpy as np
# import conv_py
# conv_py.naive_convolve(np.array([[1, 1, 1]], dtype=np.int),
# 	np.array([[1],[2],[1]], dtype=np.int))

# import conv_cy
# conv_cy.naive_convolve(np.array([[1, 1, 1]], dtype=np.int),
# 	np.array([[1],[2],[1]], dtype=np.int))

import numpy as np
N = 100
f = np.arange(N*N, dtype=np.int).reshape((N,N))
g = np.arange(81, dtype=np.int).reshape((9, 9))

import conv_py # origin Python
%timeit conv_py.naive_convolve(f, g)
# 539 ms ± 22.9 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

import conv_cy # origin Cython
%timeit conv_cy.naive_convolve(f, g)
# 410 ms ± 2.23 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

import conv_ty # static typed parameters and variables
%timeit conv_ty.naive_convolve(f, g)
# 413 ms ± 3.17 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

import conv_lv # static typed local variables
%timeit conv_lv.naive_convolve(f, g)
# 405 ms ± 5.1 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

import conv_ei # efficient indexing
%timeit conv_ei.naive_convolve(f, g)
# 2.09 ms ± 11.5 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)

import conv_mv # memory views
%timeit conv_mv.naive_convolve(f, g)
# 2.05 ms ± 6.56 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)

import conv_nbc # no boundary check
%timeit conv_nbc.naive_convolve(f, g)
# 1.09 ms ± 19 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)

import conv_cl # clean the code, and C-contiguous array
%timeit conv_cl.naive_convolve(f, g)
# 1.03 ms ± 34.3 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)

import conv_ft # fused type
%timeit conv_ft.naive_convolve(f, g)
# 746 µs ± 2.73 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)

import conv_mv_nbc # memory views with no boundary check
%timeit conv_mv_nbc.naive_convolve(f, g)
# 685 µs ± 4.19 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)
