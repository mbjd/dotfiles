#include <stdio.h>

extern FILE* stdin;

int main()
{
	double old = 0, current = 0;
	int counter = 0;
	char line[64];

	while(fgets(line, 64, stdin) != NULL)
	{
		sscanf(line, "%lf\n", &current);
		if (counter)
		{
			printf("%f\n", current - old);
		}
		old = current;
		counter++;
	}
}
