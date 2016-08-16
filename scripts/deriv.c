#include <stdio.h>
#include <string.h>

int
main()
{
	double old = 0, current = 0;
	int counter = 0;
	int ret = 0;
	char line[64];

	while (fgets(line, 64, stdin) != NULL)
	{
		line[strcspn(line, "\n")] = '\0'; // Replace first newline by null delimiter
		ret = sscanf(line, "%lf", &current); // Try to parse one float
		if (ret == 0)
		{
			// If that didn't happen, print an error message
			fprintf(stderr, "Could not convert '%s' to number\n", line);
			continue;
		}

		if (counter)
		{
			printf("%lf\n", current - old);
		}
		old = current;
		counter++;
	}
}
