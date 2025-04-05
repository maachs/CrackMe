all: patcher replace_byte

BUILD_DIR = build

flags = -Wshadow -Winit-self -Wredundant-decls -Wcast-align -Wundef -Wfloat-equal -Winline -Wunreachable-code -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Weffc++ -Wmain -Wextra -Wall -g -pipe -fexceptions -Wcast-qual -Wconversion -Wctor-dtor-privacy -Wempty-body -Wformat-security -Wformat=2 -Wignored-qualifiers -Wlogical-op -Wno-missing-field-initializers -Wnon-virtual-dtor -Woverloaded-virtual -Wpointer-arith -Wsign-promo -Wstack-usage=8192 -Wstrict-aliasing -Wstrict-null-sentinel -Wtype-limits -Wwrite-strings -Werror=vla -D_DEBUG -D_EJUDGE_CLIENT_SIDE
replace_byte: replace_byte.exe
	replace_byte.exe

replace_byte.exe: $(BUILD_DIR)/replace_byte.o
	g++ $(BUILD_DIR)/replace_byte.o

replace_byte.o: replace_byte.cpp
	g++ -c $(flags) replace_byte.cpp

patcher:
	g++ patcher.cpp -o patcher.out -lsfml-graphics -lsfml-window -lsfml-system

clean:
	rm -rf *.o *.exe
