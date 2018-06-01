
In [4]: import simple_ty

In [5]: import simple_mp

In [7]: %timeit simple_ty.array_double(10000, 10000)
2.1 s ± 4.33 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

In [6]: %timeit simple_mp.array_double(10000, 10000)
18.7 s ± 577 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
