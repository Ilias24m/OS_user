# Compilateur et options
CC = gcc
CFLAGS = -Wall -I/usr/include/SDL2 -D_REENTRANT
LDLIBS_SH13 = -lSDL2 -lSDL2_image -lSDL2_ttf -lpthread

# Exécutables
TARGETS = sh13 server

# Règle principale
all: $(TARGETS)

# Règle pour sh13
sh13: sh13.c
	$(CC) $(CFLAGS) -o $@ $< $(LDLIBS_SH13)

# Règle pour server
server: server.c
	$(CC) -o $@ $<

# Nettoyage
clean:
	rm -f *.o

fclean: clean
	rm -f $(TARGETS)

re: fclean all

help:
	@echo "Commandes disponibles :"
	@echo "  make ou make all     -> Compile sh13 et server"
	@echo "  make clean           -> Supprime les fichiers objets"
	@echo "  make fclean          -> Supprime les exécutables et les objets"
	@echo "  make re              -> Nettoie et recompile entièrement"
	@echo "  make help            -> Affiche cette aide"
