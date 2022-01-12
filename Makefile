SRC_DIR := src
OBJ_DIR := bin
SRC_FILES := $(shell find . -name '*.cpp') #$(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst ./$(SRC_DIR)/%.cpp,./$(OBJ_DIR)/%.o,$(SRC_FILES))
LDFLAGS := 
CPPFLAGS := -std=c++17
CXXFLAGS := -D FREEGLUT_STATIC -I"include"
TERMINALLESS := -Wl,--subsystem,windows
OPENGLFLAGS := -L"lib/x64" -lglfw3 -lopengl32 -lmingw32 -lgdi32 -luser32 #$(TERMINALLESS)
STATICFLAGS := -static-libgcc -static-libstdc++ -static

all:	clear compileMain

compileMain:	main.exe

main.exe:	$(OBJ_FILES)
	g++ -o $@ $^ $(OPENGLFLAGS) $(STATICFLAGS)

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.cpp
	mkdir -p $(@D)
	g++ $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<

clear:
	rm -r -f bin/*