function fish_prompt
	# Print out the exit code if nonzero (errno from moreutils)
	set -l exit "$status"
	if test $exit -ne 0
		printf "\r("
		begin
			errno $exit; or printf "exited with status %s" $exit;
		end | tr -d '\n'
		printf ")\n"
	end

	# Actual prompt
	printf "\r"
	set_color -o
	printf "%s ―――― " (prompt_pwd)
	set_color normal
end
