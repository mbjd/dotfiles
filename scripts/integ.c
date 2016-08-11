#include <stdio.h>

extern FILE* stdin;

int
main()
{
	double sum     = 0;
	double current = 0;
	char line[64];

	while (fgets(line, 64, stdin) != NULL)
	{
		sscanf(line, "%lf\n", &current);
		sum += current;
		printf("%lf\n", sum);
	}
}
