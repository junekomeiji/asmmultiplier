extern printf

section .data
	num1 dq 125
	num2 dq 13
	
	string1 db "The two input numbers are %d and %d.", 10, 0
	string2 db "The result of multiplying them together with the built in x86 instruction is %d.", 10, 0
	string3 db "The result of multiplying them together by only shift left is %d.", 10, 0
	
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
	
	mov rdi, [num1]
	mov rsi, [num2]
	call defaultmul
	
	mov rdi, string2
	mov rsi, rax
	call printf
	
	mov rdi, [num1]
	mov rsi, [num2]
	xor rax, rax
	xor r8, r8
	xor r9, r9
	call shlmul
	
	mov rdi, string3
	mov rsi, rax
	call printf
	
	leave
	ret
	
		
defaultmul:				; return value in rax
	push rbp
	mov rbp, rsp
	
	imul rdi, rsi
	mov rax, rdi
	
	leave
	ret
	
shlmul:
	push rbp
	mov rbp, rsp
	
	cmp rcx, 63
	je exit
	inc rcx
	
	shr rsi, 1
	jnc shlmul
	
	mov r8, rdi		; put in num 1

	mov r9, rcx		; put in counter
	dec r9			; counter - 1
	
	shl r8, [r9]		; shl r9 times
	add rax, r8
	
	
				
exit:
	leave
	ret
