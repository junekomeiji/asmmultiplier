extern printf

section .data
	num1 db	125
	num2 db 13
	
	string1 db "The two input numbers are %d and %d.", 10, 0
	string2 db "The result of multiplying them together with the built in x86 instruction is %d."
	
section .bss
section .text
	global main
	
main:
	mov rsi, string1
	mov rdi, num1
	mov rdx, num2
	call printf
	
		
