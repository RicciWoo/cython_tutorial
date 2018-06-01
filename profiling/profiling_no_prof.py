#!/usr/bin/env python
# encoding: utf-8
# filename: profiling_recip.py

import pstats, cProfile

import pyximport
pyximport.install()

import pi_no_prof

cProfile.runctx("pi_no_prof.approx_pi()", globals(), locals(), "Profile_cy.prof")

s = pstats.Stats("Profile_cy.prof")
s.strip_dirs().sort_stats("time").print_stats()

# Tue May 22 18:04:56 2018    Profile_cy.prof
#          5 function calls in 0.075 seconds
#    Ordered by: internal time
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.075    0.075    0.075    0.075 pi_no_prof.pyx:13(approx_pi)
#         1    0.000    0.000    0.075    0.075 {built-in method builtins.exec}
#         1    0.000    0.000    0.075    0.075 {pi_no_prof.approx_pi}
#         1    0.000    0.000    0.075    0.075 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
