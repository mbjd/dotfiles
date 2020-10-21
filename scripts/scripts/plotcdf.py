#!/usr/bin/env python

import sys
import numpy as np
import matplotlib.pyplot as pl

A = np.loadtxt('/dev/stdin', delimiter=',')
if len(A.shape) > 1:
	print('plotpdf: input multidimensional - flattening :(')

A = np.sort(A)

ys = np.linspace(0, 1, A.shape[0])
pl.plot(A, ys)
pl.show()
