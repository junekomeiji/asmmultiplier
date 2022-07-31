asmmultiplier: asmmultiplier.o
	gcc -g -o asmmultiplier asmmultiplier.o -no-pie

asmmultiplier.o: asmmultiplier.asm
	nasm -f elf64 -g -F dwarf asmmultiplier.asm -l asmmultiplier.lsh
	
