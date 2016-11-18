#include <stdio.h>
#include <string.h>

int
main()
{
	double sum     = 0;
	double current = 0;
	int ret = 0;
	char line[64];

	setbuf(stdout, NULL);

	while (fgets(line, 64, stdin) != NULL)
	{
		line[strcspn(line, "\n")] = '\0'; // Replace first newline by null delimiter
		ret = sscanf(line, "%lf\n", &current);
		if (ret != 1)
		{
			fprintf(stderr, "integ: Could not convert '%s' to number\n", line);
			continue;
		}
		sum += current;
		printf("%lf\n", sum);
	}
}
