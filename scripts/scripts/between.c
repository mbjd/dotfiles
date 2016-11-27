#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

// --- between ---
//
// Like cut, but lets you specify two different delimiters.
//
//     `between - .`
//
// will read each line, start printing after the start '-',
// and stop printing before the next '.'.
//
// In general, calling `between a b` should be equivalent to
// calling `cut -da -f2 | cut -db -f1`
//
// Empty strings can be given to indicate the start/end of a line,
// and `between '' ''` behaves like cat
//
// If the start character isn't in the line, nothing is printed;
// if the end one isn't, it will print until the end of the line.

#define NAME "between"
#define LINE_LENGTH 512

int
main(int argc, char** argv)
{
	if (argc != 3) {
		fprintf(stderr, "%s: Need two arguments\n", NAME);
		return EINVAL;
	}

	// Read in the two delimiter characters
	char start, end;
	{
		if (argv[1][0] == '\0' || argv[1][1] == '\0') {
			start = argv[1][0];
		}
		else {
			fprintf(stderr, "%s: start argument is longer than 1 char\n", NAME);
			return EINVAL;
		}

		if (argv[2][0] == '\0' || argv[2][1] == '\0') {
			end = argv[2][0];
		}
		else {
			fprintf(stderr, "%s: end argument is longer than 1 char\n",
			        NAME);
			return EINVAL;
		}
	}

	char line[LINE_LENGTH];
	char* current;
	char* const line_end = line + LINE_LENGTH;

	// Main loop
	while (fgets(line, LINE_LENGTH, stdin)) {
		current = line;

		// Skip up to the start delimiter, unless it's a NULL byte
		if (start) {
			while (*current != start && *current && current < line_end) {
				current++;
			}
			if (current == '\0' || current - line >= LINE_LENGTH) {
				// We arrived at the end of the line without
				// ever encountering $start
				continue;
			}
		}


		// If the start delimiter has been given, skip it
		// Otherwise print the first char too
		if (start) {
			current++;
		}

		// Now it's time to start printing until we encounter $end
		// If it's NULL this will just print until the end of the line
		while (*current != end && *current && current < line_end) {
			fputc(*current, stdout);
			current++;
		}

		// Print a newline if that hasn't happened yet
		if (*(current - 1) != '\n') {
			fputc('\n', stdout);
		}
	}
}
