function gittimes
	git log | grep '^Date' | awk '{print $5}'
end
