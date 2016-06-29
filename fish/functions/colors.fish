function colors
	set times 16

	if test -n $argv[1]
		set times $argv[1]
	end

	for i in (seq 1 $times)
		tput setaf $i; echo "Color #$i";
	end
end
