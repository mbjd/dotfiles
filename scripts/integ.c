#include <stdio.h>
#include <string.h>

int
main()
{
	double sum     = 0;
	double current = 0;
	int ret = 0;
	char line[64];

	while (fgets(line, 64, stdin) != NULL)
	{
		line[strcspn(line, "\n")] = '\0'; // Replace first newline by null delimiter
		ret = sscanf(line, "%lf\n", &current);
		if (ret != 1)
		{
			fprintf(stderr, "Could not convert '%s' to number\n", line);
			continue;
		}
		sum += current;
		printf("%lf\n", sum);
	}
}
