function pyspec --description 'Display a spectrogram of newline-separated numbers from stdin'
	topylist | python -c 'import matplotlib.pyplot as pl; import sys; data = eval(sys.stdin.readlines()[0]); pl.specgram(data); pl.show()'
end
