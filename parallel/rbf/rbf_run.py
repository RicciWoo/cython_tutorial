import numpy as np
D = 5
N = 1000
X = np.array([np.random.rand(N) for d in range(D)]).T
beta = np.random.rand(N)
theta = 10

import rbf_py
# %timeit rbf_py.rbf_network(X, beta, theta)
# 5.52 s ± 76 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

from scipy.interpolate import Rbf
rbf = Rbf(X[:,0], X[:,1], X[:,2], X[:,3], X[:, 4], np.random.rand(N))
Xtuple = tuple([X[:, i] for i in range(D)])

# %timeit rbf(Xtuple)
# 343 ms ± 28.7 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

import rbf_cy
# %timeit rbf_cy.rbf_network(X, beta, theta)
# 133 ms ± 133 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)

import rbf_cm
# %timeit rbf_cm.rbf_network(X, beta, theta)
# 20.1 ms ± 99.8 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)

import rbf_cf
# %timeit rbf_cf.rbf_network(X, beta, theta)
# 20 ms ± 40.7 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)