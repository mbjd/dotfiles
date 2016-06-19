function centered_print --argument text
	echo $text | fmt -c -w $COLUMNS
end
