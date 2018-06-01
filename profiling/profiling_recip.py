#!/usr/bin/env python
# encoding: utf-8
# filename: profiling_recip.py

import pstats, cProfile

import pyximport
pyximport.install()

import pi_recip

cProfile.runctx("pi_recip.approx_pi()", globals(), locals(), "Profile_cy.prof")

s = pstats.Stats("Profile_cy.prof")
s.strip_dirs().sort_stats("time").print_stats()

# Tue May 22 18:00:45 2018    Profile_cy.prof
#          10000005 function calls in 1.898 seconds
#    Ordered by: internal time
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    1.242    1.242    1.898    1.898 pi_recip.pyx:10(approx_pi)
#  10000000    0.656    0.000    0.656    0.000 pi_recip.pyx:7(recip_square)
#         1    0.000    0.000    1.898    1.898 {built-in method builtins.exec}
#         1    0.000    0.000    1.898    1.898 {pi_recip.approx_pi}
#         1    0.000    0.000    1.898    1.898 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
