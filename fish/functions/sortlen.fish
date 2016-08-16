function sortlen
	cat $argv | sed 's/^[ \t]*//g' | awk '{printf("%d:%s\n", length, $0)}' | sort -n | cut -d':' -f2-
end
