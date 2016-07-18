function fish_colors
	for i in (set_color -c)
		set_color $i
		echo $i
	end
end
