
In [4]: import simple_ty

In [5]: import simple_mp

In [7]: %timeit simple_ty.array_double(10000, 10000)
2.1 s ± 4.33 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

In [6]: %timeit simple_mp.array_double(10000, 10000)
18.7 s ± 577 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

on silo

In [1]: import simple_mp

In [2]: %timeit simple_mp.array_double(10000, 100000)
6.28319290606305
6.183202902786434
6.136370024178177
6.152815266046673
6.317969774827361
6.211338913068175
6.131546791177243
6.1789824068546295
6.22 s ± 59.6 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

In [3]: import simple_ty

In [4]: %timeit simple_ty.array_double(10000, 100000)
21.164865599945188
21.142365084961057
21.76178804412484
21.200725719332695
21.144986958708614
21.13145233783871
21.134390539024025
21.12868337612599
21.3 s ± 216 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

In [1]: import simple_ty

In [2]: import simple_mp

In [4]: %timeit simple_ty.array_double(10000, 100000)
6.990659277886152
6.977306555956602
6.973502818495035
6.8787801349535584
6.933655049651861
6.936097728088498
6.983286367729306
6.960490135475993
21.5 s ± 67.9 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

In [5]: %timeit simple_mp.array_double(10000, 100000)
0.7506735101342201
0.724775948561728
0.5093528786674142
0.679736421443522
0.6509413067251444
0.6230809492990375
0.6717279469594359
0.6605794718489051
6.24 s ± 82.9 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
