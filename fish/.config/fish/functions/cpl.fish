function cpl
	#         last entry  strip date/time  copy
	history | head -n 1 | cut -d' ' -f4- | pbcopy
end
