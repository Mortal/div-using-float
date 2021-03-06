CFLAGS := -Wall -Wextra -O2 -std=c99 -march=native

all: main arraydiv.s
.PHONY: all

clean:
	$(RM) main main.o arraydiv.s arraydiv.o
.PHONY: clean

main: main.o arraydiv.o

arraydiv.s: arraydiv.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $<

timings.txt: main
	./$^ > $@
