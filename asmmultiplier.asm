extern printf

section .data
	num1 dq 125
	num2 dq 13
	
	string1 db "The two input numbers are %d and %d.", 10, 0
	string2 db "The result of multiplying them together with the built in x86 instruction is %d."
	
section .bss
section .text
	global main
	
main:
	push rbp
	mov rbp, rsp

	mov rdi, string1
	mov rsi, [num1]
	mov rdx, [num2]
	call printf
	
	mov rax, [num1]
	mov rbx, [num2]
	imul rax, rbx
	
	mov rdi, string2
	mov rsi, rax
	call printf
	
	leave
	ret
	
		
