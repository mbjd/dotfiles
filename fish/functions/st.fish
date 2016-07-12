function st --description 'Print out last exit code and return it again'
	set s $status
	echo $s $argv;
	return $s
end
