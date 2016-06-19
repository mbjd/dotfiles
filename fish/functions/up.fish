function up
	if count $argv > /dev/null
		for i in (seq $argv[1])
			cd ..
		end
	else
		cd ..
	end
end
