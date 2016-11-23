#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SHORT_DIR_LEN 2

// Argument: Full working directory ("/home/user/some/random/directory")
// Output: working directory shortened like fish ("~/s/r/directory")
// (yes, sed would've been easier)

int main(int argc, char** argv)
{
	if (argc > 2)
	{
		fprintf(stderr, "prompt_pwd: Need 0 or 1 args (path to shorten)\n");
		exit(1);
	}

	char* home_dir = getenv("HOME");
	if (home_dir == NULL)
	{
		fprintf(stderr, "prompt_pwd: $HOME unset\n");
		exit(1);
	}

	char* last_slash = NULL;
	char* input_start = argv[1];

	// If the string begins with $HOME, replace that with ~
	if (strstr(input_start, home_dir) == input_start)
	{
		input_start += strlen(home_dir);
		putchar('~');
	}

	for (char* it = input_start; *it; it++)
	{
		// If it's a (non-trailing) slash, print it and the next few chars
		if (*it == '/' && *(it + 1))
		{
			last_slash = it;
			putchar(*it);
			it++;

			while (it <= (last_slash + SHORT_DIR_LEN) && *it != '/')
			{
				putchar(*it);
				it++;
			}

			// So we're right before the slash again
			it--;
		}

		// If we're at the end...
		if (*(it + 1) == '\0')
		{
			if (last_slash == NULL)
			{
				fprintf(stderr, "prompt_pwd: String contained no slash\n");
				// Just print the whole string
				last_slash = input_start;
			}

			// ...print the string between the last slash and the end
			// ( = basename of working directory)
			// + 1 + n because we already printed the slash and the first n chars
			for (char* i = last_slash + 1 + SHORT_DIR_LEN; *i; i++)
			{
				putchar(*i);
			}
		}
	}

	return 0;
}
