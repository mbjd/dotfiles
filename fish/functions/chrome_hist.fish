function chrome_hist --description 'see which websites have been opened most in chrome'
	sqlite3 "/Users/balduin/Library/Application Support/Google/Chrome/Default/History" 'select * from urls' | cut -d'|' -f2 | cut -d'/' -f3 | sort | uniq -c | sort -nr | less
end
