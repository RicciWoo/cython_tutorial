#!/usr/bin/env python
# encoding: utf-8
# filename: profiling_cy.py

import pstats, cProfile

import pyximport
pyximport.install()

import pi_cy

cProfile.runctx("pi_cy.approx_pi()", globals(), locals(), "Profile_cy.prof")

s = pstats.Stats("Profile_cy.prof")
s.strip_dirs().sort_stats("time").print_stats()

# Tue May 22 17:57:01 2018    Profile_cy.prof
#          10000005 function calls in 2.538 seconds
#    Ordered by: internal time
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    1.890    1.890    2.538    2.538 pi_cy.pyx:10(approx_pi)
#  10000000    0.648    0.000    0.648    0.000 pi_cy.pyx:7(recip_square)
#         1    0.000    0.000    2.538    2.538 {built-in method builtins.exec}
#         1    0.000    0.000    2.538    2.538 {pi_cy.approx_pi}
#         1    0.000    0.000    2.538    2.538 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
