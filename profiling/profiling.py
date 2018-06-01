#!/usr/bin/env python
# encoding: utf-8
# filename: profiling.py

import pstats, cProfile

import calc_pi

cProfile.runctx("calc_pi.approx_pi()", globals(), locals(), "Profile.prof")

s = pstats.Stats("Profile.prof")
s.strip_dirs().sort_stats("time").print_stats()

# Tue May 22 17:17:56 2018    Profile.prof
#          10000004 function calls in 6.192 seconds
#    Ordered by: internal time
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#  10000000    4.224    0.000    4.224    0.000 calc_pi.py:7(recip_square)
#         1    1.968    1.968    6.192    6.192 calc_pi.py:10(approx_pi)
#         1    0.000    0.000    6.192    6.192 {built-in method builtins.exec}
#         1    0.000    0.000    6.192    6.192 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
