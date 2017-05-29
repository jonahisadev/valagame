CC = valac
PKG = --pkg=gtk+-3.0
SRC = $(wildcard src/*.vala)
EXEC = game

all: $(EXEC)

$(EXEC):
	$(CC) $(PKG) $(SRC)

clean:
	rm -rf $(EXEC)