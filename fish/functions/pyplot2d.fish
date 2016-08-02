function pyplot2d --description 'Plot a csv file with column 1 as x and 2 as y axis'
	#        Convert to tuples of (x, y)
	cat $argv | sed 's/^/(/g;s/$/)/g' | topylist | python -c 'import matplotlib.pyplot as pl; import sys; data = eval(sys.stdin.readlines()[0]); x, y = map(list, zip(*data)); pl.plot(x, y); pl.show()'
end

