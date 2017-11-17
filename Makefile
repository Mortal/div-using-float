CFLAGS := -Wall -Wextra -O2 -std=c99

all: main arraydiv.s

main: main.o arraydiv.o

arraydiv.s: arraydiv.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $<
