CC = clang
CFLAGS = -Wall -Wextra -Wshadow -fsanitize=address -g -ggdb
LDLIBS = -lncurses
BIN = main

$(BIN): main.c
	$(CC) $(CFLAGS) $(LDLIBS) main.c -o $(BIN)
