function pyspec --description 'Display a spectrogram of newline-separated numbers from stdin'
	topylist | python -c 'import matplotlib.pyplot as pl; from scipy.signal import detrend; import sys; data = eval(sys.stdin.readlines()[0]); pl.specgram(data, detrend=detrend); pl.show()'
end
