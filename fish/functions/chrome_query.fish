function chrome_query --description 'Run an SQLite3 query on the chrome history database'
	sqlite3 (cat ~/Library/Application\ Support/Google/Chrome/Default/History | psub) $argv[1]
end
