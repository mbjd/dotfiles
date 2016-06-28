function centered_print
	set width (tput cols)
	set textlen (echo $argv | awk '{print length}')

	set spaces (math '0.5 * ('(tput cols) - $textlen')' | sed 's/\..*//g')

	printf '%*s' $spaces

	echo $argv
end
