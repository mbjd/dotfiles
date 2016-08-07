function up
	if count $argv > /dev/null
		set cdstr ''
		for i in (seq $argv[1])
			set cdstr "$cdstr../"
		end
		cd $cdstr
	else
		cd ..
	end
end
