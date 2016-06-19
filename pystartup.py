import sys
import os

# bold='\001\033[1;31m\002'
# reset='\001\033[0m\002'
# sys.ps1 = '{}>>> {}'.format(bold, reset)
# sys.ps2 = '{}... {}'.format(bold, reset)

import subprocess

def copy(text):
	# copy a string to the clipboard
	p = subprocess.Popen(['pbcopy', 'w'], stdin=subprocess.PIPE, close_fds=True)
	p.communicate(input=text.encode('utf-8'))

def paste():
	# paste a string from the clipboard
	p = subprocess.Popen(['pbpaste', 'r'], stdout=subprocess.PIPE, close_fds=True)
	stdout, stderr = p.communicate()
	return stdout.decode('utf-8')
