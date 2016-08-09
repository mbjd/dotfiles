function pylog --description 'Plot newline-separated numbers from stdin'
	topylist | python -c 'import matplotlib.pyplot as pl; import sys; data = eval(sys.stdin.readlines()[0]); pl.semilogy(data); pl.show()'
end
