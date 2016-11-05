C_FILES = $(wildcard *.c)
TARGETS = $(basename $(C_FILES))

all: $(TARGETS)

%: %.c
	gcc -std=c99 -Wall -Wextra -pedantic $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGETS)
