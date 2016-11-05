import sys
import os

import subprocess

def copy(text):
	# copy a string to the clipboard
	p = subprocess.Popen(['xclip', '-selection', 'clipboard', '-i'], stdin=subprocess.PIPE, close_fds=True)
	p.communicate(input=text.encode('utf-8'))

def paste():
	# paste a string from the clipboard
	p = subprocess.Popen(['xclip', '-selection', 'clipboard', '-o'], stdout=subprocess.PIPE, close_fds=True)
	stdout, stderr = p.communicate()
	return stdout.decode('utf-8')
