#format is target-name: target dependencies
#{-tab-}actions

# All Targets
all: ass3

# Tool invocations
# Executable "hello" depends on the files main.o and asm.o.
ass3: ass3.o scheduler.o printer.o drone.o target.o
	gcc -m32 -g -Wall -o ass3 ass3.o scheduler.o printer.o drone.o target.o

 
ass3.o: ass3.s
	nasm -g -f elf32 -w+all -o ass3.o ass3.s
scheduler.o: scheduler.s
	nasm -g -f elf32 -w+all -o scheduler.o scheduler.s
printer.o: printer.s
	nasm -g -f elf32 -w+all -o printer.o printer.s
drone.o: drone.s
	nasm -g -f elf32 -w+all -o drone.o drone.s
target.o: target.s
	nasm -g -f elf32 -w+all -o target.o target.s

#tell make that "clean" is not a file name!
.PHONY: clean

#Clean the build directory
clean: 
	rm -f *.o ass3
