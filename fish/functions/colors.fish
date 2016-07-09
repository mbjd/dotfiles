function colors
	if set -q argv[1]
		set times $argv[1]
	else
		set times 16
	end

	for i in (seq 1 $times)
		tput setaf $i; echo "Color #$i";
	end
end
