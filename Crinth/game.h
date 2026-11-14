#ifndef __GAME_H__
#define __GAME_H__

#define list_push(list, item) do { \
	if (list.size >= list.capacity) { \
		list.capacity *= 2; \
		list.items = realloc(list.items, list.capacity); \
	} \
	list.items[list.size++] = item; \
} while(0)

#define deref_list_push(list, item) do { \
	if (list->size >= list->capacity) { \
		list->capacity *= 2; \
		list->items = realloc(list->items, list->capacity); \
	} \
	list->items[list->size++] = item; \
} while(0)

typedef enum {
	EMPTY, WALL, LAVA, PLAYER, GOAL
} Tile;
extern const char *SYMBOLS[5];

typedef struct {
	unsigned size, capacity;
	Tile *items;
} Map;

#endif
