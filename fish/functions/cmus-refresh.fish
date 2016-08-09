function cmus-refresh --description 'Add all iTunes music to cmus library'
	set dir "$HOME/Music/iTunes/iTunes Media/Music"
	begin
		find $dir -type f -name '*.mp3'
		find $dir -type f -name '*.MP3'
		find $dir -type f -name '*.m4a'
		find $dir -type f -name '*.wav'
	end > ~/.config/cmus/lib.pl
end
