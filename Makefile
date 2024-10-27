ASM = nasm
LINKER = gcc
ASM_FLAGS = -f elf64

OBJS = build/app.o build/matematicas.o build/enysa.o build/error_handler.o build/textoarchivo.o

all: calculadora

calculadora: $(OBJS)
	$(LINKER) -o calculadora $(OBJS) -no-pie -g

build/app.o: requerimientos/app.asm
	$(ASM) $(ASM_FLAGS) -o build/app.o requerimientos/app.asm

build/matematicas.o: requerimientos/matematicas.asm
	$(ASM) $(ASM_FLAGS) -o build/matematicas.o requerimientos/matematicas.asm

build/enysa.o: requerimientos/enysa.asm
	$(ASM) $(ASM_FLAGS) -o build/enysa.o requerimientos/enysa.asm

build/error_handler.o: requerimientos/error_handler.asm
	$(ASM) $(ASM_FLAGS) -o build/error_handler.o requerimientos/error_handler.asm

build/textoarchivo.o: requerimientos/textoarchivo.asm
	$(ASM) $(ASM_FLAGS) -o build/textoarchivo.o requerimientos/textoarchivo.asm

clean:
	rm -f build/*.o calculadora
