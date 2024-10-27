ASM = nasm
LINKER = gcc
ASM_FLAGS = -f elf64

OBJS = build/main.o build/math.o build/io.o build/error_handler.o build/messages.o

all: calculadora

calculadora: $(OBJS)
	$(LINKER) -o calculadora $(OBJS) -no-pie -g

build/main.o: requerimientos/main.asm
	$(ASM) $(ASM_FLAGS) -o build/main.o requerimientos/main.asm

build/math.o: requerimientos/math.asm
	$(ASM) $(ASM_FLAGS) -o build/math.o requerimientos/math.asm

build/io.o: requerimientos/io.asm
	$(ASM) $(ASM_FLAGS) -o build/io.o requerimientos/io.asm

build/error_handler.o: requerimientos/error_handler.asm
	$(ASM) $(ASM_FLAGS) -o build/error_handler.o requerimientos/error_handler.asm

build/messages.o: include/messages.asm
	$(ASM) $(ASM_FLAGS) -o build/messages.o include/messages.asm

clean:
	rm -f build/*.o calculadora