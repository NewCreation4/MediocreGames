#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define ARRAY_SIZE(array) sizeof(array) / sizeof(array[0])

typedef enum {
	UNKNOWN, EMPTY, WALL, LAVA, GOAL, PLAYER
} Tile;

typedef struct {
	unsigned width, height, size;
	Tile *data;
} Map;

char get_symbol(Tile tile) {
	static const char symbols[] = {'\0', '.', '@', '!', '$', '&'};
	if (tile >= ARRAY_SIZE(symbols)) return symbols[0];
	return symbols[tile];
}

Tile get_tile(char c) {
	static const char symbols[] = {'\0', '.', '@', '!', '$', '&'};
	for (unsigned i=0;i<ARRAY_SIZE(symbols);i++)
		if (c == symbols[i]) return i;
	return UNKNOWN;
}

Map new_map(unsigned width, unsigned height) {
	Map map = {
		width, height, width * height, malloc(sizeof(Tile) * width * height)
	};
	return map;
}

void map_file_proportions(FILE *file, Map *map) {
	char c;
	bool width_found = false;
	while ((c = getc(file)) != 255) {
		if (get_tile(c) && !width_found) map->width++;
		else if (c == '\n') {
			map->height++;
			if (map->width) width_found = true;
		}
	}
	map->size = map->width * map->height;
	rewind(file);
}

Map load_map_file(const char *filepath) {
	FILE *file = fopen(filepath, "r");
	if (!file) {
		perror(filepath);
		exit(1);
	}

	Map map;
	map_file_proportions(file, &map);
	map.data = malloc(sizeof(Tile) * map.width * map.height);
	char c;
	printf("map size: %ux%u\n", map.width, map.height);
	for (unsigned i=0;(c = fgetc(file)) != 255;) {
		if (get_tile(c)) map.data[i++] = get_tile(c);
	}
	return map;
}

void draw_map(Map map) {
	unsigned line = 0;
	for (unsigned i=0;i<map.size;i++) {
		printf("%c", get_symbol(map.data[i]));
		line++;
		if (line == map.width) {
			printf("\n");
			line = 0;
		}
	}
}

int main() {
	/*Map map = new_map(60, 10);
	for (unsigned i=0;i<map.size;i++) {
		map.data[i] = EMPTY;
	}*/
	Map map = load_map_file("map.txt");
	draw_map(map);
	return 0;
}
