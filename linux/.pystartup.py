import sys
import os

import subprocess

np = pl = 0

def copy(text):
	# copy a string to the clipboard
	p = subprocess.Popen(['xclip', '-selection', 'clipboard', '-i'], stdin=subprocess.PIPE, close_fds=True)
	p.communicate(input=text.encode('utf-8'))

def paste():
	# paste a string from the clipboard
	p = subprocess.Popen(['xclip', '-selection', 'clipboard', '-o'], stdout=subprocess.PIPE, close_fds=True)
	stdout, stderr = p.communicate()
	return stdout.decode('utf-8')

def fetz():
	global np
	global pl
	import numpy as np
	import matplotlib.pyplot as pl

def print_latex_complex(z):
	real = np.real(z)
	imag = np.imag(z)
	abso = np.abs(z)
	angl = np.angle(z, deg=True)
	return '\\SI{{{:.3f}}}{{\\ohm}} + \\mathrm{{j}}\\SI{{{:.3f}}}{{\\ohm}} = \\SI{{{:.3f}}}{{\\ohm}} \\cdot \\mathrm{{e}}^{{-\\mathrm{{j}} \\ang{{{:.3f}}}}}'.format(real, imag, abso, angl)
