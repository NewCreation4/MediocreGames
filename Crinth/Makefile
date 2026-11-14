CC = clang
CFLAGS = -Wall -Wextra -Wshadow -fsanitize=address -g -ggdb
LDLIBS =
BIN = main

$(BIN): main.c game.c game.h
	$(CC) $(CFLAGS) $(LDLIBS) game.c main.c -o $(BIN)
