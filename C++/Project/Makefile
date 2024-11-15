# Répertoires
SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj

# Fichiers sources
# Ajouter main.cpp aux fichiers sources
SRCS = $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(SRC_DIR)/*/*.cpp) main.cpp

# Fichiers objets
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

# Fichier exécutable
TARGET = my_program.exe

# Options du compilateur
CXX = g++
CXXFLAGS = -I$(INC_DIR) -Wall -Wextra -std=c++17

# Règles de construction
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@if not exist $(OBJ_DIR) mkdir $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Nettoyage des fichiers objets et de l'exécutable
clean:
	del /Q $(OBJ_DIR)\*.o $(TARGET)

# Commande pour lancer le programme
run: $(TARGET)
	$(TARGET)
